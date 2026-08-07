import json
import re
from datetime import date
from pathlib import Path
from typing import Optional
from urllib.parse import urlparse

radice = Path(__file__).resolve().parents[1]

# Il controllo è solo diagnostico: non modifica o elimina mai file del progetto.
residui_obsoleti = [
    radice / "main.tex",
    radice / "metadata.tex",
    radice / "commands.tex",
    radice / "ingegnerismo-formulario.cls",
    radice / "CHANGELOG.md",
    radice / "NOTICE.md",
    radice / "REPOSITORY_SETUP.md",
    radice / "NOTE-DI-VERSIONE.md",
    radice / "bootstrap-github.sh",
    radice / "trigger-bootstrap.txt",
    radice / "archive",
    radice / "frontmatter",
    radice / "backmatter",
    radice / "sections",
    radice / "tools",
    radice / "bootstrap",
    radice / ".github" / "workflows" / "build-pdf.yml",
    radice / ".github" / "workflows" / "bootstrap-source.yml",
    radice / ".github" / "ISSUE_TEMPLATE" / "errore-matematico.yml",
]
residui_presenti = [
    str(percorso.relative_to(radice))
    for percorso in residui_obsoleti
    if percorso.exists()
]
if residui_presenti:
    raise SystemExit("File o cartelle obsolete presenti: " + ", ".join(residui_presenti))

obbligatori = [
    radice / "formulario.tex",
    radice / "metadati.tex",
    radice / "comandi.tex",
    radice / "formulario-ingegnerismo.cls",
    radice / "formulario.json",
    radice / "README.md",
    radice / "CONTRIBUTING.md",
    radice / "CRONOLOGIA.md",
    radice / "GESTIONE-DEPOSITO-GIT.md",
    radice / "LINEE-GUIDA-GRAFICHE.md",
    radice / "strumenti" / "pubblica-versione.sh",
    radice / ".github" / "workflows" / "compila-pdf.yml",
    radice / ".github" / "PULL_REQUEST_TEMPLATE.md",
    radice / ".github" / "ISSUE_TEMPLATE" / "config.yml",
    radice
    / ".github"
    / "ISSUE_TEMPLATE"
    / "segnalazione-errore-matematico.yml",
    radice / ".github" / "ISSUE_TEMPLATE" / "proposta-miglioramento.yml",
    radice
    / ".github"
    / "ISSUE_TEMPLATE"
    / "problema-grafico-accessibilita.yml",
    radice / "conclusioni" / "versione-e-sorgente.tex",
    radice / "risorse" / "marchio" / "logo-ingegnerismo-bandiera.svg",
    radice / "risorse" / "marchio" / "logo-ingegnerismo-bandiera.pdf",
    radice / "risorse" / "marchio" / "README.md",
]
mancanti = [
    str(percorso.relative_to(radice))
    for percorso in obbligatori
    if not percorso.exists()
]
if mancanti:
    raise SystemExit("File mancanti: " + ", ".join(mancanti))

capitoli = sorted((radice / "capitoli").glob("*.tex"))
if len(capitoli) != 20:
    raise SystemExit(f"Attesi 20 capitoli, trovati {len(capitoli)}")

metadati = (radice / "metadati.tex").read_text(encoding="utf-8")
if not re.search(r"\\FormularioVersione\}\{v\.[1-9]\d*\.[0-9]\}", metadati):
    raise SystemExit(
        "Versione non valida: usa da v.1.0 a v.1.9, poi v.2.0"
    )


def comando_latex(nome: str) -> str:
    corrispondenza = re.search(
        rf"\\newcommand\{{\\{re.escape(nome)}\}}\{{([^}}]+)\}}",
        metadati,
    )
    if not corrispondenza:
        raise SystemExit(f"Comando \\{nome} non trovato in metadati.tex")
    return corrispondenza.group(1)


def valore_annidato(dati: object, *chiavi: str) -> object:
    corrente = dati
    for chiave in chiavi:
        if not isinstance(corrente, dict) or chiave not in corrente:
            raise SystemExit(
                "Campo mancante in formulario.json: " + ".".join(chiavi)
            )
        corrente = corrente[chiave]
    return corrente


def controlla_url(
    nome: str, valore: object, prefisso: Optional[str] = None
) -> str:
    if not isinstance(valore, str):
        raise SystemExit(f"{nome} deve essere una stringa in formulario.json")
    url = urlparse(valore)
    if url.scheme != "https" or not url.netloc:
        raise SystemExit(f"{nome} deve essere un URL HTTPS assoluto")
    if prefisso is not None and not valore.startswith(prefisso):
        raise SystemExit(f"{nome} non appartiene al canale previsto: {prefisso}")
    return valore


try:
    manifesto = json.loads((radice / "formulario.json").read_text(encoding="utf-8"))
except json.JSONDecodeError as errore:
    raise SystemExit(f"formulario.json non valido: {errore}") from errore

versione_schema = valore_annidato(manifesto, "versioneSchema")
if (
    not isinstance(versione_schema, int)
    or isinstance(versione_schema, bool)
    or versione_schema != 1
):
    raise SystemExit("versioneSchema non supportata in formulario.json")

confronti_metadati = {
    ("documento", "titolo"): comando_latex("FormularioTitolo"),
    ("documento", "sottotitolo"): comando_latex("FormularioSottotitolo"),
    ("documento", "versione"): comando_latex("FormularioVersione"),
    ("autore", "nome"): comando_latex("FormularioAutore"),
    ("autore", "ruolo"): comando_latex("FormularioAutoreRuolo"),
    ("autore", "sitoUrl"): comando_latex("SitoURL"),
    ("sorgente", "repositoryUrl"): comando_latex("DepositoGitHubURL"),
}
for percorso, atteso in confronti_metadati.items():
    trovato = valore_annidato(manifesto, *percorso)
    if trovato != atteso:
        raise SystemExit(
            f"{'.'.join(percorso)} non coincide con metadati.tex: {trovato!r}"
        )

if not isinstance(manifesto.get("contributori"), list):
    raise SystemExit("formulario.json deve dichiarare l'elenco dei contributori")

versione = valore_annidato(manifesto, "documento", "versione")
if not isinstance(versione, str) or not re.fullmatch(
    r"v\.[1-9]\d*\.[0-9]", versione
):
    raise SystemExit(
        "documento.versione deve usare da v.1.0 a v.1.9, poi v.2.0"
    )

slug = valore_annidato(manifesto, "documento", "slug")
if not isinstance(slug, str) or not re.fullmatch(
    r"[a-z0-9]+(?:-[a-z0-9]+)*", slug
):
    raise SystemExit("documento.slug deve usare il formato kebab-case")

if valore_annidato(manifesto, "documento", "lingua") != "it":
    raise SystemExit("documento.lingua deve essere it")

data_edizione = valore_annidato(manifesto, "documento", "dataEdizione")
if not isinstance(data_edizione, str) or not re.fullmatch(
    r"\d{4}-\d{2}-\d{2}", data_edizione
):
    raise SystemExit("documento.dataEdizione deve usare il formato AAAA-MM-GG")
try:
    date.fromisoformat(data_edizione)
except ValueError as errore:
    raise SystemExit("documento.dataEdizione non e una data valida") from errore

mesi_italiani = {
    "gennaio": 1,
    "febbraio": 2,
    "marzo": 3,
    "aprile": 4,
    "maggio": 5,
    "giugno": 6,
    "luglio": 7,
    "agosto": 8,
    "settembre": 9,
    "ottobre": 10,
    "novembre": 11,
    "dicembre": 12,
}
try:
    giorno, mese, anno = comando_latex("FormularioData").split()
    data_metadati = date(int(anno), mesi_italiani[mese.lower()], int(giorno))
except (KeyError, TypeError, ValueError) as errore:
    raise SystemExit("FormularioData non e una data italiana valida") from errore
if data_edizione != data_metadati.isoformat():
    raise SystemExit("documento.dataEdizione non coincide con metadati.tex")

pagine = valore_annidato(manifesto, "pubblicazioneSito", "pagine")
if not isinstance(pagine, int) or isinstance(pagine, bool) or pagine <= 0:
    raise SystemExit("pubblicazioneSito.pagine deve essere un intero positivo")

sha256 = valore_annidato(manifesto, "pubblicazioneSito", "sha256")
if not isinstance(sha256, str) or not re.fullmatch(r"[0-9a-f]{64}", sha256):
    raise SystemExit("pubblicazioneSito.sha256 deve essere un digest SHA-256")

commit = valore_annidato(manifesto, "sorgente", "commit")
if not isinstance(commit, str) or not re.fullmatch(r"[0-9a-f]{40}", commit):
    raise SystemExit("sorgente.commit deve essere un identificatore Git completo")

repository_url = controlla_url(
    "sorgente.repositoryUrl",
    valore_annidato(manifesto, "sorgente", "repositoryUrl"),
    "https://github.com/decarlocarolis/formulario-analisi-matematica-1",
)
commit_url = controlla_url(
    "sorgente.commitUrl",
    valore_annidato(manifesto, "sorgente", "commitUrl"),
    repository_url + "/commit/",
)
if commit_url != f"{repository_url}/commit/{commit}":
    raise SystemExit("sorgente.commitUrl non corrisponde a sorgente.commit")

pagina_url = controlla_url(
    "pubblicazioneSito.paginaUrl",
    valore_annidato(manifesto, "pubblicazioneSito", "paginaUrl"),
    "https://ingegnerismo.it/",
)
if not pagina_url.endswith(f"/matematica/{slug}/"):
    raise SystemExit("pubblicazioneSito.paginaUrl non corrisponde a documento.slug")
pdf_url = controlla_url(
    "pubblicazioneSito.pdfUrl",
    valore_annidato(manifesto, "pubblicazioneSito", "pdfUrl"),
    "https://ingegnerismo.it/",
)
if pagina_url == pdf_url or not pdf_url.endswith(".pdf"):
    raise SystemExit("pubblicazioneSito.pdfUrl deve identificare un file PDF distinto")

versione_file = versione.removeprefix("v.")
if f"-v{versione_file}.pdf" not in pdf_url:
    raise SystemExit("Il nome del PDF sul sito non contiene la versione editoriale")

nome_file = valore_annidato(manifesto, "pubblicazioneSito", "nomeFile")
if (
    not isinstance(nome_file, str)
    or nome_file != Path(urlparse(pdf_url).path).name
):
    raise SystemExit(
        "pubblicazioneSito.nomeFile non coincide con pubblicazioneSito.pdfUrl"
    )

if valore_annidato(manifesto, "pubblicazioneSito", "canale") != "ingegnerismo.it":
    raise SystemExit("pubblicazioneSito.canale deve essere ingegnerismo.it")

if valore_annidato(manifesto, "licenza", "codice") != "CC-BY-NC-4.0":
    raise SystemExit("licenza.codice deve essere CC-BY-NC-4.0")
controlla_url(
    "licenza.url",
    valore_annidato(manifesto, "licenza", "url"),
    "https://creativecommons.org/licenses/by-nc/4.0/",
)
controlla_url(
    "licenza.dettagliUrl",
    valore_annidato(manifesto, "licenza", "dettagliUrl"),
    repository_url + "/blob/main/LICENZA.md",
)


# Verifica della palette istituzionale e del logo vettoriale.
classe = (radice / "formulario-ingegnerismo.cls").read_text(encoding="utf-8")
for codice in ("006FB9", "00477A", "FFEE84", "1D1D1B", "666665"):
    if codice not in classe:
        raise SystemExit(f"Colore istituzionale {codice} assente dalla classe grafica")

logo_pdf = radice / "risorse" / "marchio" / "logo-ingegnerismo-bandiera.pdf"
if logo_pdf.stat().st_size < 1000:
    raise SystemExit("Logo PDF vettoriale mancante o non valido")

file_testuali = [
    radice / "formulario.tex",
    radice / "formulario.json",
    radice / "metadati.tex",
    radice / "comandi.tex",
    radice / "formulario-ingegnerismo.cls",
    radice / "preliminari" / "crediti.tex",
    radice / "README.md",
    radice / "CONTRIBUTING.md",
    radice / "GESTIONE-DEPOSITO-GIT.md",
    radice / "LINEE-GUIDA-GRAFICHE.md",
    radice / "strumenti" / "controlla_progetto.py",
    radice / "strumenti" / "pubblica-versione.sh",
    radice / ".github" / "workflows" / "compila-pdf.yml",
    radice / ".github" / "PULL_REQUEST_TEMPLATE.md",
    radice / ".github" / "ISSUE_TEMPLATE" / "config.yml",
    radice
    / ".github"
    / "ISSUE_TEMPLATE"
    / "segnalazione-errore-matematico.yml",
    radice / ".github" / "ISSUE_TEMPLATE" / "proposta-miglioramento.yml",
    radice
    / ".github"
    / "ISSUE_TEMPLATE"
    / "problema-grafico-accessibilita.yml",
    radice / "conclusioni" / "versione-e-sorgente.tex",
    radice / "risorse" / "marchio" / "README.md",
    radice / "risorse" / "marchio" / "logo-ingegnerismo-bandiera.svg",
    *capitoli,
]
marcatori_conflitto = ("<" * 7, ">" * 7)
for percorso in file_testuali:
    testo = percorso.read_text(encoding="utf-8")
    if "\x00" in testo or any(
        marcatore in testo for marcatore in marcatori_conflitto
    ):
        raise SystemExit(f"Contenuto non valido in {percorso.relative_to(radice)}")

# Protezione dei confini editoriali: le EDO appartengono al formulario dedicato.
for percorso in capitoli:
    testo = percorso.read_text(encoding="utf-8")
    if re.search(r"\bEDO\b|equazion[ei]\s+differenzial", testo, flags=re.IGNORECASE):
        raise SystemExit(
            f"Contenuto EDO fuori ambito trovato in {percorso.relative_to(radice)}"
        )

print(
    f"Controllo superato: {len(capitoli)} capitoli, metadati validi "
    "e nessun contenuto EDO nei capitoli"
)

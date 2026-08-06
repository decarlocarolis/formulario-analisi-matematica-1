"""Controlli non distruttivi del progetto del Formulario di Analisi I."""

from __future__ import annotations

import hashlib
import json
import re
from datetime import date
from pathlib import Path
from urllib.parse import urlparse

RADICE = Path(__file__).resolve().parents[1]
DEPOSITO = "decarlocarolis/formulario-analisi-matematica-1"
URL_DEPOSITO = f"https://github.com/{DEPOSITO}"
NUMERO_CAPITOLI = 20


def errore(messaggio: str) -> None:
    raise SystemExit(messaggio)


def leggi(percorso: Path) -> str:
    try:
        return percorso.read_text(encoding="utf-8")
    except UnicodeDecodeError as eccezione:
        errore(f"File non UTF-8: {percorso.relative_to(RADICE)} ({eccezione})")
    raise AssertionError("irraggiungibile")


def sha256(percorso: Path) -> str:
    digest = hashlib.sha256()
    with percorso.open("rb") as file:
        for blocco in iter(lambda: file.read(1024 * 1024), b""):
            digest.update(blocco)
    return digest.hexdigest()


def comando_latex(testo: str, nome: str) -> str:
    corrispondenza = re.search(
        rf"\\newcommand\{{\\{re.escape(nome)}\}}\{{([^}}]+)\}}", testo
    )
    if not corrispondenza:
        errore(f"Comando \\{nome} non trovato in metadati.tex")
    return corrispondenza.group(1)


def valore(dati: object, *chiavi: str) -> object:
    corrente = dati
    for chiave in chiavi:
        if not isinstance(corrente, dict) or chiave not in corrente:
            errore("Campo mancante in formulario.json: " + ".".join(chiavi))
        corrente = corrente[chiave]
    return corrente


def url_https(nome: str, dato: object, prefisso: str | None = None) -> str:
    if not isinstance(dato, str):
        errore(f"{nome} deve essere una stringa")
    analizzato = urlparse(dato)
    if analizzato.scheme != "https" or not analizzato.netloc:
        errore(f"{nome} deve essere un URL HTTPS assoluto")
    if prefisso and not dato.startswith(prefisso):
        errore(f"{nome} non appartiene al canale previsto: {prefisso}")
    return dato


residui_obsoleti = [
    "main.tex", "metadata.tex", "commands.tex", "ingegnerismo-formulario.cls",
    "CHANGELOG.md", "NOTICE.md", "REPOSITORY_SETUP.md", "NOTE-DI-VERSIONE.md",
    "bootstrap-github.sh", "trigger-bootstrap.txt", "archive", "frontmatter",
    "backmatter", "sections", "tools", "bootstrap",
    ".github/workflows/build-pdf.yml", ".github/workflows/bootstrap-source.yml",
    ".github/ISSUE_TEMPLATE/errore-matematico.yml",
]
presenti = [nome for nome in residui_obsoleti if (RADICE / nome).exists()]
if presenti:
    errore("File o cartelle obsolete presenti: " + ", ".join(presenti))

obbligatori = [
    "formulario.tex", "formulario.json", "metadati.tex", "comandi.tex",
    "formulario-ingegnerismo.cls", "STILE-COLLANA.json", "README.md",
    "CONTRIBUTING.md", "CRONOLOGIA.md", "GESTIONE-DEPOSITO-GIT.md",
    "LICENZA.md", "LINEE-GUIDA-GRAFICHE.md", "VERIFICA-MATEMATICA.md",
    "requisiti-verifica.txt", "strumenti/compila-pdf.sh",
    "strumenti/controlla_progetto.py", "strumenti/pubblica-versione.sh",
    "strumenti/verifica_formule.py", ".github/workflows/compila-pdf.yml",
    ".github/dependabot.yml", ".github/PULL_REQUEST_TEMPLATE.md",
    ".github/ISSUE_TEMPLATE/config.yml",
    ".github/ISSUE_TEMPLATE/segnalazione-errore-matematico.yml",
    ".github/ISSUE_TEMPLATE/proposta-miglioramento.yml",
    ".github/ISSUE_TEMPLATE/problema-grafico-accessibilita.yml",
    "conclusioni/versione-e-sorgente.tex",
    "risorse/marchio/logo-ingegnerismo-bandiera.svg",
    "risorse/marchio/logo-ingegnerismo-bandiera.pdf",
    "risorse/marchio/README.md",
]
mancanti = [nome for nome in obbligatori if not (RADICE / nome).exists()]
if mancanti:
    errore("File mancanti: " + ", ".join(mancanti))

capitoli = sorted((RADICE / "capitoli").glob("*.tex"))
if len(capitoli) != NUMERO_CAPITOLI:
    errore(f"Attesi {NUMERO_CAPITOLI} capitoli, trovati {len(capitoli)}")

metadati = leggi(RADICE / "metadati.tex")
versione = comando_latex(metadati, "FormularioVersione")
if not re.fullmatch(r"v\.[1-9][0-9]*\.[0-9]+", versione):
    errore("Versione non valida: usa v.MAGGIORE.MINORE, per esempio v.1.3 o v.1.10")

try:
    manifesto = json.loads(leggi(RADICE / "formulario.json"))
except json.JSONDecodeError as eccezione:
    errore(f"formulario.json non valido: {eccezione}")

if valore(manifesto, "versioneSchema") != 1:
    errore("versioneSchema non supportata in formulario.json")

confronti = {
    ("documento", "titolo"): comando_latex(metadati, "FormularioTitolo"),
    ("documento", "sottotitolo"): comando_latex(metadati, "FormularioSottotitolo"),
    ("documento", "versione"): versione,
    ("autore", "nome"): comando_latex(metadati, "FormularioAutore"),
    ("autore", "sitoUrl"): comando_latex(metadati, "SitoURL"),
    ("sorgente", "repositoryUrl"): comando_latex(metadati, "DepositoGitHubURL"),
}
for percorso, atteso in confronti.items():
    if valore(manifesto, *percorso) != atteso:
        errore(f"{'.'.join(percorso)} non coincide con metadati.tex")

if valore(manifesto, "documento", "slug") != "formulario-analisi-1":
    errore("documento.slug deve essere formulario-analisi-1")
if valore(manifesto, "documento", "lingua") != "it":
    errore("documento.lingua deve essere it")

data_edizione = valore(manifesto, "documento", "dataEdizione")
if not isinstance(data_edizione, str):
    errore("documento.dataEdizione deve essere una stringa")
try:
    data_iso = date.fromisoformat(data_edizione)
except ValueError as eccezione:
    errore(f"documento.dataEdizione non è valida: {eccezione}")
mesi = {"gennaio": 1, "febbraio": 2, "marzo": 3, "aprile": 4, "maggio": 5,
        "giugno": 6, "luglio": 7, "agosto": 8, "settembre": 9,
        "ottobre": 10, "novembre": 11, "dicembre": 12}
try:
    giorno, mese, anno = comando_latex(metadati, "FormularioData").split()
    data_latex = date(int(anno), mesi[mese.lower()], int(giorno))
except (KeyError, TypeError, ValueError) as eccezione:
    errore(f"FormularioData non è una data italiana valida: {eccezione}")
if data_iso != data_latex:
    errore("documento.dataEdizione non coincide con FormularioData")

repository_url = url_https("sorgente.repositoryUrl", valore(manifesto, "sorgente", "repositoryUrl"), URL_DEPOSITO)
commit = valore(manifesto, "sorgente", "commit")
if not isinstance(commit, str) or not re.fullmatch(r"[0-9a-f]{40}", commit):
    errore("sorgente.commit deve essere un identificatore Git completo")
commit_url = url_https("sorgente.commitUrl", valore(manifesto, "sorgente", "commitUrl"), repository_url + "/commit/")
if commit_url != f"{repository_url}/commit/{commit}":
    errore("sorgente.commitUrl non corrisponde a sorgente.commit")

pubblicazione = valore(manifesto, "pubblicazioneSito")
if not isinstance(pubblicazione, dict):
    errore("pubblicazioneSito deve essere un oggetto")
pagina_url = url_https("pubblicazioneSito.paginaUrl", pubblicazione.get("paginaUrl"), "https://ingegnerismo.it/")
pdf_url = url_https("pubblicazioneSito.pdfUrl", pubblicazione.get("pdfUrl"), "https://ingegnerismo.it/")
if not pagina_url.endswith("/matematica/formulario-analisi-1/"):
    errore("pubblicazioneSito.paginaUrl non corrisponde allo slug")
if not pdf_url.endswith(".pdf") or f"-v{versione.removeprefix('v.')}" not in pdf_url:
    errore("Il PDF del sito deve contenere la versione editoriale nel nome")
if pubblicazione.get("nomeFile") != Path(urlparse(pdf_url).path).name:
    errore("pubblicazioneSito.nomeFile non coincide con l'URL del PDF")
if not isinstance(pubblicazione.get("pagine"), int) or pubblicazione["pagine"] <= 0:
    errore("pubblicazioneSito.pagine deve essere un intero positivo")
if not isinstance(pubblicazione.get("sha256"), str) or not re.fullmatch(r"[0-9a-f]{64}", pubblicazione["sha256"]):
    errore("pubblicazioneSito.sha256 deve essere un digest SHA-256")

if valore(manifesto, "licenza", "codice") != "CC-BY-NC-4.0":
    errore("licenza.codice deve essere CC-BY-NC-4.0")
url_https("licenza.url", valore(manifesto, "licenza", "url"), "https://creativecommons.org/licenses/by-nc/4.0/")
url_https("licenza.dettagliUrl", valore(manifesto, "licenza", "dettagliUrl"), URL_DEPOSITO + "/blob/main/LICENZA.md")

try:
    stile = json.loads(leggi(RADICE / "STILE-COLLANA.json"))
except json.JSONDecodeError as eccezione:
    errore(f"STILE-COLLANA.json non valido: {eccezione}")
if stile.get("versioneSchema") != 1:
    errore("versioneSchema non supportata in STILE-COLLANA.json")
for chiave in ("classe", "logoSvg", "logoPdf"):
    elemento = stile.get(chiave)
    if not isinstance(elemento, dict):
        errore(f"Elemento mancante in STILE-COLLANA.json: {chiave}")
    percorso = RADICE / str(elemento.get("percorso", ""))
    atteso = elemento.get("sha256")
    if not percorso.is_file() or not isinstance(atteso, str):
        errore(f"Elemento di stile non valido: {chiave}")
    if sha256(percorso) != atteso:
        errore(f"Hash dello stile non coerente per {percorso.relative_to(RADICE)}")

classe = leggi(RADICE / "formulario-ingegnerismo.cls")
for codice in ("006FB9", "00477A", "FFEE84", "1D1D1B", "666665"):
    if codice not in classe:
        errore(f"Colore istituzionale {codice} assente dalla classe grafica")
if "Atlante dell'Ingegneria" not in classe:
    errore("Motto istituzionale assente dalla classe grafica")
if "Formulari operativi per ingegneria e discipline STEM" in classe:
    errore("Dicitura istituzionale obsoleta presente nella classe grafica")
if "range={\\lbrace,\\rbrace}" not in classe:
    errore("Fallback tipografico per le parentesi graffe assente")

file_testuali = [RADICE / nome for nome in obbligatori if (RADICE / nome).is_file() and (RADICE / nome).suffix.lower() != ".pdf"] + capitoli
marcatori_conflitto = ("<" * 7, ">" * 7)
for percorso in file_testuali:
    testo = leggi(percorso)
    if "\x00" in testo or any(marcatore in testo for marcatore in marcatori_conflitto):
        errore(f"Contenuto non valido in {percorso.relative_to(RADICE)}")

for percorso in capitoli:
    if re.search(r"\bEDO\b|equazion[ei]\s+differenzial", leggi(percorso), flags=re.IGNORECASE):
        errore(f"Contenuto EDO fuori ambito in {percorso.relative_to(RADICE)}")

workflow = leggi(RADICE / ".github/workflows/compila-pdf.yml")
for vietato in ("git tag -f", "git push --force", "--clobber"):
    if vietato in workflow:
        errore(f"Operazione distruttiva presente nel workflow: {vietato}")
if not re.search(r"permissions:\s*\n\s+contents: read", workflow):
    errore("Il workflow deve usare contents: read come permesso generale")
if not re.search(r"pubblicazione:.*?permissions:\s*\n\s+contents: write", workflow, re.S):
    errore("Il job di pubblicazione deve dichiarare contents: write")
for riga in workflow.splitlines():
    if "uses:" in riga and re.search(r"@[vV][0-9]", riga):
        errore("Le GitHub Actions devono essere fissate a uno SHA completo")

script = leggi(RADICE / "strumenti/pubblica-versione.sh")
for vietato in ("git add --all", "git commit", "git push origin main", "git tag -f", "git push --force", "--clobber"):
    if vietato in script:
        errore(f"Operazione distruttiva presente nello script di pubblicazione: {vietato}")
for necessario in ("git status --porcelain", "origin/main", "gh release view"):
    if necessario not in script:
        errore(f"Controllo mancante nello script di pubblicazione: {necessario}")

config_issue = leggi(RADICE / ".github/ISSUE_TEMPLATE/config.yml")
if "/discussions" in config_issue:
    errore("Il modello non deve dipendere da GitHub Discussions")
if "https://ingegnerismo.it/contribuisci/" not in config_issue:
    errore("Collegamento a ingegnerismo.it/contribuisci/ mancante")

licenza = leggi(RADICE / "LICENZA.md")
if "strumenti tecnici" not in licenza.lower() or "restano riservati" not in licenza.lower():
    errore("La licenza deve chiarire i diritti sugli strumenti tecnici")

print(f"Controllo superato: {len(capitoli)} capitoli, metadati e manifesto coerenti, stile verificato, pubblicazione immutabile e nessun contenuto EDO nei capitoli")

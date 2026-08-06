from pathlib import Path
import re
import shutil

radice = Path(__file__).resolve().parents[1]

# Durante la migrazione dalla prima struttura del deposito possono essere ancora
# presenti file con nomi inglesi. Sono copie obsolete: il sorgente canonico usa
# esclusivamente la struttura italiana definita nel README.
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
for percorso in residui_obsoleti:
    if percorso.is_dir():
        shutil.rmtree(percorso)
    elif percorso.exists():
        percorso.unlink()

obbligatori = [
    radice / "formulario.tex",
    radice / "metadati.tex",
    radice / "comandi.tex",
    radice / "formulario-ingegnerismo.cls",
    radice / "README.md",
    radice / "CRONOLOGIA.md",
    radice / "LINEE-GUIDA-GRAFICHE.md",
    radice / "conclusioni" / "versione-e-sorgente.tex",
    radice / "risorse" / "marchio" / "logo-ingegnerismo-bandiera.svg",
    radice / "risorse" / "marchio" / "logo-ingegnerismo-bandiera.pdf",
    radice / "risorse" / "marchio" / "README.md",
]
mancanti = [str(percorso.relative_to(radice)) for percorso in obbligatori if not percorso.exists()]
if mancanti:
    raise SystemExit("File mancanti: " + ", ".join(mancanti))

capitoli = sorted((radice / "capitoli").glob("*.tex"))
if len(capitoli) != 20:
    raise SystemExit(f"Attesi 20 capitoli, trovati {len(capitoli)}")

metadati = (radice / "metadati.tex").read_text(encoding="utf-8")
if not re.search(r"\\FormularioVersione\}\{v\.\d+\.\d+\}", metadati):
    raise SystemExit("Versione editoriale v.MAGGIORE.MINORE non trovata in metadati.tex")


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
    radice / "metadati.tex",
    radice / "comandi.tex",
    radice / "formulario-ingegnerismo.cls",
    radice / "LINEE-GUIDA-GRAFICHE.md",
    radice / "conclusioni" / "versione-e-sorgente.tex",
    radice / "risorse" / "marchio" / "README.md",
    radice / "risorse" / "marchio" / "logo-ingegnerismo-bandiera.svg",
    *capitoli,
]
for percorso in file_testuali:
    testo = percorso.read_text(encoding="utf-8")
    if "\x00" in testo or "<<<<<<<" in testo or ">>>>>>>" in testo:
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

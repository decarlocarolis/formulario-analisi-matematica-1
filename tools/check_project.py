from pathlib import Path
import re, sys
root = Path(__file__).resolve().parents[1]
required = [
    root/'main.tex', root/'metadata.tex', root/'ingegnerismo-formulario.cls',
    root/'README.md', root/'CHANGELOG.md'
]
missing = [str(p.relative_to(root)) for p in required if not p.exists()]
if missing:
    raise SystemExit('File mancanti: ' + ', '.join(missing))
chapters = sorted((root/'sections').glob('*.tex'))
if len(chapters) != 20:
    raise SystemExit(f'Attesi 20 capitoli, trovati {len(chapters)}')
meta = (root/'metadata.tex').read_text(encoding='utf-8')
if not re.search(r'\\FormularioVersione\}\{v\.\d+\.\d+\}', meta):
    raise SystemExit('Versione editoriale v.MAJOR.MINOR non trovata in metadata.tex')
for p in [root/'main.tex', root/'metadata.tex', root/'commands.tex', *chapters]:
    t = p.read_text(encoding='utf-8')
    if '\x00' in t or '<<<<<<<' in t or '>>>>>>>' in t:
        raise SystemExit(f'Contenuto non valido in {p}')

# Protezione dei confini editoriali: le EDO appartengono al formulario dedicato.
for p in chapters:
    t = p.read_text(encoding='utf-8')
    if re.search(r'\bEDO\b|equazion[ei]\s+differenzial', t, flags=re.IGNORECASE):
        raise SystemExit(f'Contenuto EDO fuori ambito trovato in {p.relative_to(root)}')

print(f'OK: {len(chapters)} capitoli, metadati validi e nessun contenuto EDO nelle sezioni')

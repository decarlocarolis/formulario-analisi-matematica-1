# Formulario di Analisi Matematica I

Formulario operativo per la preparazione degli esami di Analisi Matematica I nei corsi di ingegneria e nelle lauree STEM.

## Principio editoriale

Il documento è organizzato per risolvere problemi: **riconoscere la traccia → scegliere il metodo → applicare la procedura → controllare il risultato**. Le definizioni e i teoremi compaiono solo nella misura necessaria a usare correttamente formule e criteri. Le equazioni differenziali ordinarie sono escluse e rimangono nel formulario dedicato di EDO e Analisi Numerica.

## Sorgente canonico

Il sorgente canonico è il progetto LaTeX. Il file Markdown in `archive/` è una copia storica della versione precedente e non deve essere modificato.

## Struttura

- `main.tex`: documento principale;
- `metadata.tex`: titolo, versione, data e URL;
- `ingegnerismo-formulario.cls`: stile comune del volume;
- `sections/`: capitoli LaTeX;
- `frontmatter/`: guida d'uso e mappa degli esercizi;
- `backmatter/`: checklist finale;
- `dist/formulario-analisi-matematica-1.pdf`: PDF generato localmente o dalla CI; non viene versionato nel ramo `main`;
- `.github/workflows/`: compilazione automatica e Release GitHub.

## Compilazione locale

Richiede una distribuzione TeX completa con XeLaTeX. Il comando di build esegue due passaggi deterministici per stabilizzare indice e riferimenti.

```bash
make pdf
```

Il PDF viene scritto in:

```text
dist/formulario-analisi-matematica-1.pdf
```

## Versionamento

- modifiche al sorgente: commit Git;
- versione editoriale visualizzata: `v.MAJOR.MINOR` in `metadata.tex` e `CHANGELOG.md`;
- release pubblica: tag Git `vMAJOR.MINOR` (senza il punto dopo `v`);
- asset stabile: `formulario-analisi-matematica-1.pdf`.

## Collegamento dal sito

Dopo la prima Release, l'URL stabile sarà:

```text
https://github.com/decarlocarolis/formulario-analisi-matematica-1/releases/latest/download/formulario-analisi-matematica-1.pdf
```

Il PDF non viene committato nel ramo `main`: viene ricompilato dalla GitHub Action e allegato a ogni Release. Il sito può conservare una copia sul proprio dominio; GitHub mantiene sorgenti, tag, Release e checksum versionati.

## Copyright

© 2026 Carlo de Carolis. Tutti i diritti riservati. La visibilità pubblica del repository non attribuisce automaticamente una licenza di riuso o redistribuzione.

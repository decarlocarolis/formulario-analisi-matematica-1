# Formulario di Analisi Matematica I

Formulario operativo per la preparazione degli esami di Analisi Matematica I nei corsi di ingegneria e nelle lauree STEM.

## Principio editoriale

Il documento è organizzato per risolvere problemi: **riconoscere la traccia → scegliere il metodo → applicare la procedura → controllare il risultato**. Definizioni e teoremi compaiono soltanto nella misura necessaria a usare correttamente formule e criteri. Le equazioni differenziali ordinarie sono escluse e rimangono nel formulario dedicato di EDO e Analisi Numerica.

## Sorgente canonico

Il sorgente canonico è il progetto LaTeX. Il file Markdown in `archivio/` è una copia storica della versione precedente e non deve essere modificato.

## Struttura

- `formulario.tex`: documento principale;
- `metadati.tex`: titolo, versione, data e collegamenti;
- `stile-formulario-ingegnerismo.cls`: stile comune del volume;
- `comandi.tex`: comandi matematici ed editoriali del volume;
- `capitoli/`: capitoli LaTeX;
- `pagine-iniziali/`: copertina, guida d'uso e mappa degli esercizi;
- `pagine-finali/`: controllo conclusivo prima della consegna;
- `archivio/`: sorgente Markdown storico;
- `strumenti/`: controlli e compilazione locale;
- `distribuzione/formulario-analisi-matematica-1.pdf`: PDF generato; non viene registrato nel ramo `main`;
- `.github/workflows/`: compilazione automatica e pubblicazione delle versioni.

## Compilazione locale

Richiede una distribuzione TeX completa con XeLaTeX. Il comando seguente esegue due passaggi per stabilizzare indice e riferimenti:

```bash
make pdf
```

Il PDF viene scritto in:

```text
distribuzione/formulario-analisi-matematica-1.pdf
```

## Controlli

```bash
make controlla
```

Il controllo verifica la presenza dei file essenziali, il numero dei capitoli, il formato della versione, l'assenza di conflitti e il rispetto del confine editoriale che assegna le EDO al formulario dedicato.

## Versionamento

- modifiche al sorgente: registrazioni Git;
- versione editoriale visualizzata: `v.MAGGIORE.MINORE` in `metadati.tex` e `CRONOLOGIA.md`;
- versione pubblica: etichetta Git `vMAGGIORE.MINORE`;
- PDF pubblico: `formulario-analisi-matematica-1.pdf`;
- archivio dei sorgenti: `formulario-analisi-matematica-1-sorgenti.zip`;
- impronte di integrità: `IMPRONTE-SHA256.txt`.

## Collegamento dal sito

L'indirizzo stabile del PDF più recente è:

```text
https://github.com/decarlocarolis/formulario-analisi-matematica-1/releases/latest/download/formulario-analisi-matematica-1.pdf
```

Il PDF non viene inserito nella cronologia del ramo `main`: viene ricompilato automaticamente e allegato alla versione pubblicata. Il sito può conservarne anche una copia sul proprio dominio; GitHub mantiene sorgenti, etichette, versioni pubblicate e impronte di integrità.

## Lingua del progetto

Documentazione, commenti, messaggi, nomi dei file controllabili e testi mostrati da GitHub sono in italiano. Restano nella forma prevista dagli strumenti soltanto gli identificatori tecnici obbligatori, tra cui il nome convenzionale `README.md`, la cartella `.github`, le chiavi della sintassi YAML, i comandi standard di LaTeX e i nomi delle azioni esterne.

## Diritti d'autore

© 2026 Carlo de Carolis. Tutti i diritti riservati. La visibilità pubblica della repository non attribuisce automaticamente una licenza di riuso o redistribuzione.

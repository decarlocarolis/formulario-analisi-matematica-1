# Formulario di Analisi Matematica I

Formulario operativo per la preparazione degli esami di Analisi Matematica I nei corsi di ingegneria e nelle lauree STEM.

## Principio editoriale

Il documento è organizzato per risolvere problemi: **riconoscere la traccia → scegliere il metodo → applicare la procedura → controllare il risultato**. Le definizioni e i teoremi compaiono soltanto nella misura necessaria a usare correttamente formule e criteri. Le equazioni differenziali ordinarie sono escluse e rimangono nel formulario dedicato di EDO e Analisi Numerica.

## Sorgente canonico

Il sorgente canonico è il progetto LaTeX. Il file Markdown nella cartella `archivio/` è una copia storica della versione precedente e non deve essere modificato.

## Struttura del deposito

- `formulario.tex`: documento principale;
- `metadati.tex`: titolo, versione, data e indirizzi;
- `comandi.tex`: comandi matematici specifici del volume;
- `formulario-ingegnerismo.cls`: stile tipografico comune;
- `capitoli/`: capitoli LaTeX;
- `preliminari/`: copertina, guida d'uso e mappa degli esercizi;
- `conclusioni/`: lista di controllo finale;
- `archivio/`: sorgente Markdown storico;
- `strumenti/`: controlli, compilazione e pubblicazione;
- `distribuzione/`: PDF e pacchetti generati, esclusi dalla cronologia Git;
- `.github/workflows/`: compilazione automatica e pubblicazione delle versioni.

I nomi `README.md`, `Makefile`, `.github`, `.gitignore`, `.gitattributes` e alcune chiavi dei file YAML restano invariati perché sono convenzioni tecniche richieste o riconosciute automaticamente dagli strumenti. Tutta la documentazione, i commenti, i messaggi, i nomi scelti liberamente e i contenuti destinati alle persone sono in italiano.

## Identità grafica

La classe `formulario-ingegnerismo.cls` applica la palette derivata dal marchio, la gerarchia dei titoli, i riquadri operativi, le tabelle e le intestazioni. Il logo sorgente è conservato in `risorse/marchio/` come SVG; il documento utilizza la copia vettoriale PDF per una compilazione stabile. Le regole comuni sono descritte in `LINEE-GUIDA-GRAFICHE.md`.

## Compilazione locale

Serve una distribuzione TeX completa con XeLaTeX. Il comando seguente controlla il progetto, esegue due passaggi di compilazione e genera il PDF:

```bash
make pdf
```

Il PDF viene scritto in:

```text
distribuzione/formulario-analisi-matematica-1.pdf
```

Altri comandi disponibili:

```bash
make controlla
make pulisci
make pacchetto-sorgenti
```

## Versionamento

- modifiche al sorgente: registrazioni Git;
- versione editoriale visualizzata: `v.MAGGIORE.MINORE` in `metadati.tex` e `CRONOLOGIA.md`;
- versione pubblica: etichetta Git `vMAGGIORE.MINORE`, senza il punto dopo `v`;
- file PDF stabile: `formulario-analisi-matematica-1.pdf`;
- pacchetto dei sorgenti: `formulario-analisi-matematica-1-sorgenti.zip`.

## Collegamento dal sito

Dopo la prima pubblicazione GitHub, l'indirizzo stabile del PDF sarà:

```text
https://github.com/decarlocarolis/formulario-analisi-matematica-1/releases/latest/download/formulario-analisi-matematica-1.pdf
```

Il PDF non viene inserito nella cronologia del ramo `main`: viene ricompilato dal flusso automatico e allegato a ogni versione pubblicata. Il sito può conservarne anche una copia sul proprio dominio; GitHub mantiene sorgenti, etichette, versioni pubblicate e somme di controllo.

Quando occorre correggere gli artefatti senza cambiare il numero editoriale, lo script `strumenti/pubblica-versione.sh v1.2` aggiorna l'etichetta e sostituisce i file della versione GitHub esistente. Questa operazione va usata soltanto per correzioni interne alla stessa versione dichiarata.

## Diritti d'autore

© 2026 Carlo de Carolis. Tutti i diritti riservati. La visibilità pubblica del deposito non attribuisce automaticamente una licenza di riuso o redistribuzione.

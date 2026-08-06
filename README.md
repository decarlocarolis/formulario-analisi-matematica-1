# Formulario di Analisi Matematica I

Formulario operativo per la preparazione degli esami di Analisi Matematica I nei
corsi di ingegneria e nelle lauree STEM.

## Principio editoriale

Il documento segue il flusso **riconoscere la traccia → scegliere il metodo →
applicare la procedura → controllare il risultato**. La teoria compare soltanto
nella misura necessaria a usare correttamente formule, criteri e teoremi. Le EDO
sono escluse e restano nel formulario dedicato.

## Sorgente canonico

Il sorgente canonico è il progetto LaTeX. Il Markdown in `archivio/` è una copia
storica e non deve essere aggiornato dopo la migrazione.

File principali:

- `formulario.tex`: documento principale;
- `formulario.json`: metadati verificabili della copia pubblicata;
- `metadati.tex`: titolo, versione, data e indirizzi;
- `formulario-ingegnerismo.cls`: stile tipografico della collana;
- `STILE-COLLANA.json`: versione e impronte della classe e del logo;
- `capitoli/`, `preliminari/`, `conclusioni/`: contenuto LaTeX;
- `strumenti/`: controlli, test, compilazione e pubblicazione;
- `CONTRIBUTING.md`: modalità di segnalazione e contributo.

Documentazione, commenti e messaggi destinati alle persone sono in italiano. I
nomi tecnici imposti dagli strumenti, come `README.md`, `Makefile` e `.github`,
restano invariati.

## Compilazione locale

Serve una distribuzione TeX completa con XeLaTeX e Python:

```bash
python -m pip install -r requisiti-verifica.txt
make pdf
```

Comandi disponibili:

```bash
make controlla
make verifica-formule
make pdf
make pacchetto-sorgenti
make pulisci
```

Il PDF viene scritto in
`distribuzione/formulario-analisi-matematica-1.pdf`.

## Versionamento e pubblicazione

- versione nel documento: `v.MAGGIORE.MINORE`, per esempio `v.1.3`;
- tag Git: `vMAGGIORE.MINORE`, per esempio `v1.3`;
- sono ammessi `v1.9`, `v1.10` e `v2.0`;
- tag, Release e allegati pubblicati sono immutabili;
- ogni modifica che cambia il PDF richiede una nuova versione.

Lo script `strumenti/pubblica-versione.sh v1.3` controlla il progetto, verifica
che `main` sia pulito e sincronizzato, rifiuta versioni già esistenti e invia
soltanto il nuovo tag. GitHub Actions compila e crea la Release.

## Pubblicazione sul sito

Pagina editoriale:

```text
https://ingegnerismo.it/matematica/formulario-analisi-1/
```

La copia pubblicata sul sito, il relativo checksum e il commit sorgente sono
registrati in `formulario.json`. Copie con lo stesso numero di versione ma hash
diversi devono essere considerate artefatti distinti.

## Sicurezza del flusso

Il workflow usa permessi di sola lettura durante controllo e compilazione; il
permesso di scrittura è concesso soltanto al job che crea una nuova Release. Le
GitHub Actions sono fissate a commit SHA completi e Dependabot propone gli
aggiornamenti delle dipendenze.

## Partecipare

I modelli guidati permettono di segnalare errori matematici, proporre
miglioramenti e descrivere problemi grafici o di accessibilità. Le istruzioni
complete sono in `CONTRIBUTING.md`; in alternativa è disponibile la pagina
https://ingegnerismo.it/contribuisci/.

## Licenza

PDF, contenuti editoriali e sorgenti LaTeX sono concessi con licenza **CC BY-NC
4.0**. Logo e segni distintivi sono esclusi. Gli strumenti tecnici non sono
inclusi nella licenza editoriale e restano soggetti alle condizioni di
`LICENZA.md`.

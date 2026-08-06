# Formulario di Analisi Matematica I

Formulario operativo per la preparazione degli esami di Analisi Matematica I nei corsi di ingegneria e nelle lauree STEM.

## Principio editoriale

Il documento è organizzato per risolvere problemi: **riconoscere la traccia → scegliere il metodo → applicare la procedura → controllare il risultato**. Le definizioni e i teoremi compaiono soltanto nella misura necessaria a usare correttamente formule e criteri. Le equazioni differenziali ordinarie sono escluse e rimangono nel formulario dedicato di EDO e Analisi Numerica.

## Sorgente canonico

Il sorgente canonico è il progetto LaTeX. Il file Markdown nella cartella `archivio/` è una copia storica della versione precedente e non deve essere modificato.

## Struttura del deposito

- `formulario.tex`: documento principale;
- `formulario.json`: metadati leggibili dalle macchine della copia pubblicata sul sito;
- `metadati.tex`: titolo, versione, data e indirizzi;
- `comandi.tex`: comandi matematici specifici del volume;
- `formulario-ingegnerismo.cls`: stile tipografico comune;
- `capitoli/`: capitoli LaTeX;
- `preliminari/`: copertina, guida d'uso e mappa degli esercizi;
- `conclusioni/`: lista di controllo finale;
- `archivio/`: sorgente Markdown storico;
- `strumenti/`: controlli, compilazione e pubblicazione;
- `CONTRIBUTING.md`: canali e condizioni per segnalazioni e contributi;
- `distribuzione/`: PDF e pacchetti generati, esclusi dalla cronologia Git;
- `.github/workflows/`: compilazione automatica e pubblicazione delle versioni.

I nomi `README.md`, `Makefile`, `.github`, `.gitignore`, `.gitattributes` e alcune chiavi dei file YAML restano invariati perché sono convenzioni tecniche richieste o riconosciute automaticamente dagli strumenti. Tutta la documentazione, i commenti, i messaggi, i nomi scelti liberamente e i contenuti destinati alle persone sono in italiano.

## Identità grafica

La classe `formulario-ingegnerismo.cls` applica la palette derivata dal marchio, la gerarchia dei titoli, i riquadri operativi, le tabelle e le intestazioni. Copertina, aperture di parte e pagina conclusiva condividono lo stesso piè di pagina editoriale: `ingegnerismo.it` è la firma principale, mentre autore e metadati non vengono ripetuti. Il logo sorgente è conservato in `risorse/marchio/` come SVG; il documento utilizza la copia vettoriale PDF per una compilazione stabile. Le regole comuni sono descritte in `LINEE-GUIDA-GRAFICHE.md`.

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

Le etichette e le versioni GitHub già pubblicate sono **immutabili**. Qualunque
modifica che cambi anche un solo byte del PDF — contenuto, grafica, metadati,
font, collegamenti o processo di generazione — richiede un nuovo numero di
versione. Non si sposta un'etichetta esistente e non si sostituiscono i suoi
allegati.

La revisione usa una sola cifra: dopo `v.1.9` viene `v.2.0`; `v.1.10` non è un
identificativo ammesso per questa collana.

## Collegamento dal sito

La pagina editoriale del formulario è:

```text
https://ingegnerismo.it/matematica/formulario-analisi-1/
```

La copia `v.1.2` distribuita dal sito è disponibile all'indirizzo:

```text
https://ingegnerismo.it/downloads/formulari/formulario-analisi-1/formulario-analisi-matematica-1-v1.2.pdf
```

Il file [`formulario.json`](formulario.json) registra per questa copia versione,
numero di pagine, checksum SHA-256, pagina pubblica e commit sorgente. I
metadati descrivono il PDF conservato su ingegnerismo.it: non attestano
l'identità con un allegato GitHub che riporti lo stesso numero editoriale. Per
confrontare copie provenienti da canali diversi occorre verificarne i checksum.

Il PDF non viene inserito nella cronologia del ramo `main`. GitHub conserva il
sorgente, le etichette, le versioni pubblicate e le somme di controllo; il sito
può distribuire una propria copia verificata.

Lo script `strumenti/pubblica-versione.sh v1.3` può creare soltanto una versione
nuova. Richiede un ramo `main` pulito e già sincronizzato con `origin/main`, e si
interrompe se l'etichetta o la versione GitHub esistono già. Lo script invia la
nuova etichetta; il flusso GitHub Actions è l'unico processo che crea la release
e i relativi allegati.

## Partecipare al progetto

I modelli guidati permettono di segnalare un errore matematico, proporre un
miglioramento oppure descrivere un problema grafico o di accessibilità. Le
domande generali e le proposte ancora da definire appartengono alle
[Discussioni](https://github.com/decarlocarolis/formulario-analisi-matematica-1/discussions).

Le istruzioni complete, compresi originalità, limiti del contributo e licenza,
sono raccolte in [`CONTRIBUTING.md`](CONTRIBUTING.md).

## Licenza

Salvo diversa indicazione, i contenuti editoriali, il PDF e i sorgenti LaTeX sono concessi con licenza **Creative Commons Attribuzione–Non commerciale 4.0 Internazionale (CC BY-NC 4.0)**. Sono consentite condivisione e modifiche per finalità non commerciali, con attribuzione a **Carlo de Carolis**, collegamento a **ingegnerismo.it**, indicazione della licenza e delle modifiche effettuate.

Il logo e i segni distintivi di ingegnerismo.it sono esclusi dalla licenza. L'autore conserva il diritto di pubblicare e vendere future edizioni, comprese quelle cartacee. La licenza applicata alle versioni già pubblicate resta irrevocabile nei termini della CC BY-NC 4.0. Ambito, attribuzione consigliata ed esclusioni sono specificati in [`LICENZA.md`](LICENZA.md).

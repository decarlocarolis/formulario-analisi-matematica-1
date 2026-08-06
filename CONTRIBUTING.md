# Contribuire al formulario

Segnalazioni e contributi devono riferirsi a una copia identificabile del PDF.
Indica sempre versione, pagina, sezione e provenienza del file consultato.

## Scegli il canale adatto

- usa la [segnalazione di errore matematico](https://github.com/decarlocarolis/formulario-analisi-matematica-1/issues/new?template=segnalazione-errore-matematico.yml)
  per formule, ipotesi, domini, casi limite o risultati errati;
- usa la [proposta di miglioramento](https://github.com/decarlocarolis/formulario-analisi-matematica-1/issues/new?template=proposta-miglioramento.yml)
  per contenuti mancanti, organizzazione o nuove tabelle;
- usa il [problema grafico o di accessibilità](https://github.com/decarlocarolis/formulario-analisi-matematica-1/issues/new?template=problema-grafico-accessibilita.yml)
  per impaginazione, leggibilità, contrasto, collegamenti o fruizione assistiva;
- usa la pagina [Contribuisci](https://ingegnerismo.it/contribuisci/) se non
  vuoi o non puoi utilizzare GitHub.

Non pubblicare dati personali, elaborati d'esame riservati o materiale protetto
di terzi.

## Pull request

Una modifica deve essere circoscritta e partire da `main`. Non modificare
manualmente il PDF: intervieni sui sorgenti LaTeX e lascia che il flusso
automatico ricompili il documento.

Prima di aprire una pull request:

```bash
python -m pip install -r requisiti-verifica.txt
make controlla
make verifica-formule
make pdf
```

Indica nel testo della pull request:

- problema risolto;
- versione, pagina e sezione coinvolte;
- fonti o calcoli di verifica, quando necessari;
- eventuali effetti sull'impaginazione.

## Versioni e Release

Tag e Release pubblicati sono immutabili. Qualunque modifica che cambi il PDF
richiede una nuova versione `v.MAGGIORE.MINORE`; sono ammessi identificativi come
`v1.9`, `v1.10` e `v2.0`.

## Originalità e diritti

Il contributore dichiara di essere titolare del materiale inviato e autorizza
l'integrazione, la modifica e la distribuzione del contributo nel progetto. Le
parti editoriali incorporate seguono la licenza CC BY-NC 4.0 del formulario.
Logo e segni distintivi non sono concessi. Gli strumenti tecnici restano
soggetti alle condizioni indicate in `LICENZA.md`.

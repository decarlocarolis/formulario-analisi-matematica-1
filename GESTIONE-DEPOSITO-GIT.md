# Gestione del deposito GitHub

Deposito pubblico:

```text
https://github.com/decarlocarolis/formulario-analisi-matematica-1
```

## Ramo e versioni

- ramo predefinito: `main`;
- versione editoriale corrente: `v.1.2`;
- etichetta Git corrispondente: `v1.2`;
- le segnalazioni usano modelli distinti per errori matematici, miglioramenti e problemi grafici o di accessibilità;
- le domande generali usano le Discussioni;
- ogni nuova etichetta di versione avvia la compilazione e pubblica PDF, sorgenti e somme di controllo.

Un'etichetta e una versione GitHub pubblicate non vengono mai spostate,
modificate o sovrascritte. Qualunque cambiamento che produca un PDF con byte
diversi richiede un nuovo numero editoriale, anche quando riguarda soltanto
grafica, metadati, collegamenti o ottimizzazione del file.
La revisione usa una sola cifra: dopo `v.1.9` viene `v.2.0`.

## Rami e contributi

Le modifiche si preparano in un ramo dedicato e arrivano su `main` tramite pull
request. Ogni proposta deve essere circoscritta e rispettare
[`CONTRIBUTING.md`](CONTRIBUTING.md). Non inserire materiale protetto di terzi;
le porzioni editoriali incorporate vengono distribuite con licenza CC BY-NC
4.0.

## Sequenza di pubblicazione

1. aggiornare numero e data in `metadati.tex`, cronologia, note di pubblicazione e `formulario.json`;
2. controllare il progetto con `make controlla`;
3. compilare e verificare il PDF con `make pdf`;
4. registrare le modifiche, completare la pull request e sincronizzare `main` con `origin/main`;
5. verificare che la nuova etichetta e la relativa versione GitHub non esistano;
6. creare e inviare l'etichetta annotata della nuova versione;
7. verificare il flusso automatico e i tre allegati pubblicati: PDF, sorgenti e somme di controllo.

Lo script `strumenti/pubblica-versione.sh vMAGGIORE.MINORE` automatizza
controlli, compilazione locale e invio dell'etichetta quando il client `gh` è
installato e autenticato. L'invio dell'etichetta avvia il flusso GitHub Actions,
che è l'unico processo incaricato di creare la nuova versione e i suoi
allegati. Lo script non crea commit e non invia il ramo: prima di iniziare
richiede esattamente un argomento, il ramo `main`, un worktree pulito, il commit
corrente già presente su `origin/main` e l'assenza locale e remota
dell'etichetta e della versione GitHub richieste. Se una di queste condizioni
manca, si interrompe senza sostituire alcun artefatto.

## Provenienza delle copie

Il file [`formulario.json`](formulario.json) descrive in modo leggibile dalle
macchine la copia PDF pubblicata su ingegnerismo.it, compresi URL, pagine,
checksum e commit sorgente. Il numero editoriale non basta a dimostrare che una
copia del sito e un allegato GitHub abbiano gli stessi byte: ogni canale deve
essere verificato con il proprio checksum.

# Gestione del deposito GitHub

Deposito pubblico:

```text
https://github.com/decarlocarolis/formulario-analisi-matematica-1
```

## Ramo e versioni

- ramo predefinito: `main`;
- versione editoriale corrente: `v.1.2`;
- etichetta Git corrispondente: `v1.2`;
- le segnalazioni matematiche possono essere aperte tramite il modello dedicato;
- ogni etichetta di versione avvia la compilazione e pubblica PDF, sorgenti e somme di controllo.

## Sequenza di pubblicazione

1. controllare il progetto con `make controlla`;
2. compilare il PDF con `make pdf`;
3. registrare le modifiche nel ramo `main`;
4. creare l'etichetta annotata della versione;
5. inviare ramo ed etichetta a GitHub;
6. verificare il flusso automatico e i file allegati alla versione pubblicata.

Lo script `strumenti/pubblica-versione.sh` automatizza i passaggi Git e GitHub quando il client `gh` è installato e autenticato.

# Gestione del deposito GitHub

Deposito pubblico:

```text
https://github.com/decarlocarolis/formulario-analisi-matematica-1
```

## Regole

- il ramo canonico è `main`;
- le modifiche passano tramite pull request;
- tag e Release pubblicati non si spostano e non si sovrascrivono;
- una modifica del PDF richiede una nuova versione;
- la versione usa il formato `v.MAGGIORE.MINORE`, senza limite a una sola cifra
  per il numero minore;
- il workflow manuale compila ma non pubblica.

## Pubblicazione

1. aggiorna `metadati.tex`, `formulario.json`, `CRONOLOGIA.md` e le note di
   pubblicazione;
2. esegui `make pdf`;
3. integra la modifica in `main`;
4. esegui `strumenti/pubblica-versione.sh v1.3` sostituendo la versione corretta;
5. verifica l'esecuzione GitHub Actions e i tre allegati della nuova Release.

Lo script rifiuta worktree sporchi, `main` non sincronizzato, tag esistenti e
Release esistenti. Non registra file, non invia `main` e non usa force push.

## Protezioni consigliate nelle impostazioni GitHub

Configura un ruleset per:

- richiedere pull request su `main`;
- richiedere il controllo «Controllo e compilazione»;
- vietare force push e cancellazione di `main`;
- proteggere i tag `v*.*` da modifica e cancellazione.

Queste impostazioni appartengono alla configurazione del repository e non ai
file versionati.

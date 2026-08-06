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

## Configurazione amministrativa

Lo script seguente controlla la configurazione senza modificarla:

```bash
strumenti/configura-deposito-github.sh verifica
```

Con un account `gh` autenticato e amministratore, il comando seguente:

- abilita la cancellazione automatica dei rami dopo il merge;
- mantiene soltanto lo squash merge;
- protegge `main` da cancellazioni e force push;
- richiede pull request, conversazioni risolte e il controllo
  «Controllo e compilazione»;
- consente al proprietario di superare le regole soltanto all'interno di una
  pull request, mai mediante push diretto;
- protegge i tag `v*.*` da modifica e cancellazione;
- elimina soltanto i rami `agent/*`, `tecnico/*`, `codex/*` e `dependabot/*`
  che non hanno pull request aperte.

```bash
strumenti/configura-deposito-github.sh applica
```

Lo script è idempotente: aggiorna i ruleset con lo stesso nome e può essere
rieseguito dopo modifiche amministrative.

## Pubblicazione

1. aggiorna `metadati.tex`, `formulario.json`, `CRONOLOGIA.md` e le note di
   pubblicazione;
2. esegui `make pdf`;
3. integra la modifica in `main`;
4. esegui `strumenti/pubblica-versione.sh v1.3` sostituendo la versione corretta;
5. verifica l'esecuzione GitHub Actions e i tre allegati della nuova Release.

Lo script di pubblicazione rifiuta worktree sporchi, `main` non sincronizzato,
tag esistenti e Release esistenti. Non registra file, non invia `main` e non usa
force push.

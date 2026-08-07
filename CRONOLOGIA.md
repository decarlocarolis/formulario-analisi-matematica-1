# Cronologia delle modifiche

Tutte le modifiche rilevanti del formulario sono registrate in questo file.

## [v.1.3] - 2026-08-07

### Modificato

- rimossa l'attribuzione personale dal frontespizio;
- aggiunta una pagina interna per autore, contributori e licenza;
- predisposti metadati e criteri espliciti per riconoscere i contributi futuri.

## [v.1.2] - 2026-08-06

### Aggiunto

- progetto LaTeX modulare come sorgente canonico;
- guida iniziale «riconoscimento → scelta → procedura → controllo»;
- mappa rapida «tipo di esercizio → metodo»;
- procedure operative per successioni, limiti, continuità, derivate, teoremi, Taylor, studio di funzione, integrali e serie;
- riquadri per errori frequenti e controlli finali;
- compilazione automatica con GitHub Actions;
- pubblicazione del PDF e del pacchetto dei sorgenti nelle versioni GitHub;
- avviso completo di licenza in `LICENZA.md`.

### Revisione grafica della stessa versione pubblicata

- palette allineata ai colori ufficiali del marchio di ingegnerismo.it;
- copertina ridisegnata con logo vettoriale;
- nuova gerarchia per parti, capitoli e sezioni;
- riquadri operativi, tabelle, intestazioni e piè di pagina uniformati;
- associazione cromatica dei riquadri resa semantica: rosso per gli errori, verde per i controlli, giallo per le formule chiave e blu per struttura, metodo e procedure;
- testate dei riquadri integrate nel bordo, con geometria e spaziature uniformi;
- parentesi graffe estensibili affidate a un carattere matematico di fallback per eliminare giunzioni e artefatti;
- compilazione automatica fissata a TeX Live 2025 per una resa riproducibile;
- frontespizio semplificato secondo una griglia editoriale, con titolo e sottotitolo dominanti;
- pagine di apertura delle parti uniformate al frontespizio;
- piè di pagina delle pagine di apertura unificato: `ingegnerismo.it` è la firma principale a sinistra e i metadati restano secondari a destra;
- nome dell’autore eliminato dai piè di pagina ripetitivi e mantenuto una sola volta sul frontespizio;
- sottotitolo ufficiale del marchio corretto in «Atlante dell'Ingegneria» su tutte le pagine di apertura.

### Licenza e diritti

- PDF, contenuti editoriali e sorgenti LaTeX concessi con licenza CC BY-NC 4.0;
- consentite condivisione e modifiche esclusivamente per finalità non commerciali;
- attribuzione richiesta a Carlo de Carolis con collegamento a ingegnerismo.it, licenza e indicazione delle modifiche;
- logo e segni distintivi esclusi dalla licenza Creative Commons;
- diritto dell'autore di pubblicare e vendere edizioni cartacee o successive espressamente chiarito;
- versione editoriale mantenuta a `v.1.2`.

### Modificato

- il formulario è orientato ai problemi, non alla sola esposizione di formule o teoria;
- la teoria meno utile negli esercizi è subordinata alle procedure;
- i collegamenti a ingegnerismo.it sono assoluti, così funzionano anche nel PDF;
- il processo editoriale passa dal Markdown destinato al sito a un progetto LaTeX con PDF;
- documentazione, commenti, messaggi e nomi liberamente definibili sono stati uniformati in italiano.

### Conservato

- contenuto matematico corretto della revisione v.1.1;
- domini, ipotesi, casi limite, formule inverse lecite e simbologia esplicita;
- esclusione esplicita delle EDO, mantenute nel formulario dedicato di EDO e Analisi Numerica.

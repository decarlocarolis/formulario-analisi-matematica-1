# Linee guida grafiche del formulario

Questo documento descrive il sistema visivo adottato dal **Formulario di Analisi Matematica I v.1.2**. Le stesse regole costituiscono la base per i successivi formulari della collana di ingegnerismo.it.

La dicitura istituzionale associata al marchio è **«Atlante dell'Ingegneria»** e deve essere utilizzata senza varianti nelle copertine, nelle pagine di parte e nelle pagine conclusive.

## Principi

Il progetto grafico deve favorire la consultazione durante lo studio e la preparazione degli esami. Le priorità sono:

1. gerarchia immediatamente riconoscibile;
2. contrasto elevato e leggibilità anche in stampa;
3. uso limitato e coerente dei colori;
4. distinzione visiva tra metodo, procedura, formula, errore e controllo;
5. continuità fra copertina, pagine interne e identità del sito.

## Palette istituzionale

| Ruolo | Colore | Codice |
|---|---|---|
| blu primario | collegamenti, sezioni, scelta del metodo | `#006FB9` |
| blu scuro | titoli, capitoli, struttura principale | `#00477A` |
| giallo accento | formule chiave, priorità e numeri di pagina | `#FFEE84` |
| nero testo | testo principale | `#1D1D1B` |
| grigio testo | metadati e contenuti secondari | `#666665` |
| grigio medio | bordi neutri | `#A4A3A3` |
| bianco | sfondo principale | `#FFFFFF` |

Le tinte pallide utilizzate come sfondo sono derivate dai colori istituzionali. Due accenti funzionali, entrambi attenuati, sono riservati esclusivamente alla semantica dei riquadri: rosso `#9E3D32` per gli errori e verde `#2F6B57` per i controlli conclusivi. Non sono impiegati come colori decorativi o strutturali.

## Tipografia

- testo corrente: Libertinus Serif;
- titoli, etichette e navigazione: Libertinus Sans;
- formule: Libertinus Math, con STIX Two Math limitato alle parentesi graffe estensibili per evitare giunzioni visibili dei delimitatori;
- corpo principale: 11 pt su pagina A4.

Non vengono incorporati font esterni nel deposito: la compilazione usa i font disponibili nella distribuzione TeX.

## Componenti

### Frontespizio

Il frontespizio usa una griglia editoriale essenziale: dorso blu ridotto con accento giallo, identificazione della collana, titolo e sottotitolo dominanti, ampio spazio bianco, un segno matematico di fondo molto tenue e metadati compatti. Il piè di pagina comune presenta `ingegnerismo.it` come firma principale, seguito soltanto da versione, data e licenza. I nomi personali non compaiono sul frontespizio: autore, responsabilità editoriale, contributori e licenza sono raccolti nella pagina interna dedicata. Obiettivo e sequenza «Riconosci → Scegli → Esegui → Controlla» sono sviluppati nella pagina «Come usare questo formulario», non sulla copertina.

### Parti e capitoli

- le parti hanno una pagina di apertura autonoma costruita sulla stessa griglia del frontespizio;
- il titolo della parte occupa l'area superiore, il numero funge da filigrana e la descrizione è raccolta in un riquadro neutro;
- tutte le pagine di apertura usano lo stesso piè di pagina: sito e marchio compatto a sinistra, metadati secondari a destra;
- i capitoli usano un numero bianco in campo blu scuro;
- una linea gialla separa il titolo dal contenuto;
- sezioni e sottosezioni usano i due blu istituzionali.

### Riquadri operativi

- **Obiettivo operativo**: blu scuro;
- **Scelta del metodo**: blu primario;
- **Procedura d'esame**: testata azzurro chiaro e corpo bianco;
- **Formula chiave**: accento giallo;
- **Errore frequente**: rosso attenuato, riservato alle condizioni di rischio o agli errori;
- **Controllo finale**: verde attenuato, riservato alle verifiche conclusive;
- **Richiamo teorico essenziale**: grigio neutro.

Le testate sono integrate nel perimetro del riquadro, senza etichette flottanti. Il significato non dipende soltanto dal colore: titolo esplicito, bordo e disposizione restano distinguibili anche in scala di grigi.

### Tabelle

Le tabelle usano righe alternate molto chiare, linee sottili e intestazioni ad alto contrasto. Sono evitate griglie pesanti e sfondi saturi estesi.

### Intestazioni e piè di pagina

L'intestazione riporta capitolo e volume. Il piè di pagina contiene sito, versione e numero di pagina evidenziato con l'accento giallo.

## Marchio

Il file SVG è il sorgente vettoriale del logo. Il PDF vettoriale è la copia utilizzata dalla compilazione LaTeX per evitare dipendenze aggiuntive nella procedura automatica.

Il logo non deve essere deformato, ruotato, ricolorato o collocato su sfondi che ne riducano il contrasto. Nelle pagine di apertura il simbolo è usato in formato compatto, a sinistra del dominio `ingegnerismo.it`. Il dominio ha priorità tipografica sul simbolo e sui metadati secondari.

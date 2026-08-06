# Verifica matematica e controlli di regressione

Il formulario è stato revisionato manualmente controllando domini, ipotesi,
rami, segni, formule inverse, casi limite e condizioni di applicabilità. I test
automatici servono a intercettare regressioni durante le modifiche future; non
costituiscono una dimostrazione formale della correttezza di ogni riga.

## Verifiche simboliche automatiche

Lo script `strumenti/verifica_formule.py` esegue 35 controlli con SymPy, fra cui:

- derivate elementari, prodotto, quoziente e catena;
- primitive, teorema fondamentale e integrazione per parti;
- limiti notevoli;
- sviluppi di Taylor di esponenziale e seno;
- identità trigonometriche e binomio di Newton;
- somme geometriche e somme campione;
- formula di Eulero, radici di un trinomio e relazioni di Viète;
- ricorrenza Gamma e identità Beta-Gamma campione.

Esecuzione locale:

```bash
python -m pip install -r requisiti-verifica.txt
python strumenti/verifica_formule.py
```

## Limiti del controllo

I test verificano formule rappresentative in casi simbolici selezionati. Non
sostituiscono:

- la revisione delle ipotesi dei teoremi;
- il controllo della chiarezza procedurale;
- la verifica grafica del PDF;
- il confronto con programmi d'esame e convenzioni didattiche differenti.

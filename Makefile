PDF=distribuzione/formulario-analisi-matematica-1.pdf

.PHONY: pdf controlla verifica-formule pulisci pacchetto-sorgenti

pdf: controlla verifica-formule
	mkdir -p compilazione distribuzione
	bash strumenti/compila-pdf.sh compilazione
	cp compilazione/formulario.pdf $(PDF)

controlla:
	python strumenti/controlla_progetto.py

verifica-formule:
	python strumenti/verifica_formule.py

pulisci:
	rm -rf compilazione distribuzione

pacchetto-sorgenti:
	mkdir -p distribuzione
	git archive --format=zip --output=distribuzione/formulario-analisi-matematica-1-sorgenti.zip HEAD

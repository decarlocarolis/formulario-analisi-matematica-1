PDF=dist/formulario-analisi-matematica-1.pdf

.PHONY: pdf check clean release-source

pdf: check
	mkdir -p build dist
	bash tools/build_pdf.sh build
	cp build/main.pdf $(PDF)

check:
	python tools/check_project.py

clean:
	rm -rf build dist

release-source:
	mkdir -p dist
	git archive --format=zip --output=dist/formulario-analisi-matematica-1-source.zip HEAD

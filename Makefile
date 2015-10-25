pdf: *.md pdf/template.tex
	mkdir -p build
	pandoc --toc -s --template=pdf/template.tex -f markdown -t latex *.md -o build/majbook.pdf
clean:
	rm -rf build

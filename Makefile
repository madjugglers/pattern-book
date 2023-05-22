pdf: *.md
	
	mkdir -p build
	pandoc 			 --toc \
				 --columns=300 \
				 -s \
				 --template=qdf/template.tex \
				 -V title="Madison Area Jugglers' Pattern Book" \
				 -V documentclass=book \
				 -V geometry="textwidth=468pt" \
				 -V geometry="textheight=674pt" \
				 -V geometry="voffset=10pt" \
				 -V majpatternbookversion="3.1" \
				 -V date="\today" \
				 -V fontsize=12pt \
				 -V links-as-notes=True \
				 -f markdown \
				 -t latex \
				 chapters/*.md \
				 appendices/*.md \
				 -o build/majbook.pdf
clean:
	rm -rf build

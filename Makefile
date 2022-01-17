SHELL=/bin/bash -O extglob -c

pdf: *.md
	
	mkdir -p build
	pandoc 			 --toc \
				 --columns=300 \
				 -s \
				 --template=pdf/template.tex \
				 -V title="Madison Area Jugglers' Pattern Book" \
				 -V documentclass=book \
				 -V subtitle="Version 3.1.01" \
				 -V date="\today" \
				 -V geometry="margin=1in" \
				 -V fontsize=12pt \
				 -V links-as-notes=True \
				 -f markdown \
				 -t latex \
				 !(*README).md \
				 -o build/majbook.pdf
clean:
	rm -rf build

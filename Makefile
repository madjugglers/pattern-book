
pdf: *.md
	mkdir -p build
	pandoc 			 --toc \
				 --columns=300 \
				 -s \
				 --template=pdf/template.tex \
				 -V title="Madison Area Jugglers' Pattern Book" \
				 -V documentclass=book \
				 -V subtitle="Version 3.1" \
				 -V date="\today" \
				 -V geometry="margin=1in" \
				 -V links-as-notes=True \
				 -f markdown \
				 -t latex \
				 *.md \
				 -o build/majbook.pdf
clean:
	rm -rf build

default:
	make clean
	timetravel.rb sample.tex
	pdflatex sample
	timetravel.rb sample.tex
	pdflatex sample
	timetravel.rb sample.tex
	pdflatex sample
	timetravel.rb sample.tex
	pdflatex sample

clean:
	rm -f *.aux
	rm -Rf timetravel

doc:
	markdown README.md >README.html

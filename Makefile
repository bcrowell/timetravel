default:
	make clean
	timetravel.rb a.tex
	pdflatex a
	timetravel.rb a.tex
	pdflatex a
	timetravel.rb a.tex
	pdflatex a
	timetravel.rb a.tex
	pdflatex a

clean:
	rm -f *.aux
	rm -Rf timetravel

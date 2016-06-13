default:
	make clean
	timetravel.rb a.tex a2.tex
	pdflatex a2
	timetravel.rb a.tex a2.tex
	pdflatex a2
	timetravel.rb a.tex a2.tex
	pdflatex a2
	timetravel.rb a.tex a2.tex
	pdflatex a2

clean:
	rm -f *.aux
	rm -Rf timetravel

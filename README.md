This is a proof-of-concept package that allows us to implement "time travel" in LaTeX
by causing a float to be invoked on the page before the page on which its source code
occurs. This can be used in a two-column document to make a full-page-width float
show up on the same page as the one on which it was invoked.
http://tex.stackexchange.com/questions/314257/time-travel-in-latex

Before each compilation of the document, a separate ruby script must be run, like this:
  timetravel.rb foo.tex
The tex file should contain code like this:
  \begin{timetravel}
  ...
  \end{timetravel}
The material inside the timetravel environment will be typeset on the page before
the one on which it was invoked in the source code. Because the ruby script has
to be able to parse the tex file, the begin and end statements for each timetravel
environment must be the first things other than whitespace to occur on their lines.

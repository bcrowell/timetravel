This is a package that allows us to implement "time travel" in LaTeX
by causing a float to be invoked on the page before the page on which
its source code occurs. This can be used in a two-column document to
make a full-page-width float show up on the same page as the one on
which it was invoked.

See [http://tex.stackexchange.com/questions/314257/time-travel-in-latex](http://tex.stackexchange.com/questions/314257/time-travel-in-latex).

Before each compilation of the document, a separate ruby script must be run, like this:

    timetravel.rb foo.tex

The tex file should contain code like this:

    \usepackage{timetravel}
      ...
      ... % Floats will not land here.
      ...
    \timetravelenable % Starting at this point in the document, floats can arrive.
      ...
      ... 
    \begin{timetravel}
      ... % code for a floating environment
    \end{timetravel}

The material inside the timetravel environment will be sent back in
time to the page before the one on which it was invoked in the source
code. In the application of interest, this should cause the float to
be typeset on the same page as the one on which it was invoked.

Because the ruby script has to be able to parse the tex file, the
begin and end statements for each timetravel environment must be the
first things other than whitespace to occur on their lines. 

The package does its best to produce the desired result, which is that
the float lands on the intended page. Over the first few compilations,
the float may jump around. It should normally converge to a definite
result after compiling the document three times. Compiling a fourth or
subsequent times should not cause floats to move to different pages.

Bugs:

Won't work properly if there is more than one tex source file in the
same document.  This is both because the variable "key" in the ruby
code is per-document and because every time the ruby code is run, it
thinks it's a new pass.

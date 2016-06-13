This is a package that allows us to implement "time travel" in LaTeX
by causing a float to be invoked on the page before the page on which
its source code occurs. This can be used in a two-column document to
make a full-page-width float show up on the same page as the one on
which it was invoked.

See [http://tex.stackexchange.com/questions/314257/time-travel-in-latex](http://tex.stackexchange.com/questions/314257/time-travel-in-latex).

Before each compilation of the document, a separate ruby script must be run, like this:

    timetravel.rb foo.tex

The tex file should contain code like this:

    \usepackage[auto]{timetravel}
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

To start compilation from scratch, delete the subdirectory, named
timetravel, that is automatically created by the script.

Because the ruby script has to be able to parse the tex file, the
begin and end statements for each timetravel environment must be the
first things other than whitespace to occur on their lines. 

The package does its best to produce the desired result, which is that
the float lands on the intended page. Over the first few compilations,
the float may jump around. It should normally converge to a definite
result after compiling the document three times. Compiling a fourth or
subsequent times should not cause floats to move to different pages.

The auto option causes every paragraph break after \timetravelenable
to be a possible place for the time-traveling material to arrive.
This option may be unreliable, because it's an error if the material
arrives somwehere that's not in outer paragraph mode. The package
attempts to detect this, but detection may not be reliable. It may be
safer to turn off the auto option. In this case, time-traveling
material can only arrive at locations that are explicitly marked with
the macro \timetraveltohere. For example:

    \usepackage{timetravel}
    I shot an arrow into the air.\timetraveltohere
    It fell to earth, I knew not where.
    \begin{timetravel}
      ... % code for a floating environment
    \end{timetravel}

If the latex document is built from multiple input files, then the
ruby script isn't smart enough to count how many compilation passes
have been made, and you have to tell it by hand, like this:

  timetravel.rb book.tex 1
  timetravel.rb ch1.tex 1
  timetravel.rb ch2.tex 1
  pdflatex book
  timetravel.rb book.tex 2
  timetravel.rb ch1.tex 2
  timetravel.rb ch2.tex 2
  pdflatex book
  ...

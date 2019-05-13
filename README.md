# dupeGuru

[dupeGuru][dupeguru] is a cross-platform (Linux, OS X, Windows) GUI tool to find duplicate files in
a system. It's written mostly in Python 3 and has the peculiarity of using
[multiple GUI toolkits][cross-toolkit], all using the same core Python code. On OS X, the UI layer
is written in Objective-C and uses Cocoa. On Linux, it's written in Python and uses Qt5.

The Cocoa UI of dupeGuru is hosted in a separate repo: https://github.com/hsoft/dupeguru-cocoa

## Current status: Additional Maintainers Wanted (/ Note on Things in General)

I've been using dupeguru for a little while, mostly for reducing the disk space I'm using for media --
I have a habit of copying all the files off my camera card, then not deleting them (just in case my
laptop loses the data), which gives me a couple dozen copies of IMG0042774.jpg.  And the same with
MP3 and video files.  Plus, when trying to take pictures of kids and family, it's best to take a
couple dozen since all but one of them will have somebody blinking or looking away or making a silly
face.  I leave finding that one good picture til later.

--Joe Moore

### Comments from Previous maintainers...
When I started contributing to dupeGuru, it was to help provide an updated Windows build for dupeGuru.  I hoped to contribute more over time and help work through some of the general issues as well.  Since Virgil Dupras left as the lead maintainer, I have not been able to devote enough time to work through as many issues as I had hoped.  Now I am going to be devoting a more consistent amount of time each month to work on dupeGuru, however I will not be able to get to all issues.  Additionally there are a few specific areas where additional help would be appreciated:

- OSX maintenance
  - UI issues (I have no experience with cocoa)
  - General issues & releases (I lack OSX environments / hardware to develop and test on, looking into doing builds through Travis CI.)
- Linux maintenance
  - Packaging (I have not really done much linux packaging yet, although will be spending some time trying to get at least .deb and potentially ppa's updated.)

I am still working to update the new site & update links within the help and the repository to use the new urls.  Additionally, hoping to get a 4.0.4 release out this year for at least Windows and Linux.

Thanks,

Andrew Senetar

## Contents of this folder

This folder contains the source for dupeGuru. Its documentation is in `help`, but is also
[available online][documentation] in its built form. Here's how this source tree is organised:

* core: Contains the core logic code for dupeGuru. It's Python code.
* qt: UI code for the Qt toolkit. It's written in Python and uses PyQt.
* images: Images used by the different UI codebases.
* pkg: Skeleton files required to create different packages
* help: Help document, written for Sphinx.
* locale: .po files for localisation.

There are also other sub-folder that comes from external repositories and are part of this repo as
git submodules:

* hscommon: A collection of helpers used across HS applications.
* qtlib: A collection of helpers used across Qt UI codebases of HS applications.

## How to build dupeGuru from source

### Windows
For windows instructions see the [Windows Instructions](Windows.md).

### Prerequisites

* [Python 3.7+][python]
* PyQt5

### make

dupeGuru is built with "make":

    $ make
    $ make run

### Generate Ubuntu packages

    $ bash -c "pyvenv --system-site-packages env && source env/bin/activate && pip install -r requirements.txt && python3 build.py --clean && python3 package.py"

### Running tests

The complete test suite is run with [Tox 1.7+][tox]. If you have it installed system-wide, you
don't even need to set up a virtualenv. Just `cd` into the root project folder and run `tox`.

If you don't have Tox system-wide, install it in your virtualenv with `pip install tox` and then
run `tox`.

You can also run automated tests without Tox. Extra requirements for running tests are in
`requirements-extra.txt`. So, you can do `pip install -r requirements-extra.txt` inside your
virtualenv and then `py.test core hscommon`

[dupeguru]: https://dupeguru.voltaicideas.net/
[cross-toolkit]: http://www.hardcoded.net/articles/cross-toolkit-software
[documentation]: http://dupeguru.voltaicideas.net/help/en/
[python]: http://www.python.org/
[pyqt]: http://www.riverbankcomputing.com
[tox]: https://tox.readthedocs.org/en/latest/

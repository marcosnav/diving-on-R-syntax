# R cheatsheet
# devtools
create_package("pkgname")
use_git()               # Handy way to create a .gitignore with files like .Rhistory, .Rdata, etc.
use_r("mymethod")       # Creates R/mymethod.R file
use_package("forcats")  # Adds dependencies/packages to Imports in DESCRIPTION

use_mit_license("Bob")  # Handy way to update package's LICENSE
use_readme_rmd()        # Creates README.Rmd
build_readme()          # Generates README.md with the existing .Rmd file
load_all()              # Load current package functions
check()                 # Checks package is ok

document()            # Creates man/ dir documents based on in-file docs
?your.method          # Shows generated docs in terminal/session

use_testthat()        # Create tests dir scaffold
use_test("filename")  # Create testfile for filename
test()                # Run tests

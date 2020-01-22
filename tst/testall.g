#
# srgs: A library of small strongly regular graphs and related functions
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "agt" );

TestDirectory(DirectoriesPackageLibrary( "agt", "tst" ),
  rec(exitGAP := true, 
  testOptions := rec(compareFunction := "uptowhitespace")));

FORCE_QUIT_GAP(1); # if we ever get here, there was an error

#
# srgs: A library of small strongly regular graphs and related functions
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "agt" );

x:=Indeterminate(Rationals, "x");
y:=Indeterminate(Rationals, "y");
d:=Indeterminate(Rationals, "d");
TestDirectory(DirectoriesPackageLibrary( "agt", "tst" ),
  rec(exitGAP := true));

FORCE_QUIT_GAP(1); # if we ever get here, there was an error

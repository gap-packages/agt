#############################################################################
##
#W  frmgrph.tst          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Test file for functions that construct graphs on bilinear forms. 
##
gap> START_TEST("AGT package: frmgrph.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# BilinearFormsGraph
gap> gamma:=BilinearFormsGraph(2,2,2);;
gap> SRGParameters(gamma);
[ 16, 9, 4, 6 ]

# HermiteanFormsGraph
gap> gamma:=HermiteanFormsGraph(2,3);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 20 ], [ 1, 1, 18 ], [ 6, 14, 0 ] ]

# Filter variants
gap> BilinearFormsGraph(IsFormsGraph and FullAutomorphismGroup,2,2,2).order;
16
gap> BilinearFormsGraph(FullAutomorphismGroup,2,2,2).order;
16
gap> HermiteanFormsGraph(IsFormsGraph,2,3).order;
81

# Usage errors
gap> BilinearFormsGraph(1,1,1,1,1,1,1);
Error, usage: BilinearFormsGraph( [<filter>, ]<int>, <int>, <int> )
gap> HermiteanFormsGraph(1,1,1,1,1,1,1);
Error, usage: HermiteanFormsGraph( [<filter>, ]<int>, <int> )

# End test
gap> STOP_TEST("AGT package: frmgrph.tst",0);  
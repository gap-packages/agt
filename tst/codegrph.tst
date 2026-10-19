#############################################################################
##
#W  codegrph.tst          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Test file for functions that construct graphs on codes. 
##
gap> START_TEST("AGT package: codegrph.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# PreparataGraph
gap> gamma:=PreparataGraph(2,2);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 15 ], [ 1, 0, 14 ], [ 2, 12, 1 ], [ 15, 0, 0 ] ]

# KasamiGraph
gap> gamma:=KasamiGraph(1,1,2);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 7 ], [ 1, 0, 6 ], [ 2, 0, 5 ], [ 3, 4, 0 ] ]

# ExtendedKasamiGraph
gap> gamma:=ExtendedKasamiGraph(1,1,2);;
gap> GlobalParameters(gamma); 
[ [ 0, 0, 8 ], [ 1, 0, 7 ], [ 2, 0, 6 ], [ 3, 0, 5 ], [ 8, 0, 0 ] ]

# QuadraticKasamiGraph
gap> gamma:=QuadraticKasamiGraph(2);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 15 ], [ 1, 2, 12 ], [ 4, 10, 1 ], [ 15, 0, 0 ] ]

# ExtendedQuadraticKasamiGraph
gap> gamma:=ExtendedQuadraticKasamiGraph(2);;
gap> GlobalParameters(gamma);                
[ [ 0, 0, 16 ], [ 1, 0, 15 ], [ 4, 0, 12 ], [ 15, 0, 1 ], [ 16, 0, 0 ] ]

# End test
gap> STOP_TEST("AGT package: codegrph.tst",0);  
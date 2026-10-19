#############################################################################
##
#W  spcsgrph.tst          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Test file for functions that construct graphs on subspaces. 
##
gap> START_TEST("AGT package: spcsgrph.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# GrassmannGraph
gap> gamma:=GrassmannGraph(4,4,2);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 100 ], [ 1, 35, 64 ], [ 25, 75, 0 ] ]

# DoubledGrassmannGraph
gap> gamma:=DoubledGrassmannGraph(3,1);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 4 ], [ 1, 0, 3 ], [ 1, 0, 3 ], [ 4, 0, 0 ] ]

# TwistedGrassmannGraph
gap> gamma:=TwistedGrassmannGraph(2,2);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 42 ], [ 1, 17, 24 ], [ 9, 33, 0 ] ]

# PolarGraphO
gap> gamma:=PolarGraphO(5,3);;
gap> SRGParameters(gamma);
[ 40, 12, 2, 4 ]

# PolarGraphNOorth
gap> gamma:=PolarGraphNOorth(1,5,3);;
gap> SRGParameters(gamma);
[ 45, 12, 3, 3 ]

# PolarGraphSP
gap> gamma:=PolarGraphSp(4,5);;
gap> SRGParameters(gamma);
[ 156, 30, 4, 6 ]

# PolarGraphU
gap> gamma:=PolarGraphU(4,2);;
gap> SRGParameters(gamma);    
[ 45, 12, 3, 3 ]

# DualPolarGraphB
gap> gamma:=DualPolarGraphB(2,4);;
gap> SRGParameters(gamma);
[ 85, 20, 3, 5 ]

# DualPolarGraphC
gap> gamma:=DualPolarGraphC(2,5);;
gap> SRGParameters(gamma);        
[ 156, 30, 4, 6 ]

# DualPolarGraphD
gap> gamma:=DualPolarGraphD(4,2);;
gap> GlobalParameters(gamma);     
[ [ 0, 0, 15 ], [ 1, 0, 14 ], [ 3, 0, 12 ], [ 7, 0, 8 ], [ 15, 0, 0 ] ]

# DualPolarGraph2D
gap> gamma:=DualPolarGraph2D(2,2);;
gap> SRGParameters(gamma);
[ 45, 12, 3, 3 ]

# DualPolarGraph2A
gap> gamma:=DualPolarGraph2A(4,3);;
gap> SRGParameters(gamma);
[ 112, 30, 2, 10 ]

# DoroGraph
gap> gamma:=DoroGraph(4);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 12 ], [ 1, 1, 10 ], [ 3, 6, 3 ], [ 8, 4, 0 ] ]

# UnitaryNonisotropicsGraph
gap> gamma:=UnitaryNonisotropicsGraph(3);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 6 ], [ 1, 1, 4 ], [ 1, 1, 4 ], [ 3, 3, 0 ] ]

# End test
gap> STOP_TEST("AGT package: spcsgrph.tst",0);  
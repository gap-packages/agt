#############################################################################
##
#W  dualfunc.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions involving duality functions.
##


# Default function for dual points.
DeclareGlobalFunction( "DefaultDualityFunction" );

# Default function for primal points.
DeclareGlobalFunction( "DefaultPrimalityFunction" );

# Duality function for bipartite doubles.
DeclareGlobalFunction( "BipartiteDoubleDualityFunction" );

# Duality function for Grassmann graphs.
DeclareGlobalFunction( "GrassmannDualityFunction" );

# Check whether function for dual and primal points exist,
# and add them if they do not.
DeclareGlobalFunction( "CheckDualityFunctions" );

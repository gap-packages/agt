#############################################################################
##
#W  grphinf.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions that collect graph info. 
##


# Checks whether a graph is an antipodal cover.
DeclareGlobalFunction( "IsAntipodalCover" );

# Covering index of an antipodal cover.
DeclareGlobalFunction( "AntipodalCoveringIndex" );

# Parameters of a generalized polygon.
# Does not check whether G actually is a generalized polygon
# (for d = 2 this is not guaranteed).
DeclareGlobalFunction( "GeneralizedPolygonParameters" );

# Check whether two vertices of a generalized quadrangle with parameter t
# are either equal, or make a regular pair.
DeclareGlobalFunction( "IsRegularPair" );

# Find regular points in a generalized quadrangle.
DeclareGlobalFunction( "RegularPoints" );

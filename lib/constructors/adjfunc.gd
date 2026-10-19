#############################################################################
##
#W  adjfunc.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions involving adjacency functions
##  for graphs. 
##

# Adjacency function for complete multipartite graphs
DeclareGlobalFunction( "DifferentParts" );

# Adjacency function graph joins
DeclareGlobalFunction( "GraphJoinAdjacency" );

# Adjacency function for Kneser-type graphs.
DeclareGlobalFunction( "DisjointSets" );

# Adjacency function for conjugacy class graphs.
DeclareGlobalFunction( "GroupIntersection" );

# Adjacency function for set graphs.
DeclareGlobalFunction( "SetIntersection" );

# Adjacency function for doubled Odd and Grassmann graphs.
DeclareGlobalFunction( "SymmetrizedInclusion" );

# Adjacency function for roots of E_8.
DeclareGlobalFunction( "RootAdjacency" );

# Adjacency function for forms graphs.
DeclareGlobalFunction( "RankAdjacency" );

# Adjacency function for adjacency matrices.
DeclareGlobalFunction( "MatrixAdjacency" );

# Adjacency function for Latin square graphs.
DeclareGlobalFunction( "LatinSquareAdjacency" );


# Adjacency function for adjacency lists.
DeclareGlobalFunction( "ListAdjacency" );

# Point-line incidence
DeclareGlobalFunction( "PointLineIncidence" );

# Adjacency for crooked graphy
DeclareGlobalFunction( "CrookedAdjacency" );

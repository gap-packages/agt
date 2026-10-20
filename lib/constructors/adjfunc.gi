#############################################################################
##
#W  adjfunc.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions involving adjacency functions
##  for graphs. 
##

# Adjacency function for complete multipartite graphs
InstallGlobalFunction( DifferentParts,
function(x, y)
  return x[1] <> y[1];
end );

# Adjacency function graph joins
InstallGlobalFunction( GraphJoinAdjacency,
Gs -> function(x, y)
  return x[1] <> y[1] or (x[1] = y[1] and
                          IsVertexPairEdge(Gs[x[1]], x[2], y[2]));
end );

# Adjacency function for Kneser-type graphs.
InstallGlobalFunction( DisjointSets,
function(x, y)
  return Intersection(x, y) = [];
end );

# Adjacency function for conjugacy class graphs.
InstallGlobalFunction( GroupIntersection,
n -> function(x, y)
  return Order(Intersection(x, y)) = n;
end );

# Adjacency function for set graphs.
InstallGlobalFunction( SetIntersection,
n -> function(x, y)
       return Length(Intersection(x, y)) = n;
end );

# Adjacency function for doubled Odd and Grassmann graphs.
InstallGlobalFunction( SymmetrizedInclusion,
function(x, y)
  return x <> y and (IsSubset(x, y) or IsSubset(y, x));
end );

# Adjacency function for roots of E_8.
InstallGlobalFunction( RootAdjacency,
function(x, y)
  return x*y = 8;
end );

# Adjacency function for forms graphs.
InstallGlobalFunction( RankAdjacency,
r -> function(x, y)
  return RankMat(x-y) in r;
end );

# Adjacency function for adjacency matrices.
InstallGlobalFunction( MatrixAdjacency,
M -> function(x, y)
  return M[x][y] = 1;
end );

# Adjacency function for Latin square graphs.
InstallGlobalFunction( LatinSquareAdjacency,
function(x, y)
  return x <> y and (x[1] = y[1] or x[2] = y[2]
                      or x[1]*x[2] = y[1]*y[2]);
end );

# Adjacency function for adjacency lists.
InstallGlobalFunction( ListAdjacency,
L -> function(x, y)
  return y in L[x];
end );

# Point-line incidence
InstallGlobalFunction( PointLineIncidence,
function(x, y)
  return x in y or y in x;
end );

# Adjacency for crooked graphy
InstallGlobalFunction( CrookedAdjacency,
f -> function(x, y)
       return x <> y and x[3]+y[3] = f(x[1]+y[1])
                               + (x[2]+y[2]+Z(2)^0)*(f(x[1]) + f(y[1]));
end );

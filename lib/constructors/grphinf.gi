#############################################################################
##
#W  grphinf.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions that collect graph info.
##  
##


# Checks whether a graph is an antipodal cover.
InstallGlobalFunction( IsAntipodalCover,
function(G)
  local d, k, m, ia, i, ci, cj;
  if not IsSimpleGraph(G) then
    Error("not a simple graph");
    return fail;
  fi;
  if not IsConnectedGraph(G) then
    Error("not a connected graph");
    return fail;
  fi;
  d := Diameter(G);
  if d < 2 then
    return true;
  elif d = 2 then
    return false;
  fi;
  m := Int(d/2);
  ia := GlobalParameters(G);
  if -1 in Union(ia) or not IsInt(ia[m+1][3]/ia[d-m+1][1]) then
    return false;
  fi;
  return ForAll([0..d], i -> i = m or ia[i+1][3] = ia[d-i+1][1]);
end );

# Covering index of an antipodal cover.
InstallGlobalFunction( AntipodalCoveringIndex,
function(G)
  if not IsAntipodalCover(G) then
    Error("not an antipodal cover");
    return fail;
  fi;
  return Length(DistanceSet(G, [0, Diameter(G)], 1));
end );

# Parameters of a generalized polygon.
# Does not check whether G actually is a generalized polygon
# (for d = 2 this is not guaranteed).
InstallGlobalFunction( GeneralizedPolygonParameters,
function(G)
  local d, s, t, ia;
  if not IsSimpleGraph(G) then
    Error("not a simple graph");
    return fail;
  fi;
  if not IsConnectedGraph(G) then
    Error("not a connected graph");
    return fail;
  fi;
  d := Diameter(G);
  ia := GlobalParameters(G);
  t := ia[d+1][1] - 1;
  s := ia[1][3] / ia[d+1][1];
  if not IsInt(s) or ForAny(ia{[2..d]}, x -> x[1] <> 1 or x[3] <> s*t) then
    return fail;
  fi;
  return [2*d, s, t];
end );

# Check whether two vertices of a generalized quadrangle with parameter t
# are either equal, or make a regular pair.
InstallGlobalFunction( IsRegularPair,
function(G, x, y, t)
  return x = y or y in Adjacency(G, x) or
    Size(Intersection(List(Intersection(Adjacency(G, x), Adjacency(G, y)),
         z -> Adjacency(G, z)))) = t+1;
end );

# Find regular points in a generalized quadrangle.
InstallGlobalFunction( RegularPoints,
function(G)
  local l, t, P, orb, par;
  par := GeneralizedPolygonParameters(G);
  if par = fail then
    return fail;
  fi;
  t := par[3];
  l := [1..Length(G.representatives)];
  P := [1..G.order];
  orb := List(l, i -> OrbitsDomain(Stabilizer(G.group,
                                              G.representatives[i]), P));
  return G.representatives{Filtered(l, i -> ForAll(orb[i][1],
                      x -> IsRegularPair(G, G.representatives[i], x, t)))};
end );

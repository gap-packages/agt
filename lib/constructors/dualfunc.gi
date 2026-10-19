#############################################################################
##
#W  dualfunc.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions involving duality functions. 
##

# Default function for dual points.
InstallGlobalFunction( DefaultDualityFunction,
x -> x
);

# Default function for primal points.
InstallGlobalFunction( DefaultPrimalityFunction,
x -> Intersection(x)[1]
);

# Duality function for bipartite doubles.
InstallGlobalFunction( BipartiteDoubleDualityFunction,
f -> x -> [f(List(x, y -> y[1])), x[1][2]]
);

# Duality function for Grassmann graphs.
InstallGlobalFunction( GrassmannDualityFunction,
function(x)
  local y;
  y := Intersection(x);
  if Dimension(y) = 0 then
    return Sum(x);
  else
    return y;
  fi;
end );

# Check whether function for dual and primal points exist,
# and add them if they do not.
InstallGlobalFunction( CheckDualityFunctions,
function(G)
  if not "duality" in RecNames(G) then
    G.duality := DefaultDualityFunction;
  fi;
  if not "primality" in RecNames(G) then
    G.primality := DefaultPrimalityFunction;
  fi;
end );

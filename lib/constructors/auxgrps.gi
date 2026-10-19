#############################################################################
##
#W  auxgrps.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions involving auxiliary groups.
##


# The field addition group as a permutation group.
InstallGlobalFunction( FieldAdditionPermutationGroup,
q -> Group(List(Elements(Basis(GF(q))),
    g -> Permutation(g, FiniteFieldCanonicalOrdering(q), \+)))
 );
 



# The field exponentiation group as a permutation group.
InstallGlobalFunction( FieldExponentiationPermutationGroup,
q -> Action(Group(FrobeniusAutomorphism(GF(q))),
            FiniteFieldCanonicalOrdering(q))
 );
 
# The group of even permutations of columns of a matrix
# as a permutation group over matrix elements.
InstallGlobalFunction( MatrixColumnEvenPermutationGroup,
function(d, e)
  return Action(AlternatingGroup(e), Cartesian([1..d], [1..e]),
    function(x, g)
      return [x[1], OnPoints(x[2], g)];
    end);
end );

# The group of permutations of columns of a matrix
# as a permutation group over matrix elements.
InstallGlobalFunction( MatrixColumnPermutationGroup,
function(d, e)
  return Action(SymmetricGroup(e), Cartesian([1..d], [1..e]),
    function(x, g)
      return [x[1], OnPoints(x[2], g)];
    end);
end );

# The group of simultaneous permutations of rows and columns
# of a square matrix as a permutation group over matrix elements.
InstallGlobalFunction( MatrixRowColumnPermutationGroup,
function(d)
  return Action(SymmetricGroup(d), Cartesian([1..d], [1..d]), OnTuples);
end );

# The wreath product of two symmetric groups.
InstallGlobalFunction( WreathProductSymmetricGroups,
function(m, n)
  local g;
  if not (IsInt(m) and IsInt(n) and m >= 0 and n >= 0) then
    Error("m or n not a nonnegative integer");
    return fail;
  fi;
  if m <= 1 then
    return SymmetricGroup(n);
  elif n <= 1 then
    return SymmetricGroup(m);
  fi;
  g := Concatenation(GeneratorsOfGroup(SymmetricGroup(m)),
                     [PermList(Concatenation([m+1..2*m], [1..m]))]);
  if n > 2 then
    Add(g, PermList(Concatenation([m+1..n*m], [1..m])));
  fi;
  return Group(g);
end );

# The automorphism group of a (hyper)conic
# in a Desarguesian projective plane of order q.
InstallGlobalFunction( HyperconicAutomorphismGroup,
q -> Group([
  [[-Z(q)^0, 0*Z(q), 0*Z(q)],
   [ 0*Z(q), 0*Z(q), Z(q)^0],
   [ 0*Z(q), Z(q)^0, 0*Z(q)]],
  [[-Z(q)^0, 0*Z(q), -2*Z(q)^0],
   [ Z(q)^0, Z(q)^0,   Z(q)^0],
   [ 0*Z(q), 0*Z(q),   Z(q)^0]],
  [[-Z(q),   0*Z(q), -2*Z(q)^0],
   [ Z(q),   Z(q)^2,   Z(q)^0],
   [ 0*Z(q), 0*Z(q),   Z(q)^0]],
    Z(q)*IdentityMat(3, GF(q))
  ])
);

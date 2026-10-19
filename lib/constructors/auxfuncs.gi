#############################################################################
##
#W  auxfunc.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions involving auxiliary functions
##  for graphs. 
##

# Check whether we are given a filter (including IsObject)
InstallGlobalFunction( IsAFilter,
x -> IsFilter(x) or x = IsObject
 );

# The canonical ordering of elements in F_q.
InstallGlobalFunction( FiniteFieldCanonicalOrdering,
q -> Concatenation([0*Z(q)], List([0..q-2], i -> Z(q)^i))
 );

# A bijective map from elements of F_q to integers from [1..q].
InstallGlobalFunction( FFEToInt,
function(x, q)
  if IsZero(x) then
    return 1;
  else
    return LogFFE(x, Z(q))+2;
  fi;
end );

# A bijective map from integers from [1..q] to elements of F_q.
InstallGlobalFunction( IntToFFE,
function(x, q)
  if x = 1 then
    return 0*Z(q);
  else
    return Z(q)^(x-2);
  fi;
end );

# The complement of a vector subspace of a finite field.
InstallOtherMethod(OrthogonalSpaceInFullRowSpace, "for finite fields",
                                          [IsVectorSpace, IsField], 0,
function(V, F)
  local B;
  B := Basis(F);
  return Subspace(F,
      List(Basis(OrthogonalSpaceInFullRowSpace(Subspace(
                  LeftActingDomain(F)^Dimension(F),
                  List(Basis(V), b -> Coefficients(B, b)), "basis"))),
              b -> b*B));
end );

# Transforms a matrix over GF(r) to a Hermitean matrix over GF(r^2).
InstallGlobalFunction( ToHermitean,
function(A, r)
  local c, n, Hermitize;
  c := Conjugates(GF(r^2), GF(r), Z(r^2));
  Hermitize := function(i, j)
        if i = j then
          return A[i][j];
        elif i < j then
          return A[i][j] + c[1]*A[j][i];
        else
          return A[j][i] + c[2]*A[i][j];
        fi;
  end;
  n := Size(A);
  return Immutable(List([1..n],
      i -> List([1..n], j -> Hermitize(i, j))));
end );

# The Gold function used in Preparata and Kasami codes.
InstallGlobalFunction( GoldFunction,
s -> x -> x^(s+1)
 );

# Converts a finite field element to a matrix
# for exceptional near-field operations.
InstallGlobalFunction( ToExceptionalMatrix,
function(q, F, B)
  return x -> F[IntVecFFE(Coefficients(B, x))*[q, 1] + 1];
end );

# Read a file into a list of lines.
InstallGlobalFunction( ReadLines,
function(file)
  local f, ln, lns;
  f := InputTextFile(file);
  lns := [];
  ln := ReadLine(f);
  while ln <> fail do
    RemoveCharacters(ln, "\r\n");
    Add(lns, ln);
    ln := ReadLine(f);
  od;
  CloseStream(f);
  return lns;
end );

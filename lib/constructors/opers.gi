#############################################################################
##
#W  opers.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions involving operations for graphs.
##  
##

# The vector product of two vectors with 3 elements.
InstallGlobalFunction( VectorProduct,
function(u, v)
    return [u[2]*v[3]-u[3]*v[2], u[3]*v[1]-u[1]*v[3], u[1]*v[2]-u[2]*v[1]];
end);

# Multiplication in Hall algebras
InstallGlobalFunction( HallMultiplication,
function(p)
  local r;
  r := CoefficientsOfUnivariatePolynomial(p)[2];
  return function(x, y)
    if IsZero(y[2]) then
      return x*y[1];
    else
      return [x[1]*y[1] - x[2]/y[2]*Value(p, y[1]),
              x[1]*y[2] - x[2]*(y[1] + r)];
    fi;
  end;
end );

# Multiplication in Dickson near-fields
InstallGlobalFunction( DicksonMultiplication, 
q -> function(x, y)
  if IsZero(y) then
    return 0*Z(q);
  else
    return x^(q^LogFFE(y, Z(q^2))) * y;
  fi;
end );

# Right division in Dickson near-fields
InstallGlobalFunction( DicksonRightDivision,
q -> function(x, y)
  if IsZero(x) then
    return 0*Z(q);
  else
    return (x / y)^(q^LogFFE(y, Z(q^2)));
  fi;
end );

# Multiplication in exceptional near-fields
InstallGlobalFunction( ExceptionalMultiplication,
function(q, F, B)
  local mat;
  mat := ToExceptionalMatrix(q, F, B);
  return function(x, y)
    local M;
    M := mat(x) * mat(y);
    return M[1]*B;
  end;
end );

# Right division in exceptional near-fields
InstallGlobalFunction( ExceptionalRightDivision,
function(q, F, B)
  local mat;
  mat := ToExceptionalMatrix(q, F, B);
  return function(x, y)
    local M;
    M := mat(x) * mat(y)^-1;
    return M[1]*B;
  end;
end );

# Normalize a vector over a semifield given the semifield right division.
InstallGlobalFunction( NormalizeSemifieldVector,
div -> function(v)
  local n;
  n := First(v, x -> not IsZero(x));
  return List(v, x -> div(x, n));
end );

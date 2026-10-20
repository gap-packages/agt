#############################################################################
##
#W  formfunc.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions involving quadratic forms.
##


# Checks whether the sum of two subspaces are hyperbolic
# given a quadratic form.
InstallGlobalFunction( IsHyperbolic,
function(Q)
  local s;
  s := (Size(BaseField(Q)) - 1)^2;
  return function(x, y)
    return Size(Filtered(x+y, z -> not IsZero(z*Q*z))) = s;
  end;
end );

# Checks whether two subspaces of F_{r^2} are orthogonal
# given a sesquilinear form.
InstallGlobalFunction( IsOrthogonal,
function(Q, r)
  local F;
  F := x -> List(x, y -> y^r);
  return function(x, y)
    return ForAll(Cartesian(x, y), z -> IsZero(z[1]*Q*F(z[2])));
  end;
end );

# The subset of isotropic spaces with respect to the quadratic form Q
# of the collection V.
InstallGlobalFunction( IsotropicSpacesQuadraticForm,
Q -> V -> Filtered(V, y -> ForAll(y, x -> IsZero(x*Q*x)))
);

# The subset of nonisotropic spaces with respect to the quadratic form Q
# of the collection V for which the quadratic form evaluates to the same
# quadratic residue class as z.
InstallGlobalFunction( NonisotropicSpacesQuadraticForm,
function(Q, z)
  return V -> Filtered(V, y -> ForAny(y, x -> x*Q*x = z));
end );

# The subset of isotropic spaces with respect to the bilinear form Q
# of the collection V.
InstallGlobalFunction( IsotropicSpacesBilinearForm,
Q -> V -> Filtered(V,
            y -> ForAll(Cartesian(y, y), x -> IsZero(x[1]*Q*x[2])))
);

# The subset of isotropic spaces with respect to the scalar product with
# conjugation map f of the collection V.
InstallGlobalFunction( IsotropicSpacesSesquilinearForm,
function(Q, r)
  local O;
  O := IsOrthogonal(Q, r);
  return V -> Filtered(V, y -> O(y, y));
end );

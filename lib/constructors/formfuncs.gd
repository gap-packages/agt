#############################################################################
##
#W  formfunc.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions involving quadratic forms.
##


# Checks whether the sum of two subspaces are hyperbolic
# given a quadratic form.
DeclareGlobalFunction( "IsHyperbolic" );

# Checks whether two subspaces of F_{r^2} are orthogonal
# given a sesquilinear form.
DeclareGlobalFunction( "IsOrthogonal" );

# The subset of isotropic spaces with respect to the quadratic form Q
# of the collection V.
DeclareGlobalFunction( "IsotropicSpacesQuadraticForm" );

# The subset of nonisotropic spaces with respect to the quadratic form Q
# of the collection V for which the quadratic form evaluates to the same
# quadratic residue class as z.
DeclareGlobalFunction( "NonisotropicSpacesQuadraticForm" );

# The subset of isotropic spaces with respect to the bilinear form Q
# of the collection V.
DeclareGlobalFunction( "IsotropicSpacesBilinearForm" );

# The subset of isotropic spaces with respect to the scalar product with
# conjugation map f of the collection V.
DeclareGlobalFunction( "IsotropicSpacesSesquilinearForm" );

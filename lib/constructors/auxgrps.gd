#############################################################################
##
#W  auxgrps.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions involving auxiliary groups.
##

# The field addition group as a permutation group.
DeclareGlobalFunction( "FieldAdditionPermutationGroup" );

# The field multiplication group as a permutation group.
#DeclareGlobalFunction( "FieldMultiplicationPermutationGroup" );

# The field exponentiation group as a permutation group.
DeclareGlobalFunction( "FieldExponentiationPermutationGroup" );

# The group of even permutations of columns of a matrix
# as a permutation group over matrix elements.
DeclareGlobalFunction( "MatrixColumnEvenPermutationGroup" );

# The group of permutations of columns of a matrix
# as a permutation group over matrix elements.
DeclareGlobalFunction( "MatrixColumnPermutationGroup" );

# The group of simultaneous permutations of rows and columns
# of a square matrix as a permutation group over matrix elements.
DeclareGlobalFunction( "MatrixRowColumnPermutationGroup" );

# The wreath product of two symmetric groups.
DeclareGlobalFunction( "WreathProductSymmetricGroups" );

# The automorphism group of a (hyper)conic
# in a Desarguesian projective plane of order q.
DeclareGlobalFunction( "HyperconicAutomorphismGroup" );

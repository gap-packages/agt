#############################################################################
##
#W  auxfunc.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions involving auxiliary functions
##  for graphs. 
##

# Check whether we are given a filter (including IsObject)
DeclareGlobalFunction( "IsAFilter" );

# The canonical ordering of elements in F_q.
DeclareGlobalFunction( "FiniteFieldCanonicalOrdering" );

# A bijective map from elements of F_q to integers from [1..q].
DeclareGlobalFunction( "FFEToInt" );

# A bijective map from integers from [1..q] to elements of F_q.
DeclareGlobalFunction( "IntToFFE" );

# The complement of a vector subspace of a finite field.
DeclareOperation( "OrthogonalSpaceInFullRowSpace", [IsVectorSpace, IsField] ); 

# Transforms a matrix over GF(r) to a Hermitean matrix over GF(r^2).
DeclareGlobalFunction( "ToHermitean" );

# The Gold function used in Preparata and Kasami codes.
DeclareGlobalFunction( "GoldFunction" );

# Converts a finite field element to a matrix
# for exceptional near-field operations.
DeclareGlobalFunction( "ToExceptionalMatrix" );

# Read a file into a list of lines.
DeclareGlobalFunction( "ReadLines"  );

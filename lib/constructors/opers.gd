#############################################################################
##
#W  opers.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions involving operations for graphs. 
##

# The vector product of two vectors with 3 elements.
DeclareGlobalFunction( "VectorProduct" );

# Multiplication in Hall algebras
DeclareGlobalFunction( "HallMultiplication" );

# Multiplication in Dickson near-fields
DeclareGlobalFunction( "DicksonMultiplication" );

# Right division in Dickson near-fields
DeclareGlobalFunction( "DicksonRightDivision" );

# Multiplication in exceptional near-fields
DeclareGlobalFunction( "ExceptionalMultiplication" );

# Right division in exceptional near-fields
DeclareGlobalFunction( "ExceptionalRightDivision" );

# Normalize a vector over a semifield given the semifield right division.
DeclareGlobalFunction( "NormalizeSemifieldVector" );

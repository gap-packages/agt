#############################################################################
##
#W  utils.gi           Algebraic Graph Theory package         Rhys J. Evans
##
##
##  TODO This file contains the routines for the strongly regular graphs library
##

########################
## INTERNAL FUNCTIONS ##
########################

##---------------------------------------------------------------------------------------------
####################################################################
##
#F  AGT_Dir( )
##  
InstallGlobalFunction( AGT_Dir,
function( )
  return PackageInfo("agt")[1]!.InstallationPath;
end );

#############################################################################
##
#F  AGT_SRGLibrary( )
##  
InstallGlobalFunction( AGT_SRGLibrary,
function(  )
  return Concatenation(AGT_Dir(),"/srglib/");  
end );

#############################################################################
##
#F  AGT_SRGFilename( parms )
##  
InstallGlobalFunction( AGT_SRGFilename,
function( parms )
  local v,k,l,m,fn;

  v:=parms[1];
  k:=parms[2];
  l:=parms[3];
  m:=parms[4];
  
  fn := Concatenation(String(v),"-",String(k),"-",String(l),"-",String(m),".p.gz");
  
  return Concatenation(AGT_SRGLibrary(),fn);  

end );


#############################################################################
##
#E

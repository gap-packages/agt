#############################################################################
##
#W  srglib.gi           Algebraic Graph Theory package         Rhys J. Evans
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions involving strongly regular graphs. 
##


#############################################################################
##
#F  ComplementSRGParameters( parms )
##  
InstallGlobalFunction( ComplementSRGParameters, 
function( parms )

  if not IsFeasibleSRGParameters(parms) then
     Error("usage: ComplementSRGParameters(<parms>), where \n\
           <parms> is a feasible strongly regular graph parameter tuple");
  fi;    

  return [parms[1],
          parms[1]-parms[2]-1,
          parms[1]-2-2*parms[2]+parms[4],
          parms[1]-2*parms[2]+parms[3]];
end );

#############################################################################
##
#F  IsPrimitiveSRGParameters( [ <v>, <k>, <a>, <b> ] )
##  
InstallGlobalFunction( IsPrimitiveSRGParameters,
function( parms )

  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;
  return not (parms[4]=0 or ComplementSRGParameters(parms)[4]=0);
end );

#############################################################################
##
#F  IsTypeISRGParameters( [ <v>, <k>, <a>, <b> ] )
##  
InstallGlobalFunction( IsTypeISRGParameters, 
function( parms )
  local t,ist1;
  
  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;

  ist1:=true;
  t:=parms[4];
  
  ist1:=ist1 and t>0;
  ist1:=ist1 and parms[1]=4*t+1;
  ist1:=ist1 and parms[2]=2*t;
  ist1:=ist1 and parms[3]=t-1;

  return ist1;
end );

#############################################################################
##
#F  IsTypeIISRGParameters( [ <v>, <k>, <a>, <b> ] )
##  
InstallGlobalFunction( IsTypeIISRGParameters, 
function( parms )
  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;
  return IsInt(LeastEigenvalueFromSRGParameters(parms));
end );

#############################################################################
##
#F  SRGToGlobalParameters( <parms> )
##  
InstallGlobalFunction( SRGToGlobalParameters, 
function( parms )
  if not IsFeasibleSRGParameters(parms) then
 Error("usage: SRGToGlobalParameters(<parms>), where \n\
           <parms> is a feasible strongly regular graph parameter tuple");
    fi;
  return [[0,0,parms[2]],
          [1,parms[3],parms[2]-parms[3]-1],
          [parms[4],parms[2]-parms[4],0]];
end );

#############################################################################
##
#F  GlobalToSRGParameters( <parms> )
##  
InstallGlobalFunction( GlobalToSRGParameters, 
function( parms )
  local v,k,a,b;  

  if not (IsRectangularTable(parms) and DimensionsMat(parms)=[3,3] \
          and ForAll(parms,x->ForAll(x,IsInt))) then
    Error("usage: GlobalToSRGParameters( <parms> ), where parms is a 3x3 matrix \n\
           with integer entries.");
  fi;

  
  k:=parms[1][3];
  a:=parms[2][2];
  b:=parms[3][1];

  if b=0 then
    Error("usage: GlobalToSRGParameters( <parms> ), where parms[3][1] is not\n\
           0.");
  fi;    

  v:=k+1+k*(k-a-1)/b;

  if not IsFeasibleSRGParameters([ v, k, a, b ]) then
    Error("usage: GlobalToSRGParameters( <parms> ), where parms is the \n\
           global parameters corresponding to a feasible strongly regular\n\
           graph parameter tuple.");
  fi;
  
  return [ v, k, a, b ];
end );


#############################################################################
##
#O  KreinParameters( [ <v>, <k>, <a>, <b> ] )
##  
InstallMethod( KreinParameters, "SRG tuple", [IsList],
function( parms )
  local k,r,s,K;

  if not IsFeasibleSRGParameters(parms) then
    TryNextMethod();
  fi;

  K:=[];
  k:=parms[2];
  s:=LeastEigenvalueFromSRGParameters(parms);
  r:=SecondEigenvalueFromSRGParameters(parms);

  K[1]:=(k+r)*(s+1)*(s+1)-(r+1)*(k+r+2*r*s);
  K[2]:=(k+s)*(r+1)*(r+1)-(s+1)*(k+s+2*r*s);

  return K;

end );

#############################################################################
##
#O  IsKreinConditionsSatisfied( [ <v>, <k>, <a>, <b> ] )
##  
InstallMethod( IsKreinConditionsSatisfied, "SRG tuple", [IsList], 
function( parms )
  if not IsFeasibleSRGParameters(parms) then
    TryNextMethod();
  fi;
  
  if IsTypeISRGParameters(parms) then
    return true;
  fi;

  return ForAll(KreinParameters(parms),x->x>=0);
end );

#############################################################################
##
#F  IsAbsoluteBoundSatisfied( [ <v>, <k>, <a>, <b> ] )
##  
InstallGlobalFunction( IsAbsoluteBoundSatisfied, 
function( parms )
  local v,f,g;

  if not IsFeasibleSRGParameters(parms) then
    Error("usage: IsAbsoluteBoundSatisifed( <parms> ), where <parms> is a \n \
           feasible strongly regular graph parameter tuple");
  fi;

  v := parms[1];
  f := LeastEigenvalueMultiplicity(parms);
  g := SecondEigenvalueMultiplicity(parms);

  return 2*v <= f*(f+3) and 2*v <= g*(g+3);
end );


#############################################################################
##
#F  IsSRGAvailable( <parms> )
##
InstallGlobalFunction( IsSRGAvailable, 
function( parms )
  local fn;
  
  if not IsFeasibleSRGParameters(parms) then
    Error("usage: IsSRGAvailable(<parms>), where \n\
          <parms> is feasible strongly regular graph parameters");
  fi;
  
  fn := AGT_SRGFilename(parms);  

  return fn <> fail and IsReadableFile(fn);
end );

#############################################################################
##
#F  SRGLibraryInfo( <parms> )
##
InstallGlobalFunction( SRGLibraryInfo, 
function( parms )
  local pos;
  
  if not IsFeasibleSRGParameters(parms) then
    Error("usage: SRGLibraryInfo(<parms>), where \n\
          <parms> is feasible strongly regular graph parameters");
  fi;
  
  if parms[1]>AGT_Brouwer_Parameters_MAX then
    Error("usage: SRGLibraryInfo(<parms>), where \n\
          <parms> has first entry at most AGT_Brouwer_Parameters_MAX");
  fi;
  
  pos:=PositionProperty(AGT_Brouwer_Parameters,x->x[1]=parms);

  return AGT_Brouwer_Parameters[pos];
end );


#############################################################################
##
#F  SRG( <parms> , <n> )
##  
InstallGlobalFunction( SRG, 
function( parms, n )
  local fn, info, gamma;
  
  if not (IsFeasibleSRGParameters(parms) and IsInt(n) and n>0) then
    Error("usage: SRG(<parms>,<n>), where \n\
          <parms> is feasible strongly regular graph parameters and \n\
          <n> is a positive integer");
  fi;

  if not IsSRGAvailable(parms) then
    return fail;
  fi;
  
  info:=SRGLibraryInfo(parms);

  if info[3]<n then  
    return fail;
  fi;

  fn := AGT_SRGFilename(parms); 
  gamma := Graph(ReadDigraphs(fn,n));

  return gamma;
end );

#############################################################################
##
#F  NrSRGs( <parms> )
##  
InstallGlobalFunction( NrSRGs, 
function( parms )
  local info;
  
  if not IsFeasibleSRGParameters(parms) then
    Error("usage: NrSRGs(<parms>), where \n\
          <parms> is feasible strongly regular graph parameters.");
  fi;

  if parms[1]>AGT_Brouwer_Parameters_MAX then
    return 0;
  fi;
 
  info:=SRGLibraryInfo(parms);
   
  return info[3];
end );

#############################################################################
##
#F  OneSRG( <parms> )
##  
InstallGlobalFunction( OneSRG, 
function( parms )
  return SRG(parms,1);
end );

#############################################################################
##
#F  AllSRGs( <parms> )
##  
InstallGlobalFunction( AllSRGs, 
function( parms )
  local fn;
  
  if not IsFeasibleSRGParameters(parms) then
    Error("usage: AllSRGs(<parms>), where \n\
          <parms> is feasible strongly regular graph parameters.");
  fi;

  if not IsSRGAvailable(parms) then
    return [];
  fi;
  
  fn := AGT_SRGFilename(parms);  

  return List(ReadDigraphs(fn),Graph);
end );

#############################################################################
##
#F  SRGIterator( <parms> )
##  
InstallGlobalFunction( SRGIterator, 
function( parms )
  local filename, decoder, file, record, arg;
 
  if not IsFeasibleSRGParameters(parms) then
    Error("usage: SRGIterator(<parms>), where \n\
          <parms> is feasible strongly regular graph parameters.");
  fi;

  if not IsSRGAvailable(parms) then
    return Iterator([]);
  fi;

  filename := AGT_SRGFilename(parms);

  file := DigraphFile(filename, "r");

  if file = fail then
    return fail;
  fi;

  record := rec(file := file, current := Graph(file!.coder(file)));

  record.NextIterator := function(iter)
    local next;
    next := iter!.current;
    iter!.current := iter!.file!.coder(iter!.file); 
    if iter!.current <> IO_Nothing then
      iter!.current:=Graph(iter!.current);
    fi; 
    return next;
  end;

  record.IsDoneIterator := function(iter)
    if iter!.current = IO_Nothing then
      if not iter!.file!.closed then
        IO_Close(iter!.file);
      fi;
      return true;
    else
      return false;
    fi;
  end;

  record.ShallowCopy := function(iter)
    local file;
    file := DigraphFile(UserHomeExpand(filename), decoder, "r");
    return rec(file := file, current := Graph(file!.coder(file)));
  end;

  return IteratorByFunctions(record);
end );

#############################################################################
##
#F  SmallFeasibleSRGParameterTuples( v )
##  
InstallGlobalFunction( SmallFeasibleSRGParameterTuples, 
function( v )
  local parml;

  parml:=Filtered(AGT_Brouwer_Parameters,x->(x[1][1]<=v and x[2]<3));
  parml:=parml{[1..Length(parml)]}[1];

  return parml;
  
end );

#############################################################################
##
#F  IsEnumeratedSRGParameterTuple( [ <v>, <k>, <a>, <b> ] )
##  
InstallGlobalFunction( IsEnumeratedSRGParameterTuple, 
function( parms )
  local info;

  if not (IsFeasibleSRGParameters(parms) and parms[1]<=AGT_Brouwer_Parameters_MAX) then
    Error("usage: IsEnumeratedSRGParameterTuple(<parms>), where \n\
          <parms> is feasible strongly regular graph parameters, and \n\
          parms[1]<=AGT_Brouwer_Parameters_MAX.");
  fi;

  if not IsPrimitiveSRGParameters(parms) then
    return true;
  fi;
  
  info := SRGLibraryInfo(parms);  

  return info[2]=0 or info[2]=3;

end );

#############################################################################
##
#F  IsKnownSRGParameterTuple( [ <v>, <k>, <a>, <b> ] )
##  
InstallGlobalFunction( IsKnownSRGParameterTuple, 
function( parms )
  local info;

  if not (IsFeasibleSRGParameters(parms) and parms[1]<=AGT_Brouwer_Parameters_MAX) then
    Error("usage: IsKnownSRGParameterTuple(<parms>), where \n\
          <parms> is feasible strongly regular graph parameters, and \n\
          parms[1]<=AGT_Brouwer_Parameters_MAX.");
  fi;

  if not IsPrimitiveSRGParameters(parms) then
    return true;
  fi;
  
  info := SRGLibraryInfo(parms);  

  return info[2]<2;

end );


#############################################################################
##
#F  IsAllSRGsStored( [ <v>, <k>, <a>, <b> ] )
##  
InstallGlobalFunction( IsAllSRGsStored, 
function( parms )
  local info;

  if not (IsFeasibleSRGParameters(parms) and parms[1]<=AGT_Brouwer_Parameters_MAX) then
    Error("usage: IsKnownSRGParameterTuple(<parms>), where \n\
          <parms> is feasible strongly regular graph parameters, and \n\
          parms[1]<=AGT_Brouwer_Parameters_MAX.");
  fi;

  if not IsPrimitiveSRGParameters(parms) then
    return false;
  fi;
  
  info := SRGLibraryInfo(parms);  

  return info[3]=info[4];

end );

#############################################################################
##
#E

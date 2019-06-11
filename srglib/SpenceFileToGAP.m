v = 64;
filein = '~/GAPFiles/SRG/64-18-2-6.txt';
fileout = '~/GAPFiles/SRG/64-18-2-6.dat';

fidin = fopen(filein,'rt');
hchars = fgetl(fidin);
hchars2 = fgetl(fidin);

c = textscan(fidin,'%s','Delimiter','');
fclose(fidin);

c = cell2mat(cellfun(@(s)s-'0',c{1},'Uniform',false));

fidout = fopen(fileout,'w');
fprintf(fidout,hchars);
fprintf(fidout,'\n');
fprintf(fidout, hchars2);
fprintf(fidout,'\n');
fprintf(fidout,'[\n');

formatSpec = '[%d';

for i = 2:v
  formatSpec = [formatSpec,',%d']; 
end;

formatSpec = [formatSpec,'],\n']; 

num = length(c)/v;

for i = 1:num   
  fprintf(fidout,'[\n');  
  for j = 1:v
    fprintf(fidout,formatSpec,c((i-1)*v+j,:));
  end;
  fprintf(fidout,']\n,\n');
end;

fprintf(fidout,'];');

fclose(fidout);
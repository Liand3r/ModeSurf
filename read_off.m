
function [vertex,face] = read_off(filename)


fid = fopen(filename,'r');
if( fid==-1 )
    error('Can''t open the file.');
    return;
end

str = fgets(fid);   % -1 if eof
if ~strcmp(str(1:3), 'OFF')
    error('The file is not a valid OFF one.');    
end

str = fgets(fid);
[a,str] = strtok(str); 
nvert = str2num(a)
[a,str] = strtok(str);
nface = str2num(a)

vertex = zeros(nvert,3);
face = zeros(nface,3);

for k=1:nvert
    remain = fgets(fid);
    
    [x , remain ] = strtok(remain);
    vertex(k,1) = str2double(x);
    [y , remain ] = strtok(remain);
    vertex(k,2) = str2double(y);
    [z , remain ] = strtok(remain);
    vertex(k,3) = str2double(z);
end
for k=1:nface
    remain = fgets(fid);
    [a , remain ] = strtok(remain);
    [a , remain ] = strtok(remain);
    face(k,1) = str2num(a);
    [a , remain ] = strtok(remain);
    face(k,2) = str2num(a);
    [a , remain ] = strtok(remain);
    face(k,3) = str2num(a);
end


end


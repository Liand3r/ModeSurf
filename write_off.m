function [] = write_off(filename,vertices,faces)
%Prend en argument une liste de vertices et une liste de face
%Créée (ou écrit dans) un fichier contenant ces données éditées au format
%.off

%Création/ouverture du fichier

fid = fopen(filename, 'w');

nv = size(vertices, 1);
nf = size(faces, 1);
ne = 1;

% Ecriture de l'en-tête
fprintf(fid, '%d %d %d \n', nv, nf, ne);

% Ecriture de la liste

for i = 1:nv
    fprintf(fid, '%f %f %f \n', vertices(i,1), vertices(i,2), vertices(i,3));
end

for i = 1:nf
    fprintf(fid, '4 %d %d %d \n', faces(i,1), faces(i,2), faces(i,3));
end
    
end


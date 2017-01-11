function [ HT] = repartition( vertices, rayon )
%décrire la fonction 

%calcul des dimensions de la table
[ minX, minY, minZ, maxX, maxY, maxZ ] = bornesvertices( vertices );

Nx = (maxX - minX) / rayon;
Ny = (maxY - minY ) / rayon;
Nz = (maxZ - minZ) /rayon;

Nx = floor(Nx)+1;
Ny = floor(Ny)+1;
Nz = floor(Nz)+1;

HT = cell(Nx, Ny, Nz);
% On répartit les vertices de la mesh dans les sous-ensembles
for i=1:size(vertices,1)
    ix = floor((vertices(i,1) - minX ) / rayon) + 1;
    iy = floor((vertices(i,2) - minY) / rayon) + 1;
    iz = floor((vertices(i,3) - minZ) / rayon) + 1;
    HT{ix, iy, iz} = [HT{ix, iy, iz} i];
end
end


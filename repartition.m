function [ HT] = repartition( vertices, rayon )
%décrire la fonction 

%calcul des dimensions de la table
minX = min(vertices(:,1));
maxX = max(vertices(:,1));
minY = min(vertices(:,2));
maxY = max(vertices(:,2));
minZ = min(vertices(:,3));
maxZ = max(vertices(:,3));

Nx = (maxX - minX) / rayon;
Ny = (maxY - minY ) / rayon;
Nz = (maxZ - minZ) /rayon;

Nx = floor(Nx)+1;
Ny = floor(Ny)+1;
Nz = floor(Nz)+1;

HT = cell(Nx, Ny, Nz);
for i=1:size(vertices,1)
    ix = floor((vertices(i,1) - minX ) / rayon) + 1;
    iy = floor((vertices(i,2) - minY) / rayon) + 1;
    iz = floor((vertices(i,3) - minZ) / rayon) + 1;
    HT{ix, iy, iz} = {H{ix, iz, iz} i }
end
    
    







end


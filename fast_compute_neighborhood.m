function [ neighborhood] = fast_compute_neighborhood( HT, vertices, rayon, idV, minX, minY, minZ)

%on recherche où est vertices[idV] dans le tableau HT
x = vertices(idV, 1);
y = vertices(idV, 2);
z = vertices (idV, 3);
Nx = size(HT, 1);
Ny = size(HT, 2);
Nz = size(HT, 3);

ix = floor((vertices(idV,1) - minX ) / rayon) + 1;
iy = floor((vertices(idV,2) - minY) / rayon) + 1;
iz = floor((vertices(idV,3) - minZ) / rayon) + 1;

voisins_potentiels = [];

% on recherche l'ensemble des cubes autour de HT(ix, iy, iz)
lx = [ix];
if ix - 1 > 0
    lx = [lx lx-1];
end
if ix +1 < Nx+1
    lx = [lx ix+1];
end 

ly = [iy];
if iy - 1 > 0
    ly = [ly iy-1];
end
if iy +1 < Ny+1
    ly = [ly iy+1];
end 

lz = [iz];
if iz - 1 > 0
    lz = [lz iz-1];
end
if iz +1 < Nz+1
    lz = [lz iz+1];
end 

%on stocke dans voisins_potentiels l'ensemble des vertices aux alentours du
%cuve contenant vertices[idV]
for a=1:length(lx)
    for b = 1:length(ly)
        for c = 1:length(lz)
            voisins_potentiels = [voisins_potentiels HT{a,b,c}];
        end
    end
end

%On détermine ceux qui sont effectivement à une distance d < rayon de
%vertices[idV]
neighborhood = [];
for i = 1:length(voisins_potentiels)
    if i ~= idV
        if norm(vertices(idV,:)-vertices(i,:)) < rayon
            neighborhood = [[neighborhood ], [vertices(i,:)]];
        end
    end
end
    
if (length(neighborhood) ~= 0)
    n = zeros(length(neighborhood)/3,3);
        for i = 1:size(n,1)
        n(i,1) = neighborhood( 3 * (i-1) + 1);
        n(i,2) = neighborhood( 3 * (i-1) + 2);
        n(i,3) = neighborhood( 3 * (i-1) + 3);
        end
    neighborhood = n;
end
end


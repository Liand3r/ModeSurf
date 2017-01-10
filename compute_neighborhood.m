function [ neighborhood] = compute_neighborhood( vertices,index_vertex_to_denoise,ro )
% Fonction qui permet de déterminer l'ensemble des vertices du vertex d'id
% index_vertex_to_denoise
neighborhood = [];

nb_vertices = length(vertices);
nb_voisin = 0;
for k=1:nb_vertices
    if (k  ~= index_vertex_to_denoise) 
        if norm(vertices(index_vertex_to_denoise,:)-vertices(k,:)) < ro
          neighborhood = [[neighborhood ], [vertices(k,:)]];
          nb_voisin = nb_voisin + 1;
        end  
    end
end
if (nb_voisin ~= 0)
    n = zeros(nb_voisin,3);
        for i = 1:nb_voisin
        n(i,1) = neighborhood( 3 * (i-1) + 1);
        n(i,2) = neighborhood( 3 * (i-1) + 2);
        n(i,3) = neighborhood( 3 * (i-1) + 3);
        end
    neighborhood = n;
end



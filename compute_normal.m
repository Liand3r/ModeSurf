function [ normals] = compute_normal(vertices,faces )

nb_faces = length(faces);
nb_vertices = length(vertices);
normals = zeros(nb_vertices,3);

for k=1:nb_faces
    % On récupère les index des trois points définissant la face
    p1 = vertices(faces(k,1) + 1,:);
    p2 = vertices(faces(k,2) + 1,:);
    p3 = vertices(faces(k,3) + 1,:);
    
    %on calcule le vecteur normal à la face
    normal_triangle = cross(p2-p1,p3-p2);
    
    %on corrige les normales en ajoutant la nouvelle normale
    normals(faces(k,1) + 1,:) = normals(faces(k,1) + 1,:) + normal_triangle;
    normals(faces(k,2) + 1,:) = normals(faces(k,2) + 1,:) + normal_triangle;
    normals(faces(k,3) + 1,:) = normals(faces(k,3) + 1,:) + normal_triangle;
end
for k=1:nb_vertices
    norme = norm(normals(k,:));
    if norme > 0.0    
        normals(k) = normals(k)/norme;      
    end
end


end


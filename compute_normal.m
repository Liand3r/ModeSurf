function [ normals] = compute_normal(vertices,faces )

nb_faces = length(faces);
nb_vertices = length(vertices);
normals = zeros(nb_vertices,3);

for k=1:nb_faces
    point_1 = vertices(faces(k,1) + 1,:);
    point_2 = vertices(faces(k,2) + 1,:);
    point_3 = vertices(faces(k,3) + 1,:);
    
    normal_triangle = cross(point_2 - point_1,point_3 - point_1);
    normals(faces(k,1) + 1,:) = normals(faces(k,3) + 1,:) + normal_triangle;
    normals(faces(k,2) + 1,:) = normals(faces(k,2) + 1,:) + normal_triangle;
    normals(faces(k,3) + 1,:) = normals(faces(k,3) + 1,:) + normal_triangle;
end
for k=1:nb_vertices
    n = norm(normals(k));
    if n > 0
        normals(k) = normals(k)/n;
    end
end


end


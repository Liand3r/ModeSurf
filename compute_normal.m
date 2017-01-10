function [ normal] = compute_normal( k,vertices,faces )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

nb_faces = length(faces);
triangles = [];

%calcul des triangles adjacents � vertices(k,:)
for j=1:nb_faces
    if((faces(j,1) == k)
        Point1 = vertices(k,:);
        Point2 = vertices(faces(j,2),:);
        Point3 = vertices(faces(j,3),:);
    end
    if((faces(j,2) == k)
        Point1 = vertices(k,:);
        Point2 = vertices(faces(j,3),:);
        Point3 = vertices(faces(j,1),:);
    end
    if((faces(j,3) == k)
        Point1 = vertices(k,:);
        Point2 = vertices(faces(j,1),:);
        Point3 = vertices(faces(j,2),:);
    end
    triangles = [triangles [Point1 Point2 Point3]];
end

%Calcul de la normal
nb_triangles = length(triangles);
for i=1:nb_triangles
    
end

end


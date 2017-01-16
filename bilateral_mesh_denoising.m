

function [ vertices_denoised ] = bilateral_mesh_denoising( vertices,faces,sigma_c,sigma_s,ro)
%BILATERAL_MESH_DENOISING Summary of this function goes here

normals = compute_normal(vertices,faces);
vertices_denoised = zeros(size(vertices, 1),3);
%---fast neighborhood computing
disp('Calcul de HT')
HT = repartition(vertices, ro);
sigc2 = sigma_c * sigma_c;
sigs2 = sigma_s * sigma_s;
disp('Mise a jour des vertices')
for k=1:size(vertices, 1)
    
    %---Naive neighborhood computing
    %neighborhood = compute_neighborhood(vertices,k,ro);
    
    %---Fast neighborhood computing
    [ minX, minY, minZ, maxX, maxY, maxZ ] = bornesvertices( vertices );
    neighborhood = fast_compute_neighborhood( HT, vertices, ro, k, minX, minY, minZ);
    
    % A voire comment faire
    vertices_denoised(k,:) = denoisePoint( k, normals(k,:), vertices, sigc2, sigs2, neighborhood);
end


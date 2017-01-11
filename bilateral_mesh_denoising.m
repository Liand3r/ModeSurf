

function [ vertices_denoised ] = bilateral_mesh_denoising( vertices,faces,sigma_c_2,sigma_s_2,ro)
%BILATERAL_MESH_DENOISING Summary of this function goes here

normals = compute_normal(vertices,faces);
vertices_denoised = zeros(size(vertices, 1),3);
%---fast neighborhood computing
HT = repartition(vertices, 2*sqrt(sigma_c_2));


vertices_denoised = zeros(nb_vertices,3);
for k=1:size(vertices, 1)
    
    %---Naive neighborhood computing
    %neighborhood = compute_neighborhood(vertices,k,ro);
    
    %---Fast neighborhood computing
    
    
    [ minX, minY, minZ, maxX, maxY, maxZ ] = bornesvertices( vertices );
   neighborhood = fast_compute_neighborhood( HT, vertices, 2*sqrt(sigma_c_2), k, minX, minY, minZ);
    
    % A voire comment faire
    vertices_denoised(k,:) = denoisePoint( k, normals(k,:), vertices, sigma_c_2, sigma_s_2, neighborhood);
end




function [ vertices_denoised ] = bilateral_mesh_denoising( vertices,faces,sigma_c_2,sigma_s_2,ro)
%BILATERAL_MESH_DENOISING Summary of this function goes here



%   Detailed explanation goes here
nb_vertices = size(vertices, 1);

normals = compute_normal(vertices,faces);


vertices_denoised = zeros(nb_vertices,3);
for k=1:nb_vertices
    neighborhood = compute_neighborhood(vertices,k,ro);
    vertices_denoised(k,:) = denoisePoint( k, normals(k,:), vertices, sigma_c_2, sigma_s_2, neighborhood);
end


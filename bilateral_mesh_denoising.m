

function [ vertices_denoised ] = bilateral_mesh_denoising( vertices,faces,sigma_c_2,sigma_s_2,ro)
%BILATERAL_MESH_DENOISING Summary of this function goes here



%   Detailed explanation goes here
nb_vertices = length(vertices);


vertices_denoised = zeros(nb_vertices,3);
for k=1:nb_vertices
    neighborhood = compute_neighborhood(vertices,k,ro);
    
    % A voire comment faire
    %Poser question TP 16/01
    %normal = compute_normal(k,vertices,faces);
    normal = [1 1 1]
    vertices_denoised(k,:) = denoisePoint( k, normal, vertices,sigma_c_2, sigma_s_2,neighborhood);
end


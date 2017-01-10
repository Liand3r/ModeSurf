function [ neighborhood] = compute_neighborhood( vertices,index_vertex_to_denoise,ro )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
neighborhood = [];

nb_vertices = length(vertices);

for k=1:nb_vertices
    if (k  ~= index_vertex_to_denoise) 
        if norm(vertices(index_vertex_to_denoise,:)-vertices(k,:)) < ro
          neighborhood = [neighborhood vertices(k,:)];  
        end  
     end
end


filename = 'Data/bear.off';


[vertices, faces] = read_off(filename);

sigma_c_2 = 1;
sigma_s_2 = 1;
ro = 1;
nb_iter = 1;

%scatter3(vertices(:,1),vertices(:,2),vertices(:,3))
meshgrid(vertices(:,1),vertices(:,2),vertices(:,3))

%  for i=1:nb_iter
%      vertices = bilateral_mesh_denoising( vertices, faces, sigma_c_2,sigma_s_2,ro);
%  end
 
% write_off('Data/bear_denoised.off',vertices,faces);

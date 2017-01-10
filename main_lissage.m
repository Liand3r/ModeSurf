%filename = 'Data/bear.off';
%-------- Constantes ----------------
sigma_c_2 = 1;
sigma_c = sqrt(sigma_c_2);
sigma_s_2 = 1;
ro = 2 * sigma_c;
nb_iter = 1;
path = '../Data/';

%-------- Beginning -----------------
%Récupération du nom du fichier 
prompt = 'Nom du fichier = ';
str = input(prompt, 's');
filename = strcat(path, str);

%Lecture du fichier
[vertices, faces] = read_off(filename);


  for i=1:nb_iter
      vertices = bilateral_mesh_denoising( vertices, faces, sigma_c_2,sigma_s_2,ro);
  end
 
% write_off('Data/bear_denoised.off',vertices,faces);

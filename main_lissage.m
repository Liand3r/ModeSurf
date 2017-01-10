clearvars;
%filename = 'Data/bear.off';
%-------- Paramètres ---------------
sigma_c = 1;
sigma_s = 1;
nb_iter = 1;
path = '../Data/';
%-------- Constantes ----------------
sigma_c_2 = sigma_c * sigma_c;
sigma_s_2 = sigma_s * sigma_s;
ro = 2 * sigma_c;

%-------- Beginning -----------------
%Récupération du nom du fichier 
prompt = 'Nom du fichier = ';
%str = input(prompt, 's');
str = 'bear.off'
filename = strcat(path, str);

%Lecture du fichier
[vertices, faces] = read_off(filename);


  for i=1:nb_iter
      vertices = bilateral_mesh_denoising( vertices, faces, sigma_c_2,sigma_s_2,ro);
  end
 
 write_off('../base_projets/Data/bear_denoised.off',vertices,faces);

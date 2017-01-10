clearvars;

%-------- Paramètres ---------------
sigma_c = 1;
sigma_s = 1;
nb_iter = 1;
%-------- Constantes ----------------
sigma_c_2 = sigma_c * sigma_c;
sigma_s_2 = sigma_s * sigma_s;
ro = 2 * sigma_c;

%-------- Beginning -----------------
%Récupération du nom du fichier 
filename = input('Nom du fichier en entrée', 's');
%str = 'bear.off'

%Lecture du fichier
[vertices, faces] = read_off(filename);


  for i=1:nb_iter
      vertices = bilateral_mesh_denoising( vertices, faces, sigma_c_2,sigma_s_2,ro);
  end
 
  %récupération nom fichier 
  strout = input('Nom du fichier de sortie ?', 's');
  write_off(strout,vertices,faces);

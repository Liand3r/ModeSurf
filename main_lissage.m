clearvars;
%____________Récupération du nom du fichier_________
filename = input('Nom du fichier en entrée : ', 's');
%str = 'bear.off'
%____________Initialisation___________________
%Lecture du fichier
[vertices, faces] = read_off(filename);
[ minX, minY, minZ, maxX, maxY, maxZ ] = bornesvertices( vertices );
%-------- Paramètres ---------------
sigma_c = 0.02*(maxX + maxY + maxZ - minX - minY - minZ);
sigma_s = 2*sigma_c;
nb_iter = 1;
%-------- Constantes ----------------
sigma_c_2 = sigma_c * sigma_c;
sigma_s_2 = sigma_s * sigma_s;
ro = 2 * sigma_c;

  for i=1:nb_iter
      vertices = bilateral_mesh_denoising( vertices, faces, sigma_c,sigma_s,ro);
  end
 
  %récupération nom fichier 
 % strout = input('Nom du fichier de sortie : ', 's');
 strout = 'out.off';
  write_off(strout,vertices,faces);

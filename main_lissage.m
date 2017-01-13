clearvars;
%____________Récupération du nom du fichier_________
filename = input('Nom du fichier en entrée : ', 's');
%str = 'bear.off'
%____________Initialisation___________________
%Lecture du fichier
[vertices, faces] = read_off(filename);


  for i=1:1
[ minX, minY, minZ, maxX, maxY, maxZ ] = bornesvertices( vertices );
%-------- Paramètres ---------------
sigma_c = 0.1*abs(maxX + maxY + maxZ - minX - minY - minZ);
sigma_s = sigma_c;
nb_iter = 5;
%-------- Constantes ----------------

ro = 2 * sigma_c;
      vertices = bilateral_mesh_denoising( vertices, faces, sigma_c,sigma_s,ro);
  end
 
  %récupération nom fichier 
 % strout = input('Nom du fichier de sortie : ', 's');
 strout = 'out.off';
  write_off(strout,vertices,faces);

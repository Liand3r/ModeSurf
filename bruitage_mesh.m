function [ ] = bruitage_mesh( inname, outname)
[V,F] = read_off(inname);
[ minX, minY, minZ, maxX, maxY, maxZ ] = bornesvertices(V);
for i = 1:size(V,1)
    V(i,1) = V(i, 1) + 0.005*(maxX - minX) * randn;
    V(i,2) = V(i, 2) + 0.005*(maxY - minY) * randn;
    V(i,3) = V(i,3) + 0.005 * (maxZ - minZ) * randn;
    
end

write_off(outname, V,F);


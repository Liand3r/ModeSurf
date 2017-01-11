function [ minX, minY, minZ, maxX, maxY, maxZ ] = bornesvertices( vertices )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
minX = min(vertices(:,1));
maxX = max(vertices(:,1));
minY = min(vertices(:,2));
maxY = max(vertices(:,2));
minZ = min(vertices(:,3));
maxZ = max(vertices(:,3));

end


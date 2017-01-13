function [ v_denoised] = denoisePoint( index_v_noise, normal, vertices,sigma_c_2, sigma_s_2,neighborhood)
k = size(neighborhood, 1);
sum = 0;
normalizer = 0;
for i=1:k
    t = norm(vertices( index_v_noise ,:)-neighborhood(i,:));
    
    h = dot(normal,vertices(index_v_noise,:)-neighborhood(i,:));
   
    w_c = exp(-(t*t)/(2*sigma_c_2));
    w_s = exp(-(h*h)/(2*sigma_s_2));
    sum = sum + w_c * w_s * h;
    normalizer = normalizer + w_c * w_s;
end
if(normalizer ~= 0)
    v_denoised = vertices(index_v_noise,:) + normal * (sum/normalizer);
else
    v_denoised = vertices(index_v_noise,:);
end
end


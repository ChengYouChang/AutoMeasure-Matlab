clear all;
d = zeros(5)
v = [1;2;3;4;5]
p = zeros(5,1)

for j = 1:5
    for i = 1:5
        d(j,i) = 1 / (distanse(j,i,1,1))^2
    end
end
p = d*v



function dis=distanse(p,s,Dps,Dss)
    dis = sqrt(Dps^2+((s-p)*Dss)^2)
end


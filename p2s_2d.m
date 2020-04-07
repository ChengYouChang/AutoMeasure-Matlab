clear all;
D = zeros(5)
V = zeros(5,1)
% fake data P
P = [ 13.6588
   12.9000
   14.2000
   14.1000
    7.5882]

% get distanse matrix D
for p = 0:4
    for s = 0:4
        D(p+1,s+1) = 1 / (distanse(p,s,1,1))^2
    end
end

V = inv(D)*P

function dis=distanse(p,s,Dps,Dss)
    dis = sqrt(Dps^2+((s-p)*Dss)^2)
end


clear all;
D = zeros(9,5)
V = zeros(5,1)
P = [13.6588
   13.5630
   12.9000
   13.1841
   14.2000
   14.6101
   14.1000
   11.0147
    7.5882]

% make matrix D
for p = 0:0.5:4
    for s = 0:4
        D(2*p+1,s+1) = 1 / (distanse(p,s,1,1))^2;
    end
end
DtP = zeros(5,1)
DtP = D'*P

V = inv(D'*D)*(DtP)

function dis=distanse(p,s,Dps,Dss)
    dis = sqrt(Dps^2+((s-p)*Dss)^2)
end


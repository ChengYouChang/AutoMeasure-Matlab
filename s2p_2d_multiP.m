clear all;
D = zeros(9,5);
V = [10;3;6;9;1];
P = zeros(9,1);

for p = 0:0.5:4
    for s = 0:4
        D(2*p+1,s+1) = 1 / (distanse(p,s,1,1))^2;
    end
end

P = D*V

DtP = zeros(5,1);
DtP = D'*D*V



function dis=distanse(p,s,Dps,Dss)
    dis = sqrt(Dps^2+((s-p)*Dss)^2)
end


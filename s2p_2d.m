clear all;
D = zeros(5)
% fake data V
V = [10;3;6;9;1]
P = zeros(5,1)

% get distanse matrix
for p = 0:4
    for s = 0:4
        D(p+1,s+1) = 1 / (distanse(p,s,1,1))^2
    end
end

P=D*V

function dis=distanse(p,s,Dps,Dss)
    dis = sqrt(Dps^2+((s-p)*Dss)^2)
end


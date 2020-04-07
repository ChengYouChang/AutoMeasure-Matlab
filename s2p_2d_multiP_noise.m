clear all;
D = zeros(9,5);
V = [10;3;6;9;1];
P = zeros(9,1);
p_pos = zeros(9,1);
for p = 0:0.5:4
    p_pos(2*p+1) = p;   % the position of probe
    for s = 0:4
        D(2*p+1,s+1) = 1 / (distanse(p,s,1,1))^2;
    end
end

P = D*V

% write file
xlsFile='test.xlsx';
temp = [p_pos P];
xlswrite(xlsFile,temp);

function dis=distanse(p,s,Dps,Dss)
    dis = sqrt(Dps^2+((s-p)*Dss)^2);
end



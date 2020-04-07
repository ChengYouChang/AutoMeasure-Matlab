clear all;
D = zeros(25);
% fake data V
V = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24;25];
P = zeros(25,1);

% get distanse matrix D
for p = 0:24
    for s = 0:24
        D(p+1,s+1) = 1 / (distanse(p/5,mod(p,5),s/5,mod(s,5),1,1))^2;
    end
end

P=D*V

function dis=distanse(px,py,sx,sy,h,Dss)
    dis = sqrt(h^2+((px-sx)*Dss)^2+((py-sy)*Dss)^2)
end


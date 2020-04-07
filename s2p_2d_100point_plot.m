clear all;
d = 0;
p = 0;
v = [10;3;6;9;1];

for j = 1:0.5:5
    % probe j=1~5
    for i = 1:5
        % s i=1~5
        p = p + v(i) / (distanse(j,i,1,1)^2);
    end
    %disp(p)
    plot(j,p,'r.')
    axis([0.5,5.5,0,20]);
    hold on
    p = 0;
end

function dis=distanse(p,s,Dps,Dss)
    dis = sqrt(Dps^2+((s-p)*Dss)^2);
end


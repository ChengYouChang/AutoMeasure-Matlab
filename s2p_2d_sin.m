clear 
D = zeros(5);
P = zeros(5,1);

% sin data
t = 0:0.01:5;
S0 = 1*sin(2*pi*1*t+pi/4);
S1 = 3*sin(2*pi*1*t+0);
S2 = 2*sin(2*pi*1*t-pi/6);
S3 = 0.3*sin(2*pi*1*t-pi/2);
S4 = 1.5*sin(2*pi*1*t+pi/3);
V = [S0; S1; S2; S3; S4];

% plot all sine wave
for c = 1:5
    plot(t,V(c,:))
    hold on;
end
legend('S0','S1','S2','S3','S4')

for t = 0:4
    p = 1*t;
    temp=0;
    for s = 0:4
        D(t+1,s+1) = 1 / (distanse(p,s,1,1))^2;
        temp = temp + V(s+1,100*t+1)*D(t+1,s+1);
    end
    P(t+1,t+1) = temp;
end


%{
% get distanse matrix
for p = 0:4
    for s = 0:4
        D(p+1,s+1) = 1 / (distanse(p,s,1,1))^2
    end
end

P=D*V
%}
function dis=distanse(p,s,Dps,Dss)
    dis = sqrt(Dps^2+((s-p)*Dss)^2)
end


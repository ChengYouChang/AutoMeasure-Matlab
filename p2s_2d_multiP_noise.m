clear all;
D = zeros(9,5);
V = zeros(5,1);

% read data from file
xlsFile = 'test.xlsx'
[P] = xlsread(xlsFile)
P = P(1:9,2)

% make matrix D
for p = 0:0.5:4
    for s = 0:4
        D(2*p+1,s+1) = 1 / (distanse(p,s,1,1))^2;
    end
end

% currect answer
V = extrapolate(D,P)  
plot(V,'bo')
hold on

% add noise
Pn = zeros(9,1);
for t = 1:1000
    % add some noise on P
    for p = 1:9
        Pn(p)= P(p)+7/20*(rand-0.5);
    end
    % calculate back
    V = extrapolate(D,Pn)
    plot(V,'r.')
    hold on
end
legend('without noise','with noise')

%% Sub functions
function dis = distanse(p,s,Dps,Dss)
% This function is to calculate the distanse of probe and measuring point
% p : the number of probe
% s : the number of measuring point
% Dps : the distanse between p0 and s0
% Dss : the distanse between s0 and s1
    dis = sqrt(Dps^2+((s-p)*Dss)^2);
end
function V_ans = extrapolate(D,P)
    V_ans = inv(D'*D)*(D'*P)
end


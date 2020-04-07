clear all;
D = zeros(9,5);
V = zeros(5,9);
P = [0.5535   -2.6415    1.0790    1.9747   -2.2994   -0.5535    2.6415   -1.0790   -1.9747
    0.3147   -3.4785    1.8351    2.3443   -3.2840   -0.3147    3.4785   -1.8351   -2.3443
   -0.0765   -4.0607    2.5862    2.4624   -4.1080    0.0765    4.0607   -2.5862   -2.4624
   -0.4956   -3.7525    2.8147    2.0129   -4.0588    0.4956    3.7525   -2.8147   -2.0129
   -0.7488   -3.1196    2.6768    1.4653   -3.5824    0.7488    3.1196   -2.6768   -1.4653
   -0.5428   -2.3402    1.9891    1.1109   -2.6757    0.5428    2.3402   -1.9891   -1.1109
   -0.0798   -1.7935    1.1882    1.0592   -1.8428    0.0798    1.7935   -1.1882   -1.0592
    0.5449   -1.6902    0.4997    1.3814   -1.3534   -0.5449    1.6902   -0.4997   -1.3814
    0.9906   -1.6737    0.0438    1.6467   -1.0615   -0.9906    1.6737   -0.0438   -1.6467];
Pv = 0.5;    % speed of probe

%% Main

% get D matrix
start_s = 0;
for t = 0:8
    % time(t) of probe travel through all s
    p = Pv*t+start_s;
    if p<0 || p>4
       continue; 
    end
    D = D + d_martix(p);
end

V = inv(D'*D)*D'*P;
disp(V);


%% Functions
function dis = distanse(p,s,Dps,Dss)
% get distanse according to different probe position(p) and measuring
% position(s)
    dis = sqrt(Dps^2+((s-p)*Dss)^2);
end

function D_ = d_martix(p)
% get distanse matrix according to different probe position (p)
    D_ = zeros(9,5);
    row = p/0.5+1;
    for s = 0:4
        column = s+1;
        D_(row,column) = 1 / (distanse(p,s,1,1))^2;
    end
end

function V_ = v_matrix(t)
    fc = 0.7;
    V_ = zeros(5,9);
    column = t+1;
    V_(1,column) = 1  *sin(2*pi*fc*t+pi/4);
    V_(2,column) = 3  *sin(2*pi*fc*t+0);
    V_(3,column) = 2  *sin(2*pi*fc*t-pi/6);
    V_(4,column) = 0.3*sin(2*pi*fc*t-pi/2);
    V_(5,column) = 1.5*sin(2*pi*fc*t+pi/3);
end


clear all;
D = zeros(9,5);
P = zeros(9);
V = zeros(5,9);
Pv = 0.5;    % speed of probe

%% sine wave data & plot 
t = 0:0.01:4;
fc = 0.7;   % frequency of sine wave
S0 = 1*sin(2*pi*fc*t+pi/4);
S1 = 3*sin(2*pi*fc*t+0);
S2 = 2*sin(2*pi*fc*t-pi/6);
S3 = 0.3*sin(2*pi*fc*t-pi/2);
S4 = 1.5*sin(2*pi*fc*t+pi/3);
V_plot = [S0; S1; S2; S3; S4];

% plot all of the sine wave
for c = 1:5
    plot(t,V_plot(c,:))
    hold on;
end
legend('S0','S1','S2','S3','S4')

%% Main
for start_s=-4:0.5:4
%start_s = 0
    % start s(start_s) is the different start point of one measure
    
    for t = 0:8
        % time(t) of probe travel through all s
        
        p = Pv*t+start_s;
        if p<0 || p>4
           continue; 
        end

        D = d_martix(p);
        V = v_matrix(t);
        P = P+D*V;
    end
end
%disp(P);

%% get D & V matrix to check
D_all = zeros(9,5);
V_all = zeros(5,9);
for t = 0:8
    p = Pv*t + 0;
    V_all = V_all + v_matrix(t);
    D_all = D_all + d_martix(p);
end
disp(V_all);





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


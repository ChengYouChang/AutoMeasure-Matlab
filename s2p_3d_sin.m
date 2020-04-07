clear;
% matrix
D = zeros(25,25);
V = zeros(25,5);
P = zeros(25,5);
pv = 1;
% create dataset V (fix frequency, random amplitude(a) and phase(p))
global V_sin;
V_sin = zeros(2,25);
for i = 1:25
    a = rand*10;
    p = rand*10;
    V_sin(1,i) = a;
    V_sin(2,i) = p;
end
%% plot all of the sine wave
t = 0:0.01:5;
fc = 0.7;   % frequency of sine wave
for i = 1:25
    Si_plot = V_sin(1,i)*sin(2*pi*fc*t+pi/V_sin(2,i));
    plot(t,Si_plot);
    hold on;
end

for px = 0:4
    for start_s = -4:1:4
        for t = 0:4
            py = pv*t+start_s;
            if py<0 || py>4
                continue;
            end
            
            D = d_martix(px,py);
            V = v_matrix(t);
            P = P+D*V;
        end
    end
end
V_ans = zeros(25,5);
for t = 0:4
    V_ans = V_ans + v_matrix(t);
end
V_check = zeros(25,5);
D_check = zeros(25,25);
for px = 0:4
    for py = 0:4
        D_check = D_check+d_martix(px,py);
    end
end


%% Functions
function dis=distanse(px,py,sx,sy,h,Dss)
    dis = sqrt(h^2+((px-sx)*Dss)^2+((py-sy)*Dss)^2);
end


function D_ = d_martix(px,py)
% get distanse matrix according to different probe position (p)
    D_ = zeros(25);
    row = px*5+py+1;
    for sx = 0:4
        for sy = 0:4
            column = sx*5+sy+1;
            D_(row,column) = 1 / (distanse(px, py, sx, sy, 1, 1))^2;
        end
    end
end

function V_ = v_matrix(t)
    global V_sin;
    fc = 0.7;
    V_ = zeros(25,5);
    column = t+1;
    for i = 1:25
        V_(i,column) = V_sin(1,i)*sin(2*pi*fc*t+pi/V_sin(2,i));
    end
end
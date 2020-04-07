clear all;
D = zeros(25);
V = zeros(25,1);
% fake data P
P = [ 27.4618
   36.3472
   42.4708
   44.8272
   41.0010
   44.0575
   58.1846
   66.3287
   68.2271
   59.8838
   61.8256
   80.5372
   89.5954
   90.0369
   76.5748
   74.7945
   95.6434
  104.1909
  102.8823
   85.4116
   72.7478
   89.9194
   96.0056
   93.2397
   75.6276];

% get distanse matrix D
for p = 0:24
    for s = 0:24
        D(p+1,s+1) = 1 / (distanse(p/5,mod(p,5),s/5,mod(s,5),1,1))^2;
    end
end

V = inv(D)*P

function dis=distanse(px,py,sx,sy,h,Dss)
    dis = sqrt(h^2+((px-sx)*Dss)^2+((py-sy)*Dss)^2)
end


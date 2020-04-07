clear 
close all
clc

t = 0:0.01:5;
A = 1*sin(2*pi*2*t);
B = 0.5*sin(2*pi*5*t)

a = A(1)

plot(t,A);
hold on;
plot(t,B);



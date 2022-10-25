clc
clear all
% close all
%% Kullanici Girdileri
%Baslangic_Degerleri =  [x, x_dot,phi,phi_dot] metre ve radyan
Baslangic_Degerleri_Lin = [0,0,deg2rad(15),0]; 

%% Sarkac Parametreleri

I = 0.006;

M = 0.5;

b = 0.1;

g = 9.8;

l = 0.3;

m = 0.2;


p = I*(M+m)+M*m*l^2; %denominator for the A and B matrices

A = [0      1              0           0;
     0 -(I+m*l^2)*b/p  (m^2*g*l^2)/p   0;
     0      0              0           1;
     0 -(m*l*b)/p       m*g*l*(M+m)/p  0];
B = [     0;
     (I+m*l^2)/p;
          0;
        m*l/p];
C = eye(4);
D = zeros(4,1);

states = {'x' 'x_dot' 'phi' 'phi_dot'};
inputs = {'u'};
outputs = {'x';'x_dot';'phi';'phi_dot'};

sys_ss = ss(A,B,C,D,'statename',states,'inputname',inputs,'outputname',outputs);

%% LQR Kontrolcusu icin Katsayilar
% Q = ceza matrisidir, matris kosegenindeki katsayilar (1,1,10,10) sirasiyla 
% x,x_dot,phi,phi_dot icin ne kadar hassas olacagini belirtir
Q = [1,0,0,0; 
    0,1,0,0;
    0,0,10,0;
    0,0,0,10];

R = 0.01; % Kontrolun ne kadar agresif yapilacaginin katsayisidir.

K = lqr(A,B,Q,R);
LQR_Katsayi_Matrisi = K;

clc
clear all
% close all
%% Kullanici Girdileri
%Baslangic_Degerleri =  [x, x_dot,theta,theta_dot] metre ve radyan
Baslangic_Degerleri = [0,0,pi,0]; 


%% Sarkac Parametreleri

I = 0.006;

M = 0.5;

b = 0.1;

g = 9.8;

l = 0.3;

m = 0.2;


LQR_Katsayi_Matrisi = [-9.9999999999999627 -18.743235127431934 128.16450584818944 ...
                       40.177837789932831];


clc
clear all

%% Baslangic Degerler
baslangic.phi_theta_psi_der = [0,0,0]; 
baslangic.u_v_w_m_sn        = [120,0,0]; 
baslangic.p_q_r_rad_sn      = [0,0,0];
baslangic.x_y_z_m           = [0,0,-100];

%% 
Ucak_Secimi = 0; % F-104  = 0

%% Unit Conversation
lb2kg = convmass(1,'lbm','kg');
slg2kg = convmass(1,'slug','kg');
ft2m = convlength(1,'ft','m');
slug_ft2_to_kg_m2 = slg2kg*(ft2m*ft2m);
if Ucak_Secimi == 0
    % F-104
    % Nelson- Flight Stability
    W   = 16300;    %lb
    CG  = 7;        % per
    Ix  = 3549;     % slug_ft2
    Iy  = 58611;   % slug_ft2
    Iz  = 59669;   % slug_ft2
    S = 196.1;      % ft2
    b = 21.94;      % ft
    c = 9.55;       % ft
    ataletsel.kutle_kg      = W*lb2kg;
    ataletsel.atalet_kg_m2  = (eye(3).*[Ix,Iy,Iz])*slug_ft2_to_kg_m2;
    aerodatabase.s_m2   = S*ft2m*ft2m;
    aerodatabase.b_m    = b*ft2m;
    aerodatabase.c_m    = c*ft2m;
end


%% Aerodatabase Olustur
aerodatabase.tablolar.CL = [0.28; 0.3];
aerodatabase.tablolar.CD = [0.03; 0.038];
aerodatabase.tablolar.CL_a = [3.45; 4];
aerodatabase.tablolar.CD_a = [0.3; 0.56];
aerodatabase.tablolar.Cm_a = [-0.38; -0.41];
aerodatabase.tablolar.CL_a_dot = [0.72; 1.12];
aerodatabase.tablolar.Cm_a_dot = [-1.1; -1.65];
aerodatabase.tablolar.CL_q = [0; 0];
aerodatabase.tablolar.Cm_q = [-3.6; -4.3];
aerodatabase.tablolar.CL_M = [0; 0.15];
aerodatabase.tablolar.CD_M = [0; 0.03];
aerodatabase.tablolar.Cm_M = [0; -0.05];
aerodatabase.tablolar.CL_de = [0.36; 0.4];
aerodatabase.tablolar.Cm_de = [-0.5; -0.6];
aerodatabase.tablolar.Cy_B = [-0.98; -1.04];
aerodatabase.tablolar.Cl_B = [-0.12; -0.14];
aerodatabase.tablolar.Cn_B = [0.25; 0.27];
aerodatabase.tablolar.Cl_p = [-0.26; -24];
aerodatabase.tablolar.Cn_p = [0.022; 0.029];
aerodatabase.tablolar.Cl_r = [0.14; 0.17];
aerodatabase.tablolar.Cn_r = [-0.35; -0.39];
aerodatabase.tablolar.Cl_da = [0.08; 0.072];
aerodatabase.tablolar.Cn_da = [0.06; 0.04];
aerodatabase.tablolar.Cy_dr = [0.17; 0.17];
aerodatabase.tablolar.Cl_dr = [-0.105; -0.105];
aerodatabase.tablolar.Cn_dr = [0.032; 0.032];
aerodatabase.bps.Mach = [0.4; 0.8];

% Limitler
aerodatabase.limitler.alpha_rad = deg2rad([-20,+20]);
aerodatabase.limitler.beta_rad  = deg2rad([-20,+20]);

%% Servo Ayarlari

servo.elevator.limitler.aci_rad = deg2rad([-25,25]);
servo.elevator.limitler.acisal_hiz_rad_sn = deg2rad([-50,50]);

servo.rudder.limitler.aci_rad = deg2rad([-25,25]);
servo.rudder.limitler.acisal_hiz_rad_sn = deg2rad([-50,50]);

servo.aileron.limitler.aci_rad = deg2rad([-25,25]);
servo.aileron.limitler.acisal_hiz_rad_sn = deg2rad([-50,50]);

sevo.flap.limitler.aci_rad = deg2rad([-25,25]);
sevo.flap.limitler.acisal_hiz_rad_sn = deg2rad([-50,50]);

servo.thrust.limitler.itki_yuzde_per = [0,100];
servo.thrust.limitler.itki_hizi_per_sn = [-20,20];


%% Itki
itki.limitler_N = [0,18000]*lb2kg*9.80665;

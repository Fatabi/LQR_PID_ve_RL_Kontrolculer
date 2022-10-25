% Veri_Isimleri = {'x_m'      ;
% 'y_m'      ;
% 'z_m'      ;
% 'phi_der'  ;
% 'theta_der';
% 'psi_der'  ;
% 'CG_X_m'   ;
% 'CG_Y_m'   ;
% 'CG_Z_m'}   ;
% 
% A =get_param(gcb,'ObjectParameters')
% fn = fieldnames(A)
% fn(contains(fn,'Go'))
% 
% B =get_param(gcb,'GotoTag')
% 
% for i =1:length(Veri_Isimleri)
%     set_param(['Hava_Araci_6DOF/Subsystem/Goto',num2str(i)],'GotoTag',Veri_Isimleri{i})
% end


%% Bus Ciktilari icin
A = get_param(gcb,'OutputSignalNames');
A = replace(A,'<','');
A = replace(A,'>','');
A = replace(A,'rad','der');

% 'x_m' 
% 'y_m_'
% 'z_m'
'phi_der' 
'theta_der' 
'psi_der'

'alpha_der'	
'beta_der'	
'gamma_der'	

'TAS_m_sn'	
'Mach'

'elevator_der'	
'aileron_der'	
'rudder_der'	
'flap_der'	
'itki_per'

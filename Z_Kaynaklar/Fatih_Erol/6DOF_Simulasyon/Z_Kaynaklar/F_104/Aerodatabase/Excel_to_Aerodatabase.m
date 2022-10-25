% Excel to Aerodatabase

% [a,b] = uigetfile(".xlsx","Aerodatabase'in bulunduğu excel dosyasini seciniz.");
% excel_Verileri = importdata([b,a]);


Veri_Isimleri = excel_Verileri.colheaders.Aerodatabase;
Girdi_Ismi = 'Mach';
Tablo_Isimleri = Veri_Isimleri(2:end);

for i = 1:length(Tablo_Isimleri)
    aerodatabase.tablolar.(Tablo_Isimleri{i})= excel_Verileri.data.Aerodatabase(:,i+1);
end
aerodatabase.bps.Mach = excel_Verileri.data.Aerodatabase(:,1);

LT = 'simulink/Lookup Tables/1-D Lookup Table';
sim_tablo_olustur = 1;
posit = [40    48   105   112];
if  sim_tablo_olustur  == 1
    for i = 1:length(Tablo_Isimleri)
    delta = 125*i;
    delta = [0,1,0,1]*delta;
    add_block(LT,[gcs,'/',Tablo_Isimleri{i}]);    
    eklenen_tablo = gcb;
    set_param(eklenen_tablo,'Table',['aerodatabase.tablolar.',Tablo_Isimleri{i}]);
    set_param(eklenen_tablo,'BreakpointsForDimension1','aerodatabase.bps.Mach');
    set_param(eklenen_tablo,'ExtrapMethod','Clip');
    set_param(eklenen_tablo,'Position',delta + posit);
    end
end
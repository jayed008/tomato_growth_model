function [Rm, RG, Rp]=respiration(Tmean,Tday,PGD)
    RmTo = 0.015;
	RpTo = 0.33;
    Q10 = 2;
    To = 25;
    Rg = 0.39;
    Rm = PGD*RmTo*Q10^((Tmean-To)/10);
    RG = PGD*Rg;
	Rp = PGD*RpTo*Q10^((Tday-To)/10);
end
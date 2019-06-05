function rte=rte(T, period)
	p1 = [15, 29, 35];
	p2 = [10, 25, 35];
    p3 = [15, 25, 35];
	p4 = [15, 25, 35];
	p = 2;
	switch period
		case 'p1'
             Tb = p1(1);
             To = p1(2);
             Tm = p1(3);
			
		case 'p2'
			 Tb = p2(1);
             To = p2(2);
             Tm = p2(3);
			
		case 'p3'
			 Tb = p3(1);
             To = p3(2);
             Tm = p3(3);
			
		case 'p4'
			 Tb = p4(1);
             To = p4(2);
             Tm = p4(3);
    end
    
	if(T > Tb && T <= To)
		rte = ((T - Tb)/(To - Tb))^(p*((T-To)/Tb)^2);
    elseif(T > To && T < Tm)
		rte = ((Tm - T)/(Tm - To))^(p*((T-To)/Tb)^2); 
    else
		rte = 0;
    end
end
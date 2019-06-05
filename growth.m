function [disTDRW, t, area, weight, p, count]=growth(tp, Tp, PND, i, t, area, weight,disTDRW,co2)
    partdis=[0.084, 0.251, 0.665, 0;
             0.063, 0.204, 0.654, 0.079;
             0.034, 0.15, 0.409, 0.407; 
             0.01, 0.089, 0.305, 0.596];
    weight2area=[31.3, 32.2, 34.5, 35.7];
    plantarea=1;
    if(tp >= Tp(1) && tp < Tp(2))	
        p = 'p1';
        t(1) = t(1)+1;
        count = 3;
    
    elseif tp >= Tp(2) && tp < Tp(3)
		p = 'p2';
		tempyield=TDRW(PND, p);	
        co2=co2*2.5*10^4;
        fdmm=13.74624*co2^3-0.0002*co2^2+0.1647*co2-8.8555;
        partdis(1,4)=partdis(1,4)+(partdis(1,4)*fdmm/(3.7*10^10));
        partdis(1,1)= partdis(1,1)-(partdis(1,4)*fdmm/(3*3.7*10^10));
        partdis(1,2)= partdis(1,2)-(partdis(1,4)*fdmm/(3*3.7*10^10));
        partdis(1,3)= partdis(1,3)-(partdis(1,4)*fdmm/(3*3.7*10^10));
		disTDRW=partdis(1,:) * tempyield;
		weight(i,:)=disTDRW*plantarea+weight(i-1,:);
        
		area(i,1)=weight(i,3)/weight2area(1);
		t(2)=t(2)+1;
		count=35;
	
    elseif tp >= Tp(3) && tp < Tp(4)
		p = 'p3';
		tempyield=TDRW(PND, p);
        co2=co2*2.5*10^4;
        fdmm=13.74624*co2^3-0.0002*co2^2+0.1647*co2-8.8555;
        partdis(2,4)=partdis(2,4)+(partdis(2,4)*fdmm/(3.7*10^10));
        partdis(2,1)= partdis(2,1)-(partdis(2,4)*fdmm/(3*3.7*10^10));
        partdis(2,2)= partdis(2,2)-(partdis(2,4)*fdmm/(3*3.7*10^10));
        partdis(2,3)= partdis(2,3)-(partdis(2,4)*fdmm/(3*3.7*10^10));
		disTDRW=partdis(2,:) * tempyield;
		weight(i,:)=disTDRW*plantarea+weight(i-1,:);
		area(i,1)=weight(i,3)/weight2area(2);
		t(3)=t(3)+1;
		count=43;
	
    elseif tp >= Tp(4) && tp < Tp(5)
		p = 'p4';
		tempyield=TDRW(PND, p);
        co2=co2*2.5*10^4;
        fdmm=13.74624*co2^3-0.0002*co2^2+0.1647*co2-8.8555;
        partdis(3,4)=partdis(3,4)+(partdis(3,4)*fdmm/(3.7*10^10));
        partdis(3,1)= partdis(3,1)-(partdis(3,4)*fdmm/(3*3.7*10^10));
        partdis(3,2)= partdis(3,2)-(partdis(3,4)*fdmm/(3*3.7*10^10));
        partdis(3,3)= partdis(3,3)-(partdis(3,4)*fdmm/(3*3.7*10^10));
		disTDRW=partdis(3,:) * tempyield;
		weight(i,:)=disTDRW*plantarea+weight(i-1,:);
		area(i,1)=weight(i,3)/weight2area(3);
		t(4)=t(4)+1;
		count=89;
	
    else 
		p = 'p5';
		tempyield=TDRW(PND, p);
        co2=co2*2.5*10^4;
        fdmm=13.74624*co2^3-0.0002*co2^2+0.1647*co2-8.8555;
        partdis(4,4)=partdis(4,4)+(partdis(4,4)*fdmm/(3.7*10^10));
        partdis(4,1)= partdis(4,1)-(partdis(4,4)*fdmm/(3*3.7*10^10));
        partdis(4,2)= partdis(4,2)-(partdis(4,4)*fdmm/(3*3.7*10^10));
        partdis(4,3)= partdis(4,3)-(partdis(4,4)*fdmm/(3*3.7*10^10));
		disTDRW=partdis(4,:) * tempyield;
		weight(i,:)=disTDRW*plantarea+weight(i-1,:);
		area(i,1)=weight(i,3)/weight2area(4);
		t(5)=t(5)+1;
		count=100;
    end
	
    end
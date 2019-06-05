%function [t, area, weight]=main2step()
clear;clc;
for n=3:3
for m=1:8
	tp =0;		%??????
	i = 2;		%????????????????????
	j = 1;		%j==???
	%weight=[yroot, ystem, yleaf, yfruit]
	ratio=0.1*4;
    rte_1=0;
    t=[0,0,0,0,0];
    timedis(1,:)=[0,0,0,0,0];
    dis(1,:)=[0,0,0,0];
    area(1,1)= 0;
    weight(1,:)=[1, 1, 2, 0];
    disTDRW =[0,0,0,0];
    k1=[10^5 10^6 10^7 10^8 10^9 10^10];
    ca=[4.5*10^-3
        9*10^-3
        1.34*10^-2
        1.8*10^-2
        2.25*10^-2
        2.7*10^-2
        3.15*10^-2
        3.6*10^-2
        4.05*10^-2
        ];
while true
		% one day
		% T = 25 # everage temperature
		% PGD(?????CO2??) = 10.3360 # g CO2 m-2 d-1
		
		Tday(j)=Tdayca(20,30);
        Tmean(j) =Tca(20,30);
		etp = [0, 3, 35, 43, 89]; %expected time of period
		PGD(j) = main1step(ca(m),k1(n))*ratio;             %PGD(?????CO2??)==array(1,days)?????????
% 		PGD(j) = 10*ratio; 
        [Rm(j), RG(j), Rp(j)] = respiration(Tmean(j),Tday(j),PGD(j));						%Rm%RG==number
		PND(j) = PGD(j) - Rm(j)-RG(j)-Rp(j); 									    %PND(??????)==number     
		[disTDRW, t, area, weight, p, count]=growth(tp, etp, PND(j), i, t, area, weight,disTDRW,ca(m)); 		   %???yt(???yield)==[yroot, ystem, yleaf, yfruit];
													%	   t????????????==[count,count,count,count];
													%	   area??????=number; weight(?????)==[yroot, ystem, yleaf, yfruit];
													%     p(?????)==string;count(??????)=number?
													%???tp????????==number; etp????????==[0, 3, 35, 43, 89];	
												%	   PND??PND??TDRW; i(????????)==int;
		dis(i,:)=disTDRW;
        timedis(i,:)=t;
        p1=(p ~= 'p5');
        p2= p ~= 'p1' ;
		if p1(2)
			rte_1 = rte(Tday(j), p);
			tp = tp + rte_1;
        end
        
		if p2(2)
			ratio = area(i,1);
			i = i + 1;
        end	
		
		if t(5) >= 50
			fprintf('complete');
			break;
        end
		j = j + 1;
end
PND=PND';
RG=RG';
Rm=Rm';
Rp=Rp';
Tday=Tday';
Tmean=Tmean';
csvwrite(strcat('area_k1_',num2str(n),'ca',num2str(m),'.csv'),area);
csvwrite(strcat('weight_k1_',num2str(n),'ca',num2str(m),'.csv'),weight);
csvwrite(strcat('Tday_k1',num2str(n),'ca',num2str(m),'.csv'),Tday);
csvwrite(strcat('Tmean_k1',num2str(n),'ca',num2str(m),'.csv'),Tmean);
csvwrite(strcat('timedis_k1_',num2str(n),'ca',num2str(m),'.csv'),timedis);
csvwrite(strcat('RG_k1_',num2str(n),'ca',num2str(m),'.csv'),RG);
csvwrite(strcat('Rm_k1_',num2str(n),'ca',num2str(m),'.csv'),Rm);
csvwrite(strcat('Rp_k1_',num2str(n),'ca',num2str(m),'.csv'),Rp);
csvwrite(strcat('PND_k1_',num2str(n),'ca',num2str(m),'.csv'),PND);
end
end
% end
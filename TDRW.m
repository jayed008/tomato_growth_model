function tdrw=TDRW(PND, period)

    delta = 0.682;
	
switch period
    case 'p2'
        cf=[0.45, 0.45, 0.75];
        pdm=[0.1, 0.17, 0.73];
    case 'p3'
        cf=[0.45, 0.45, 0.75, 0.75];
        pdm=[0.04, 0.31, 0.62, 0.03];
    case 'p4'
        cf=[0.45, 0.45, 0.75, 0.75];
        pdm=[0.03, 0.33, 0.44, 0.20];
    case 'p5'
        cf=[0.45, 0.45, 0.75, 0.75];
        pdm=[0.02, 0.31, 0.41, 0.26];
end
    ccf = dot(cf,pdm);
    tdrw = delta * ccf * PND / (1-0.05);
end
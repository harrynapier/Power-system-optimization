
function f = trafunc5varmoopr(x,Db,Ds,outputcarbon,T,Cb,depr,batcap,weight,eff,b1,b2,b3,b4,b5)
    mo=3*T;
    Pgrid1 = x(2*T+1:3*T-1);
   
    Psellback1 = zeros(T,1);
    Pbuy1 = zeros(T,1);
    Ebat1 = x(T+1:2*T-1);
    Pbat1 = x(1:T-1);
    DeprCo1 = zeros(T,1);
    
    for t = 1:1:T-1
        if Pgrid1(t)< 0
            Psellback1(t) = -Pgrid1(t);
            Pbuy1(t) = 0;
        
        else
            Psellback1(t) = 0;
            Pbuy1(t) = Pgrid1(t);
        end
    end
    
    [c1,hist,edges,rmm,idx] = rainflow(Ebat1);

Ta1 = array2table(c1,'VariableNames',{'Count','Range','Mean','Start','End'});

cyc1 = Ta1{:,1};
dod1 = ((Ta1{:,2}/batcap)).*cyc1;
Cl1=[];
for k = 1 : length(dod1)
    Cl1(k) = 2731.7 * dod1(k)^(-0.679)*exp(1.614*(1-dod1(k)));
end
costs1 = (1./Cl1)*Cb*b1;
de1 = sum(costs1);

    Pgrid2 = x(2*T+1+mo:3*T-1+mo);
   
    Psellback2 = zeros(T,1);
    Pbuy2 = zeros(T,1);
    Ebat2 = x(T+1+mo:2*T-1+mo);
    Pbat2 = x(1+mo:T-1+mo);
    
    
    for t = 1:1:T-1
        if Pgrid2(t)< 0
            Psellback2(t) = -Pgrid2(t);
            Pbuy2(t) = 0;
    
        else
            Psellback2(t) = 0;
            Pbuy2(t) = Pgrid2(t);     
        end
    end
    
    [c2,hist,edges,rmm,idx] = rainflow(Ebat2);

Ta2 = array2table(c2,'VariableNames',{'Count','Range','Mean','Start','End'});

cyc2 = Ta2{:,1};
dod2 = ((Ta2{:,2}/batcap)).*cyc2;
Cl2=[];
for k = 1 : length(dod2)
    Cl2(k) = 2731.7 * dod2(k)^(-0.679)*exp(1.614*(1-dod2(k)));
end
costs2 = (1./Cl2)*Cb*b2;
de2 = sum(costs2);

 Pgrid3 = x(2*T+1+mo*2:3*T-1+mo*2);
   
    Psellback3 = zeros(T,1);
    Pbuy3 = zeros(T,1);
    Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
    Pbat3 = x(1+mo*2:T-1+mo*2);
    
    
    for t = 1:1:T-1
        if Pgrid3(t)< 0
            Psellback3(t) = -Pgrid3(t);
            Pbuy3(t) = 0;
    
        else
            Psellback3(t) = 0;
            Pbuy3(t) = Pgrid3(t);     
        end
    end
    
    [c3,hist,edges,rmm,idx] = rainflow(Ebat3);

Ta3 = array2table(c3,'VariableNames',{'Count','Range','Mean','Start','End'});

cyc3 = Ta3{:,1};
dod3 = ((Ta3{:,2}/batcap)).*cyc3;
Cl3=[];
for k = 1 : length(dod3)
    Cl3(k) = 2731.7 * dod3(k)^(-0.679)*exp(1.614*(1-dod3(k)));
end
costs3 = (1./Cl3)*Cb*b3;
de3 = sum(costs3);

 Pgrid4 = x(2*T+1+mo*3:3*T-1+mo*3);
   
    Psellback4 = zeros(T,1);
    Pbuy4 = zeros(T,1);
    Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
    Pbat4 = x(1+mo*3:T-1+mo*3);
    
    
    for t = 1:1:T-1
        if Pgrid4(t)< 0
            Psellback4(t) = -Pgrid4(t);
            Pbuy4(t) = 0;
    
        else
            Psellback4(t) = 0;
            Pbuy4(t) = Pgrid4(t);     
        end
    end
    
    [c4,hist,edges,rmm,idx] = rainflow(Ebat4);

Ta4 = array2table(c4,'VariableNames',{'Count','Range','Mean','Start','End'});

cyc4 = Ta4{:,1};
dod4 = ((Ta4{:,2}/batcap)).*cyc4;
Cl4=[];
for k = 1 : length(dod4)
    Cl4(k) = 2731.7 * dod4(k)^(-0.679)*exp(1.614*(1-dod4(k)));
end
costs4 = (1./Cl4)*Cb*b4;
de4 = sum(costs4);

 Pgrid5 = x(2*T+1+mo*4:3*T-1+mo*4);
   
    Psellback5 = zeros(T,1);
    Pbuy5 = zeros(T,1);
    Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
    Pbat5 = x(1+mo*4:T-1+mo*4);
    
    
    for t = 1:1:T-1
        if Pgrid5(t)< 0
            Psellback5(t) = -Pgrid5(t);
            Pbuy5(t) = 0;
    
        else
            Psellback5(t) = 0;
            Pbuy5(t) = Pgrid5(t);     
        end
    end
    
    [c5,hist,edges,rmm,idx] = rainflow(Ebat5);

Ta5 = array2table(c5,'VariableNames',{'Count','Range','Mean','Start','End'});

cyc5 = Ta5{:,1};
dod5 = ((Ta5{:,2}/batcap)).*cyc5;
Cl5=[];
for k = 1 : length(dod5)
    Cl5(k) = 2731.7 * dod5(k)^(-0.679)*exp(1.614*(1-dod5(k)));
end
costs5 = (1./Cl5)*Cb*b5;
de5 = sum(costs5);
      
    fmon = sum(Db.*Pbuy1-Ds.*Psellback1)+sum(Db.*Pbuy2-Ds.*Psellback2)+sum(Db.*Pbuy3-Ds.*Psellback3)+sum(Db.*Pbuy4-Ds.*Psellback4)+sum(Db.*Pbuy5-Ds.*Psellback5);
    fcar = sum(outputcarbon.*(Pbuy1+Pbuy2+Pbuy3+Pbuy4+Pbuy5));
    fdep = de1+de2+de3+de4+de5;
    f= fmon+fdep + fcar*weight;
    
    
end


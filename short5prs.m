function [fval,fc,fmon,fcar,fdep] = short5pr(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,b1,b2,b3,b4,b5)  
    B3eq =  [avda(:,1)-avga(:,1);avda(:,2)-avga(:,2);avda(:,3)-avga(:,3);avda(:,4)-avga(:,4);avda(:,5)-avga(:,5)];
    

    x0 = [zeros(T,1);b1*(batcap*start)*ones(T,1);Ad-Cs;zeros(T,1);b2*(batcap*start)*ones(T,1);Ad-Cs;zeros(T,1);b3*(batcap*start)*ones(T,1);Ad-Cs;zeros(T,1);b4*(batcap*start)*ones(T,1);Ad-Cs;zeros(T,1);b5*(batcap*start)*ones(T,1);Ad-Cs;zeros(T,1);zeros(T,1);zeros(T,1);zeros(T,1)];
%% upper and lower limits
 
    if coop == 1
        %Upper
        UB = [pcha*ones(T,1);b1*batcap*ones(T,1);pgrid*ones(T,1);pcha*ones(T,1);b2*batcap*ones(T,1);pgrid*ones(T,1);pcha*ones(T,1);b3*batcap*ones(T,1);pgrid*ones(T,1);pcha*ones(T,1);b4*batcap*ones(T,1);pgrid*ones(T,1);pcha*ones(T,1);b5*batcap*ones(T,1);pgrid*ones(T,1);0.01*ones(T,1);0.01*ones(T,1);0.01*ones(T,1);0.01*ones(T,1)];%;zeros(T,1)];
        
        %Lower
        LB = [-pdis*ones(T,1); b1*batmin*ones(T,1); -pgrid*ones(T,1);-pdis*ones(T,1); b2*batmin*ones(T,1); -pgrid*ones(T,1);-pdis*ones(T,1); b3*batmin*ones(T,1); -pgrid*ones(T,1);-pdis*ones(T,1); b4*batmin*ones(T,1); -pgrid*ones(T,1);-pdis*ones(T,1); b5*batmin*ones(T,1); -pgrid*ones(T,1); -0.01*ones(T,1); -0.01*ones(T,1); -0.01*ones(T,1); -0.01*ones(T,1)];%; zeros(T,1)];
        
    elseif coop == 2
        %Upper
        UB = [pcha*ones(T,1);b1*batcap*ones(T,1);pgrid*ones(T,1);pcha*ones(T,1);b2*batcap*ones(T,1);pgrid*ones(T,1);pcha*ones(T,1);b3*batcap*ones(T,1);pgrid*ones(T,1);pcha*ones(T,1);b4*batcap*ones(T,1);pgrid*ones(T,1);pcha*ones(T,1);b5*batcap*ones(T,1);pgrid*ones(T,1);5*ones(T,1);0.01*ones(T,1);5*ones(T,1);0.01*ones(T,1)];%;zeros(T,1)];
        
        %Lower
        LB = [-pdis*ones(T,1); b1*batmin*ones(T,1); -pgrid*ones(T,1);-pdis*ones(T,1); b2*batmin*ones(T,1); -pgrid*ones(T,1);-pdis*ones(T,1); b3*batmin*ones(T,1); -pgrid*ones(T,1);-pdis*ones(T,1); b4*batmin*ones(T,1); -pgrid*ones(T,1);-pdis*ones(T,1); b5*batmin*ones(T,1); -pgrid*ones(T,1); -5*ones(T,1); -0.01*ones(T,1); -5*ones(T,1); -0.01*ones(T,1)];%; zeros(T,1)];
    else
        %Upper
        UB = [pcha*ones(T,1);b1*batcap*ones(T,1);pgrid*ones(T,1);pcha*ones(T,1);b2*batcap*ones(T,1);pgrid*ones(T,1);pcha*ones(T,1);b3*batcap*ones(T,1);pgrid*ones(T,1);pcha*ones(T,1);b4*batcap*ones(T,1);pgrid*ones(T,1);pcha*ones(T,1);b5*batcap*ones(T,1);pgrid*ones(T,1);5*ones(T,1);5*ones(T,1);5*ones(T,1);5*ones(T,1)];%;zeros(T,1)];
        
        %Lower
        LB = [-pdis*ones(T,1); b1*batmin*ones(T,1); -pgrid*ones(T,1);-pdis*ones(T,1); b2*batmin*ones(T,1); -pgrid*ones(T,1);-pdis*ones(T,1); b3*batmin*ones(T,1); -pgrid*ones(T,1);-pdis*ones(T,1); b4*batmin*ones(T,1); -pgrid*ones(T,1);-pdis*ones(T,1); b5*batmin*ones(T,1); -pgrid*ones(T,1); -5*ones(T,1); -5*ones(T,1); -5*ones(T,1); -5*ones(T,1)];%; zeros(T,1)];
    end
    %% solving optimization
%[x,fval,exitflag] = fmincon(@(x)newbasefunccount2(x,D,outputcarbon,T,Cb,depr,batcap,weight,eff),x0,A,B,Aeq,Beq,LB,UB,@(x)newbasenolin(x,T,A2,A3eq,B3eq,batmin,eff),options);
problem = createOptimProblem('fmincon','objective',@(x)trafunc5varmoopr(x,Db,Ds,outputcarbon,T,Cb,depr,batcap,weight,eff,b1,b2,b3,b4,b5),'x0',x0,'Aineq',A,'bineq',B,'Aeq',Aeq,'beq',Beq,'lb',LB,'ub',UB,'nonlcon',@(x)tranolin5(x,T,A2,A3eq,B3eq,batmin,eff),'options',options);
gs = GlobalSearch('Display','iter','NumTrialPoints',trials);
[xg,fg,exitflag,output,solutions] = run(gs,problem);
%[xg,fg,exitflag] = fmincon(problem);
disp(fg);
disp(exitflag);
fval=fg;

if exitflag ~= 2 && exitflag ~= 1
    beep
    disp('Non converance');
end
    x=xg;
    mo =3*T;
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
costs1 = (1./Cl1)*Cb;
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
costs2 = (1./Cl2)*Cb;
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
costs3 = (1./Cl3)*Cb;
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
costs4 = (1./Cl4)*Cb;
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
costs5 = (1./Cl5)*Cb;
de5 = sum(costs5);
      
    fmon = sum(Db.*Pbuy1-Ds.*Psellback1)+sum(Db.*Pbuy2-Ds.*Psellback2)+sum(Db.*Pbuy3-Ds.*Psellback3)+sum(Db.*Pbuy4-Ds.*Psellback4)+sum(Db.*Pbuy5-Ds.*Psellback5);
    fcar = sum(outputcarbon.*(Pbuy1+Pbuy2+Pbuy3+Pbuy4+Pbuy5));
    fdep = de1+de2+de3+de4+de5;
    f= fmon+fdep + fcar*weight;
    

figure %ploting data
hold on
subplot(2,2,1)
hold on

for i = 1:5*3
plot(x((i-1)*T+1:i*T))
end
title('Optimized Values')
xlabel('Time (Hours)')
ylabel('Power (Kw) / Energy Stored (Kwh)')
%legend('Rate of Charge/Discharge of battery1','Energy Stored1','Grid Power1','Rate of Charge/Discharge of battery','Energy Stored','Grid Power')
subplot(2,2,2)
hold on
for i = 1 : 5
plot(avda(:,i))
end

title('Demand')
xlabel('Time (Hours)')
ylabel('Demand (Kw)')
%
legend('demand 1','demand 2')
subplot(2,2,3)
plot(avp)
title('Price')
xlabel('Time (Hours)')
ylabel('Price ($/Kwh)')
subplot(2,2,4)
hold on
% plot((D.*(Pbuy1-Psellback1)))
% plot((D.*(Pbuy2-Psellback2)))
% title('Energy Bill')
% xlabel('Time (Hours)')
% ylabel('Cost ($)')

for i = 1 : 5-1
    plot(x(5*mo+(i-1)*t+1:5*mo+i*T))
end
ylim([-3 3])
title('exchange')
xlabel('Time (Hours)')
ylabel('power Kwh')
fc=x;

[fvv,fmong,fcarg,fdepg]=traf5pr(x,Db,Ds,outputcarbon,T,Cb,depr,batcap,weight,eff,b1,b2,b3,b4,b5);
fmon=fmong;
fcar=fcarg;
fdep=fdepg;
toc;
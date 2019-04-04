function [c,ceq] = tranolin5(x,T,A2,A3eq,B3eq,batmin,eff)
%% new efficiency
    %Pbat(t)*eff - Pgrid(t) - sola(t) + Pload(t) = 0
   Pbat1 = x(1:T);
   mo=3*T;
    for t = 1:T %defines for the number of time frames
            if Pbat1(t)>0
            A3eq(t, t:T:T) = 1*eff*eff;
            end
    end
    Pbat2 = x(1+mo:mo+T);

    for t = 1:T %defines for the number of time frames
            if Pbat2(t)>0
            A3eq(t+T, t+mo:T:T+mo) = 1*eff*eff;
            end
    end
    
    Pbat3 = x(1+mo*2:mo*2+T);

    for t = 1:T %defines for the number of time frames
            if Pbat3(t)>0
            A3eq(t+2*T, t+mo*2:T:T+mo*2) = 1*eff*eff;
            end
    end
    Pbat4 = x(1+mo*3:mo*3+T);

    for t = 1:T %defines for the number of time frames
            if Pbat4(t)>0
            A3eq(t+T*3, t+mo*3:T:T+mo*3) = 1*eff*eff;
            end
    end
    Pbat5 = x(1+mo*4:mo*4+T);

    for t = 1:T %defines for the number of time frames
            if Pbat5(t)>0
            A3eq(t+T*4, t+mo*4:T:T+mo*4) = 1*eff*eff;
            end
    end
    
c = [(A2*x)];
ceq = [((A3eq*x)+B3eq)];
%ceq=[];


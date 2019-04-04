classdef shortnewseper < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        NumberofUsersDropDownLabel     matlab.ui.control.Label
        NumberofUsersDropDown          matlab.ui.control.DropDown
        EmissionsdataDropDownLabel     matlab.ui.control.Label
        EmissionsdataDropDown          matlab.ui.control.DropDown
        DatePickerLabel                matlab.ui.control.Label
        DatePicker                     matlab.ui.control.DatePicker
        EmissionsweightSliderLabel     matlab.ui.control.Label
        EmissionsweightSlider          matlab.ui.control.Slider
        BatterycapacityKWhEditFieldLabel  matlab.ui.control.Label
        BatterycapacityKWhEditField    matlab.ui.control.NumericEditField
        StartSOCSliderLabel            matlab.ui.control.Label
        StartSOCSlider                 matlab.ui.control.Slider
        BatteryminSliderLabel          matlab.ui.control.Label
        BatteryminSlider               matlab.ui.control.Slider
        FvalEditFieldLabel             matlab.ui.control.Label
        FvalEditField                  matlab.ui.control.NumericEditField
        UIAxes                         matlab.ui.control.UIAxes
        RunButton                      matlab.ui.control.Button
        DatePicker2Label               matlab.ui.control.Label
        DatePicker2                    matlab.ui.control.DatePicker
        cooperationDropDownLabel       matlab.ui.control.Label
        cooperationDropDown            matlab.ui.control.DropDown
        KeepdataSwitchLabel            matlab.ui.control.Label
        KeepdataSwitch                 matlab.ui.control.Switch
        RawcostEditFieldLabel          matlab.ui.control.Label
        RawcostEditField               matlab.ui.control.NumericEditField
        UseFixedFeedinTariffCheckBox   matlab.ui.control.CheckBox
        FITEditFieldLabel              matlab.ui.control.Label
        FITEditField                   matlab.ui.control.NumericEditField
        OnedaytestpriceCheckBox        matlab.ui.control.CheckBox
        fmonEditFieldLabel             matlab.ui.control.Label
        fmonEditField                  matlab.ui.control.NumericEditField
        fcarEditFieldLabel             matlab.ui.control.Label
        fcarEditField                  matlab.ui.control.NumericEditField
        fdepEditFieldLabel             matlab.ui.control.Label
        fdepEditField                  matlab.ui.control.NumericEditField
        UpdateresultsButton            matlab.ui.control.Button
        ProgressEditFieldLabel         matlab.ui.control.Label
        ProgressEditField              matlab.ui.control.EditField
        LongrunresultsoptionsLabel     matlab.ui.control.Label
        LongrunresultsoptionsDropDown  matlab.ui.control.DropDown
        LongrunCheckBox                matlab.ui.control.CheckBox
        RuntimeEditFieldLabel          matlab.ui.control.Label
        RuntimeEditField               matlab.ui.control.NumericEditField
        StoreButton                    matlab.ui.control.Button
        EditField                      matlab.ui.control.NumericEditField
        EditField_2                    matlab.ui.control.NumericEditField
        EditField_3                    matlab.ui.control.NumericEditField
        EditField_4                    matlab.ui.control.NumericEditField
        EditField_5                    matlab.ui.control.NumericEditField
        comp0mooCheckBox               matlab.ui.control.CheckBox
        TrialPointsEditFieldLabel      matlab.ui.control.Label
        TrialPointsEditField           matlab.ui.control.NumericEditField
        IDEditFieldLabel               matlab.ui.control.Label
        IDEditField                    matlab.ui.control.EditField
    end

    
    properties (Access = public)
        
        b1=1.4; % battery caps for five system
        b2=1.2;
        b3=1;
        b4=0.8;
        b5=0.6;
        
        avdas = 0.1*ones(24,1); % global stores for input data
        avgas = 0.1*ones(24,1);
        ag = 0.1*ones(24,1);
        ad = 0.1*ones(24,1);
        
        fva = 0; % these are all for storing objective values 
        fmo=0;
        fca=0;
        fde=0;
        fra=0;
        
        
        fva2 = 0;
        fmo2=0;
        fca2=0;
        fde2=0;
        fra2=0;
        
        fva3 = 0;
        fmo3=0;
        fca3=0;
        fde3=0;
        fra3=0;
        
        fva4 = 0;
        fmo4=0;
        fca4=0;
        fde4=0;
        fra4=0;
        
        Ebat511=[]; % store historical battery scheduals
        Ebat512=[];
        Ebat513=[];
        Ebat514=[];
        Ebat515=[];
        
        Ebat521=[];
        Ebat522=[];
        Ebat523=[];
        Ebat524=[];
        Ebat525=[];
        
        Ebat551=[];
        Ebat552=[];
        Ebat553=[];
        Ebat554=[];
        Ebat555=[];
        
        Ebat611=[];
        Ebat612=[];
        Ebat613=[];
        Ebat614=[];
        Ebat615=[];
        Ebat616=[];
        
        Ebat621=[];
        Ebat622=[];
        Ebat623=[];
        Ebat624=[];
        Ebat625=[];
        Ebat626=[];
        
        Ebat631=[];
        Ebat632=[];
        Ebat633=[];
        Ebat634=[];
        Ebat635=[];
        Ebat636=[];
        
        Ebat661=[];
        Ebat662=[];
        Ebat663=[];
        Ebat664=[];
        Ebat665=[];
        Ebat666=[];
        
        Ebat51 = [];
        Ebat52 = [];
        Ebat53 = [];
        Ebat54 = [];
        Ebat55 = [];
        
        Ebat61 = [];
        Ebat62 = [];
        Ebat63 = [];
        Ebat64 = [];
        Ebat65 = [];
        Ebat66 = [];
        
        nets = 0;
        
        cfva = 0;
        cfmo=0;
        cfca=0;
        cfde=0;
        cfra=0;
        
        
        cfva2 = 0;
        cfmo2=0;
        cfca2=0;
        cfde2=0;
        cfra2=0;
        
        cfva3 = 0;
        cfmo3=0;
        cfca3=0;
        cfde3=0;
        cfra3=0;
        
        cfva4 = 0;
        cfmo4=0;
        cfca4=0;
        cfde4=0;
        cfra4=0;
        
        cEbat511=[];
        cEbat512=[];
        cEbat513=[];
        cEbat514=[];
        cEbat515=[];
        
        cEbat521=[];
        cEbat522=[];
        cEbat523=[];
        cEbat524=[];
        cEbat525=[];
        
        cEbat551=[];
        cEbat552=[];
        cEbat553=[];
        cEbat554=[];
        cEbat555=[];
        
        cEbat611=[];
        cEbat612=[];
        cEbat613=[];
        cEbat614=[];
        cEbat615=[];
        cEbat616=[];
        
        cEbat621=[];
        cEbat622=[];
        cEbat623=[];
        cEbat624=[];
        cEbat625=[];
        cEbat626=[];
        
        cEbat631=[];
        cEbat632=[];
        cEbat633=[];
        cEbat634=[];
        cEbat635=[];
        cEbat636=[];
        
        cEbat661=[];
        cEbat662=[];
        cEbat663=[];
        cEbat664=[];
        cEbat665=[];
        cEbat666=[];
        
        cEbat51 = [];
        cEbat52 = [];
        cEbat53 = [];
        cEbat54 = [];
        cEbat55 = [];
        
        cEbat61 = [];
        cEbat62 = [];
        cEbat63 = [];
        cEbat64 = [];
        cEbat65 = [];
        cEbat66 = [];
        
    end
    
    

    methods (Access = private)

        % Value changed function: NumberofUsersDropDown
        function NumberofUsersDropDownValueChanged(app, event)
            value = app.NumberofUsersDropDown.Value;
            
        end

        % Button pushed function: RunButton
        function RunButtonPushed(app, event)
            tic;
            
            
            f = uifigure(app.UIFigure);
            
            f.Position = [27 414 96 22];
            
            d = uiprogressdlg(f,'Title','Running',...
                'Message','Starting the application');
            app.ProgressEditField.Value = 'Starting the application'; % for the progress bar
            
            schec = app.DatePicker.Value; % taking start date
            echec = app.DatePicker2.Value; % taking end date
            
            scheck = schec + hours(0); % initiating start time 
            echeck = echec + hours(23); % initiating end time
            net= app.NumberofUsersDropDown.Value; % number of users
            netsize = str2double(net); % converting number of users to double
            app.nets = netsize; %global store
            
            mon = app.EmissionsdataDropDown.Value; % emissions data choice
            weight = app.EmissionsweightSlider.Value; % multi objective weight
            if strcmp(app.KeepdataSwitch.Value,'Off')
                [T,avg2,avd2,avg,avd,avga,avda]=pecfunc2uni(scheck,echeck,netsize); % obtains the data of the generation
                % and demand
            else
                
                % global storing
                avga = app.avgas;
                avda = app.avdas;
                avg = app.ag;
                avd = app.ad;
                
            end
            % updating progress bar
            d.Value = .1;
            d.Message = 'Pecan Street Data In';
            app.ProgressEditField.Value = 'Pecan Street Data In';
            
            [avga2,avda2]=validateuni(avga,avda,scheck,echeck)    ; % data validation
            
            % update progress bar
            d.Value = .2;
            d.Message = 'Pecan Street Data Validated';
            app.ProgressEditField.Value = 'Pecan Street Data Validated';
            
            [avp,avp2,tilen] = pricefuncuni(scheck,echeck);          % obtains the pricing data
            
            % update progress bar
            d.Value = .3;
            d.Message = 'Price Data In';
            
            
            [outputcarbon,outputSO2,outputNOx] = importcarbonuni(mon); % obtains the emissions data
            avga = avga2;
            avda = avda2;
            app.ProgressEditField.Value = 'Carbon data imported';
            
            disp('avda')
            disp(avda)
            disp('avga')
            disp(avga)
            disp('D')
            disp(avp*100)
            
            %global value update
            app.avgas = avga;
            app.avdas = avda;
            app.ag=avg;
            app.ad=avd;
            
            Dt = inonedayuni(); %obtain one day test price
            trials = app.TrialPointsEditField.Value;
            app.FvalEditField.Value = 333; % testing output
            
            T=tilen ; % setting the number of time steps
            days = tilen/24;
            outputcarbon = repmat(outputcarbon,days,1); % converting the emissions data to useable format
            Ad = avd*1;  %data for demand average day
            Cs = avg*1; % data for solar generation average day
            D=avp*100;  % convert price to cents
            E = ones(T,1);  % preallocating memory for battery state
            %batcap=13.500;    % battery capacity in Kwh
            batcap = 10;
            %batmin=200;
            start=0.4;  % ratio of battery capacity at the start of the day
            batmin =batcap*0.1; % minimum value of battery capacity
            period=1;  % ratio of an hour for each iteration
            pdis= 7*period;       % battery rate of discharge in Kw per time step
            pcha=7*period;       % battery rate of charge in Kw per time step
            pgrid =40*period;     %max grid power
            
            eff = 0.95;               %charge and discharge efficiencies
            %Cb = 385000;              % battery cost for use with depreciation as linked to https://www.emu.com.pl/files/pdf/AHI_White%20Paper%20-%20Energy%20Storage%20Modeling.pdf
            Cb = 300000;
            depr = 0.000008;           % Percentage of depreciation of the battery cost for a full charge
            
            % assigning battery capacity variation
            if netsize == 5
                ba1=1.4;
                ba2=1.2;
                ba3=1;
                ba4=0.8;
                ba5=0.6;
            elseif netsize == 6
                ba1=1;
                ba2=1.2;
                ba3=1.4;
                ba4=1;
                ba5=0.8;
                ba6 = 0.6;
            end
            
            if app.OnedaytestpriceCheckBox.Value ==1 % test price time check
                if T == 24
                    D = Dt*100; % converting price from dollars to cent
                    
                else
                    disp('not 24 hours')
                    return
                end
                
            end
            %update progress bar
            d.Value = .5;
            d.Message = 'Optimization Starting';
            
            app.ProgressEditField.Value = 'Optimization Starting';
            
            if max(size(gcp)) == 0 % parallel pool needed
                parpool % create the parallel pool
            end
            
            %% optimization options
            options = optimset('Algorithm','sqp','TolCon',1e-2,'UseParallel',true);  % spq because it is faster and is fairly stable
            options.MaxFunEvals = 100000000;
            options.MaxIter = 100000000;
            %    options.Display = 'iter';
            
            if netsize ==5
                %% inital guess
                x0=[zeros(T,1);(batcap-batmin)*ones(T,1)+batmin;Ad;zeros(T,1);(batcap-batmin)*ones(T,1)+batmin;Ad;zeros(T,1);(batcap-batmin)*ones(T,1)+batmin;Ad;zeros(T,1);(batcap-batmin)*ones(T,1)+batmin;Ad;zeros(T,1);(batcap-batmin)*ones(T,1)+batmin;Ad;zeros(T,1);zeros(T,1);zeros(T,1);zeros(T,1)];   % initial guess
                
                mo = 3*T;
                %% equality constrains for E(t+1) = E(t) + Pbat(t)
                Aeq1 = zeros(T+1, T*(19));
                for t = 1:T
                    Aeq1(t, t:T:T) = 1;
                    Aeq1(t, T+t:T:T*(2)) = 1;
                    if t <= T-1
                        Aeq1(t, (T+t:T:T*(2))+1) = -1;
                    end
                end
                Aeq2 = zeros(T+1, T*(19));
                for t = 1:T
                    Aeq2(t, t+mo:T:T+mo) = 1;
                    Aeq2(t, T+t+mo:T:T*(2)+mo) = 1;
                    if t <= T-1
                        Aeq2(t, (T+t+mo:T:T*(2)+mo)+1) = -1;
                    end
                end
                Aeq3 = zeros(T+1, T*(19));
                for t = 1:T
                    Aeq3(t, t+mo*2:T:T+mo*2) = 1;
                    Aeq3(t, T+t+mo*2:T:T*(2)+mo*2) = 1;
                    if t <= T-1
                        Aeq3(t, (T+t+mo*2:T:T*(2)+mo*2)+1) = -1;
                    end
                end
                Aeq4 = zeros(T+1, T*(19));
                for t = 1:T
                    Aeq4(t, t+mo*3:T:T+mo*3) = 1;
                    Aeq4(t, T+t+mo*3:T:T*(2)+mo*3) = 1;
                    if t <= T-1
                        Aeq4(t, (T+t+mo*3:T:T*(2)+mo*3)+1) = -1;
                    end
                end
                Aeq5 = zeros(T+1, T*(19));
                for t = 1:T
                    Aeq5(t, t+mo*4:T:T+mo*4) = 1;
                    Aeq5(t, T+t+mo*4:T:T*(2)+mo*4) = 1;
                    if t <= T-1
                        Aeq5(t, (T+t+mo*4:T:T*(2)+mo*4)+1) = -1;
                    end
                end
                
                
                
                
                
                Aeq1(T+1,T+1)=1;% adding start value for battery charge
                Aeq2(T+1,T+1+mo)=1;% adding start value for battery charge
                Aeq3(T+1,T+1+2*mo)=1;% adding start value for battery charge
                Aeq4(T+1,T+1+3*mo)=1;% adding start value for battery charge
                Aeq5(T+1,T+1+4*mo)=1;% adding start value for battery charge
                
                Aeq = [Aeq1;Aeq2;Aeq3;Aeq4;Aeq5];
                Beq = zeros(T,5) ;
                Beq(T+1,1)=start*batcap;% assign start values
                Beq(T+1,2)=start*batcap;
                Beq(T+1,3)=start*batcap;
                Beq(T+1,4)=start*batcap;
                Beq(T+1,5)=start*batcap;
                
                %% inequality constraints
                A=[];
                B=[];
                
                
                %% battery consistancy ensures positive battery charge always
                %-Ebat(t) -Pbat(t) <= 0
                A21 = zeros(T, T*19);
                for t = 1:T %defines for the number of time frames
                    A21(t, t:T:T) = -1;
                    A21(t, T+t:T:T*2) = -1;
                end
                A22 = zeros(T, T*19);
                for t = 1:T %defines for the number of time frames
                    A22(t, t+mo:T:T+mo) = -1;
                    A22(t, T+t+mo:T:T*2+mo) = -1;
                end
                A23 = zeros(T, T*19);
                for t = 1:T %defines for the number of time frames
                    A23(t, t+mo*2:T:T+mo*2) = -1;
                    A23(t, T+t+mo*2:T:T*2+mo*2) = -1;
                end
                A24 = zeros(T, T*19);
                for t = 1:T %defines for the number of time frames
                    A24(t, t+mo*3:T:T+mo*3) = -1;
                    A24(t, T+t+mo*3:T:T*2+mo*3) = -1;
                end
                A25 = zeros(T, T*19);
                for t = 1:T %defines for the number of time frames
                    A25(t, t+mo*4:T:T+mo*4) = -1;
                    A25(t, T+t+mo*4:T:T*2+mo*4) = -1;
                end
                A2=[A21;A22;A23;A24;A25];
                %% Constraints for Ceq - Power  balancing
                %1) Pbat1(t) - Pgrid1(t) - sola1(t) + Pload1(t) + Ptrad1(t) = 0
                %2) Pbat2(t) - Pgrid2(t) - sola2(t) + Pload2(t) - Ptrad1(t) + Ptrad2(t) = 0
                %3) Pbat3(t) - Pgrid3(t) - sola3(t) + Pload3(t) - Ptrad2(t) + Ptrad3(t) = 0
                %4) Pbat4(t) - Pgrid4(t) - sola4(t) + Pload4(t) - Ptrad3(t) + Ptrad4(t) = 0
                %5) Pbat5(t) - Pgrid5(t) - sola5(t) + Pload5(t) - Ptrad4(t) = 0
                
                %   Batt1  -(1)- batt2 -(2)- batt3 -(3)- batt4 -(4)- batt5
                
                
                
                %power goes from 1 to 2 for positive Ptrade
                A3eq1 = zeros(T, T*19);
                for t = 1:T %defines for the number of time frames
                    A3eq1(t, t:T:T) = 1/eff;   % Pbat with efficiency for assumed negative value
                    A3eq1(t, T*2+t:T:T*3) = -1; % Pgrid
                    A3eq1(t, mo*5+t:T:mo*5+T) = 1;  % Ptra1
                end
                
                A3eq2 = zeros(T, T*19);
                for t = 1:T %defines for the number of time frames
                    A3eq2(t, t+mo:T:T+mo) = 1/eff;   % Pbat with efficiency for assumed negative value
                    A3eq2(t, T*2+t+mo:T:T*3+mo) = -1; % Pgrid
                    A3eq2(t, mo*5+t:T:mo*5+T) = -1;  % Ptra1
                    A3eq2(t, mo*5+T+t:T:mo*5+2*T) = 1; %ptra2
                end
                
                A3eq3 = zeros(T, T*19);
                for t = 1:T %defines for the number of time frames
                    A3eq3(t, t+mo*2:T:T+mo*2) = 1/eff;   % Pbat with efficiency for assumed negative value
                    A3eq3(t, T*2+t+mo*2:T:T*3+mo*2) = -1; % Pgrid
                    A3eq3(t, mo*5+T+t:T:mo*5+2*T) = -1;  % Ptra
                    A3eq3(t, mo*5+2*T+t:T:mo*5+3*T) = 1;  % Ptra
                end
                
                A3eq4 = zeros(T, T*19);
                for t = 1:T %defines for the number of time frames
                    A3eq4(t, t+mo*3:T:T+mo*3) = 1/eff;   % Pbat with efficiency for assumed negative value
                    A3eq4(t, T*2+t+mo*3:T:T*3+mo*3) = -1; % Pgrid
                    A3eq4(t, mo*5+2*T+t:T:mo*5+3*T) = -1;  % Ptra
                    A3eq4(t, mo*5+3*T+t:T:mo*5+4*T) = 1;  % Ptra
                end
                
                A3eq5 = zeros(T, T*19);
                for t = 1:T %defines for the number of time frames
                    A3eq5(t, t+mo*4:T:T+mo*4) = 1/eff;   % Pbat with efficiency for assumed negative value
                    A3eq5(t, T*2+t+mo*4:T:T*3+mo*4) = -1; % Pgrid
                    A3eq5(t, mo*5+3*T+t:T:mo*5+4*T) = -1;  % Ptra
                end
                
                
                A3eq = [A3eq1;A3eq2;A3eq3;A3eq4;A3eq5];
                app.FvalEditField.Value = 666; % testing output
                
                
            elseif netsize == 6
                
                %% inital guess
                x0=[zeros(T,1);(batcap-batmin)*ones(T,1)+batmin;Ad;zeros(T,1);(batcap-batmin)*ones(T,1)+batmin;Ad;zeros(T,1);(batcap-batmin)*ones(T,1)+batmin;Ad;zeros(T,1);(batcap-batmin)*ones(T,1)+batmin;Ad;zeros(T,1);(batcap-batmin)*ones(T,1)+batmin;Ad;zeros(T,1);(batcap-batmin)*ones(T,1)+batmin;Ad;zeros(T,1);zeros(T,1);zeros(T,1);zeros(T,1);zeros(T,1)];   % initial guess
                
                mo = 3*T;
                %% equality constrains for E(t+1) = E(t) + Pbat(t)
                Aeq1 = zeros(T+1, T*(23));
                for t = 1:T
                    Aeq1(t, t:T:T) = 1;
                    Aeq1(t, T+t:T:T*(2)) = 1;
                    if t <= T-1
                        Aeq1(t, (T+t:T:T*(2))+1) = -1;
                    end
                end
                Aeq2 = zeros(T+1, T*(23));
                for t = 1:T
                    Aeq2(t, t+mo:T:T+mo) = 1;
                    Aeq2(t, T+t+mo:T:T*(2)+mo) = 1;
                    if t <= T-1
                        Aeq2(t, (T+t+mo:T:T*(2)+mo)+1) = -1;
                    end
                end
                Aeq3 = zeros(T+1, T*(23));
                for t = 1:T
                    Aeq3(t, t+mo*2:T:T+mo*2) = 1;
                    Aeq3(t, T+t+mo*2:T:T*(2)+mo*2) = 1;
                    if t <= T-1
                        Aeq3(t, (T+t+mo*2:T:T*(2)+mo*2)+1) = -1;
                    end
                end
                Aeq4 = zeros(T+1, T*(23));
                for t = 1:T
                    Aeq4(t, t+mo*3:T:T+mo*3) = 1;
                    Aeq4(t, T+t+mo*3:T:T*(2)+mo*3) = 1;
                    if t <= T-1
                        Aeq4(t, (T+t+mo*3:T:T*(2)+mo*3)+1) = -1;
                    end
                end
                Aeq5 = zeros(T+1, T*(23));
                for t = 1:T
                    Aeq5(t, t+mo*4:T:T+mo*4) = 1;
                    Aeq5(t, T+t+mo*4:T:T*(2)+mo*4) = 1;
                    if t <= T-1
                        Aeq5(t, (T+t+mo*4:T:T*(2)+mo*4)+1) = -1;
                    end
                end
                
                Aeq6 = zeros(T+1, T*(23));
                for t = 1:T
                    Aeq6(t, t+mo*5:T:T+mo*5) = 1;
                    Aeq6(t, T+t+mo*5:T:T*(2)+mo*5) = 1;
                    if t <= T-1
                        Aeq6(t, (T+t+mo*5:T:T*(2)+mo*5)+1) = -1;
                    end
                end
                
                
                
                
                
                Aeq1(T+1,T+1)=1;% adding start value for battery charge
                Aeq2(T+1,T+1+mo)=1;% adding start value for battery charge
                Aeq3(T+1,T+1+2*mo)=1;% adding start value for battery charge
                Aeq4(T+1,T+1+3*mo)=1;% adding start value for battery charge
                Aeq5(T+1,T+1+4*mo)=1;% adding start value for battery charge
                Aeq6(T+1,T+1+5*mo)=1;% adding start value for battery charge
                
                Aeq = [Aeq1;Aeq2;Aeq3;Aeq4;Aeq5;Aeq6];
                Beq = zeros(T,6) ;
                Beq(T+1,1)=start*batcap;
                Beq(T+1,2)=start*batcap;
                Beq(T+1,3)=start*batcap;
                Beq(T+1,4)=start*batcap;
                Beq(T+1,5)=start*batcap;
                Beq(T+1,6)=start*batcap;
                %% inequality constraints
                A=[];
                B=[];
                
                
                %% battery consistancy ensures positive battery charge always
                %-Ebat(t) -Pbat(t) <= 0
                A21 = zeros(T, T*23);
                for t = 1:T %defines for the number of time frames
                    A21(t, t:T:T) = -1;
                    A21(t, T+t:T:T*2) = -1;
                end
                A22 = zeros(T, T*23);
                for t = 1:T %defines for the number of time frames
                    A22(t, t+mo:T:T+mo) = -1;
                    A22(t, T+t+mo:T:T*2+mo) = -1;
                end
                A23 = zeros(T, T*23);
                for t = 1:T %defines for the number of time frames
                    A23(t, t+mo*2:T:T+mo*2) = -1;
                    A23(t, T+t+mo*2:T:T*2+mo*2) = -1;
                end
                A24 = zeros(T, T*23);
                for t = 1:T %defines for the number of time frames
                    A24(t, t+mo*3:T:T+mo*3) = -1;
                    A24(t, T+t+mo*3:T:T*2+mo*3) = -1;
                end
                A25 = zeros(T, T*23);
                for t = 1:T %defines for the number of time frames
                    A25(t, t+mo*4:T:T+mo*4) = -1;
                    A25(t, T+t+mo*4:T:T*2+mo*4) = -1;
                end
                A26 = zeros(T, T*23);
                for t = 1:T %defines for the number of time frames
                    A26(t, t+mo*5:T:T+mo*5) = -1;
                    A26(t, T+t+mo*5:T:T*2+mo*5) = -1;
                end
                A2=[A21;A22;A23;A24;A25;A26];
                %% Constraints for Ceq - Power  balancing
                %1) Pbat1(t) - Pgrid1(t) - sola1(t) + Pload1(t) + Ptrad1(t) = 0
                %2) Pbat2(t) - Pgrid2(t) - sola2(t) + Pload2(t) - Ptrad1(t) + Ptrad2(t) = 0
                %3) Pbat3(t) - Pgrid3(t) - sola3(t) + Pload3(t) - Ptrad2(t) + Ptrad3(t) = 0
                %4) Pbat4(t) - Pgrid4(t) - sola4(t) + Pload4(t) - Ptrad3(t) + Ptrad4(t) = 0
                %5) Pbat5(t) - Pgrid5(t) - sola5(t) + Pload5(t) - Ptrad4(t) + Ptrad5(t) = 0
                %6) Pbat6(t) - Pgrid6(t) - sola6(t) + Pload6(t) - Ptrad5(t)
                
                %   Batt1  -(1)- batt2 -(2)- batt3 -(3)- batt4 -(4)- batt5 -(5)- batt6
                
                
                
                %power goes from 1 to 2 for positive Ptrade
                A3eq1 = zeros(T, T*23);
                for t = 1:T %defines for the number of time frames
                    A3eq1(t, t:T:T) = 1/eff;   % Pbat with efficiency for assumed negative value
                    A3eq1(t, T*2+t:T:T*3) = -1; % Pgrid
                    A3eq1(t, mo*6+t:T:mo*6+T) = 1;  % Ptra1
                end
                
                A3eq2 = zeros(T, T*23);
                for t = 1:T %defines for the number of time frames
                    A3eq2(t, t+mo:T:T+mo) = 1/eff;   % Pbat with efficiency for assumed negative value
                    A3eq2(t, T*2+t+mo:T:T*3+mo) = -1; % Pgrid
                    A3eq2(t, mo*6+t:T:mo*6+T) = -1;  % Ptra1
                    A3eq2(t, mo*6+T+t:T:mo*6+2*T) = 1; %ptra2
                end
                
                A3eq3 = zeros(T, T*23);
                for t = 1:T %defines for the number of time frames
                    A3eq3(t, t+mo*2:T:T+mo*2) = 1/eff;   % Pbat with efficiency for assumed negative value
                    A3eq3(t, T*2+t+mo*2:T:T*3+mo*2) = -1; % Pgrid
                    A3eq3(t, mo*6+T+t:T:mo*6+2*T) = -1;  % Ptra
                    A3eq3(t, mo*6+2*T+t:T:mo*6+3*T) = 1;  % Ptra
                end
                
                A3eq4 = zeros(T, T*23);
                for t = 1:T %defines for the number of time frames
                    A3eq4(t, t+mo*3:T:T+mo*3) = 1/eff;   % Pbat with efficiency for assumed negative value
                    A3eq4(t, T*2+t+mo*3:T:T*3+mo*3) = -1; % Pgrid
                    A3eq4(t, mo*6+2*T+t:T:mo*6+3*T) = -1;  % Ptra
                    A3eq4(t, mo*6+3*T+t:T:mo*6+4*T) = 1;  % Ptra
                end
                
                A3eq5 = zeros(T, T*23);
                for t = 1:T %defines for the number of time frames
                    A3eq5(t, t+mo*4:T:T+mo*4) = 1/eff;   % Pbat with efficiency for assumed negative value
                    A3eq5(t, T*2+t+mo*4:T:T*3+mo*4) = -1; % Pgrid
                    A3eq5(t, mo*6+3*T+t:T:mo*6+4*T) = -1;  % Ptra
                    A3eq4(t, mo*6+4*T+t:T:mo*6+5*T) = 1;  % Ptra
                end
                
                A3eq6 = zeros(T, T*23);
                for t = 1:T %defines for the number of time frames
                    A3eq6(t, t+mo*5:T:T+mo*5) = 1/eff;   % Pbat with efficiency for assumed negative value
                    A3eq6(t, T*2+t+mo*5:T:T*3+mo*5) = -1; % Pgrid
                    A3eq6(t, mo*6+4*T+t:T:mo*6+5*T) = -1;  % Ptra
                end
                
                A3eq = [A3eq1;A3eq2;A3eq3;A3eq4;A3eq5;A3eq6];
            end
            
            
            
            d.Value = .6;
            d.Message = 'Optimization Running';
            app.ProgressEditField.Value = 'Optimization Running';
            
            %% calling optimization functions
            if app.LongrunCheckBox.Value == 0
                if netsize == 5
                    
                    if strcmp(app.cooperationDropDown.Value,'1')
                        coop =1; 
                        if app.UseFixedFeedinTariffCheckBox.Value ==0
                            [fv,fc,fmon,fcar,fdep] = short5s(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        else
                            Db = D;
                            Ds = app.FITEditField.Value*ones(T,1);
                            [fv,fc,fmon,fcar,fdep] = short5prs(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        end
                    elseif strcmp(app.cooperationDropDown.Value,'2')
                        coop=2;
                        if app.UseFixedFeedinTariffCheckBox.Value ==0
                            [fv,fc,fmon,fcar,fdep] = short5s(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        else
                            Db = D;
                            Ds = app.FITEditField.Value*ones(T,1);
                            [fv,fc,fmon,fcar,fdep] = short5prs(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        end
                    elseif strcmp(app.cooperationDropDown.Value,'3')
                        disp('3 no available');
                    elseif strcmp(app.cooperationDropDown.Value,'all')
                        coop =5;
                        if app.UseFixedFeedinTariffCheckBox.Value ==0
                            [fv,fc,fmon,fcar,fdep] = short5s(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        else
                            Db = D;
                            Ds = app.FITEditField.Value*ones(T,1);
                            [fv,fc,fmon,fcar,fdep] = short5prs(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        end
                    end
                    
                    
                    
                elseif netsize == 6
                    
                    if strcmp(app.cooperationDropDown.Value,'1')
                        coop =1;
                        if app.UseFixedFeedinTariffCheckBox.Value ==0
                            [fv,fc,fmon,fcar,fdep] = short6s(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        else
                            Db = D;
                            Ds = app.FITEditField.Value*ones(T,1);
                            [fv,fc,fmon,fcar,fdep] = short6prs(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        end
                    elseif strcmp(app.cooperationDropDown.Value,'2')
                        coop=2;
                        if app.UseFixedFeedinTariffCheckBox.Value ==0
                            [fv,fc,fmon,fcar,fdep] = short6s(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        else
                            Db = D;
                            Ds = app.FITEditField.Value*ones(T,1);
                            [fv,fc,fmon,fcar,fdep] = short6prs(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        end
                    elseif strcmp(app.cooperationDropDown.Value,'3')
                        coop=3; 
                        if app.UseFixedFeedinTariffCheckBox.Value ==0
                            [fv,fc,fmon,fcar,fdep] = short6s(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        else
                            Db = D;
                            Ds = app.FITEditField.Value*ones(T,1);
                            [fv,fc,fmon,fcar,fdep] = short6prs(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        end
                    elseif strcmp(app.cooperationDropDown.Value,'all')
                        coop =6; 
                        if app.UseFixedFeedinTariffCheckBox.Value ==0
                            [fv,fc,fmon,fcar,fdep] = short6s(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        else
                            Db = D;
                            Ds = app.FITEditField.Value*ones(T,1);
                            [fv,fc,fmon,fcar,fdep] = short6prs(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        end
                    end
                end
                
                % update global varibales
                app.fva = fv;
                app.fmo=fmon;
                app.fca=fcar;
                app.fde=fdep;
                
                disp(fmon)
                disp(fcar)
                disp(fdep)
                
                app.FvalEditField.Value = fv;
                
                
                d.Value = .9;
                d.Message = 'Optization Complete';
                app.ProgressEditField.Value = 'Optization Complete';
                
                if netsize == 5
                    x=fc;
                    % assign storage values
                    Ebat1 = x(T+1:2*T-1);
                    Ebat2 = x(T+1+mo:2*T-1+mo);
                    Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                    Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                    Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                    
                    cla(app.UIAxes) % clear axis
                    hold(app.UIAxes,'on')
                    
                    %plot SOC
                    plot(app.UIAxes,Ebat1);
                    plot(app.UIAxes,Ebat2);
                    plot(app.UIAxes,Ebat3);
                    plot(app.UIAxes,Ebat4);
                    plot(app.UIAxes,Ebat5);
                    
                    % global store values
                    app.Ebat51.Value = Ebat1;
                    app.Ebat52.Value = Ebat2;
                    app.Ebat53.Value = Ebat3;
                    app.Ebat54.Value = Ebat4;
                    app.Ebat55.Value = Ebat5;
                    
                    
                    
                    
                elseif netsize == 6
                    
                    x=fc;
                    % assign SOC
                    Ebat1 = x(T+1:2*T-1);
                    Ebat2 = x(T+1+mo:2*T-1+mo);
                    Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                    Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                    Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                    Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                    
                    
                    cla(app.UIAxes) % clear axis
                    hold(app.UIAxes,'on')
                    
                    % plot SOC 
                    plot(app.UIAxes,Ebat1);
                    plot(app.UIAxes,Ebat2);
                    plot(app.UIAxes,Ebat3);
                    plot(app.UIAxes,Ebat4);
                    plot(app.UIAxes,Ebat5);
                    plot(app.UIAxes,Ebat6);
                    
                    % global store values
                    
                    app.Ebat61.Value = Ebat1;
                    app.Ebat62.Value = Ebat2;
                    app.Ebat63.Value = Ebat3;
                    app.Ebat64.Value = Ebat4;
                    app.Ebat65.Value = Ebat5;
                    app.Ebat66.Value = Ebat6;
                    
                end
                d.Value = 0.95;
                d.Message = 'finished';
                
                
                raw = sum(sum((avda-avga).*D)); % raw cost
                
                
                %global storage values
                app.fra=raw; 
                
                app.RawcostEditField.Value = raw;
                app.fmonEditField.Value=fmon;
                app.fcarEditField.Value=fcar;
                app.fdepEditField.Value=fdep;
                
                toc;
                app.RuntimeEditField.Value = toc; % runtime
                
                
                %start of long run code
            else
                
                if netsize == 5
                    
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0  % using date dependant prices
                        coop =1;
                        [fv,fc,fmon,fcar,fdep] = short5s(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        app.fva = fv;
                        app.fmo=fmon;
                        app.fca=fcar;
                        app.fde=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        
                        x=fc;
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        
                        app.Ebat511.Value = Ebat1;
                        app.Ebat512.Value = Ebat2;
                        app.Ebat513.Value = Ebat3;
                        app.Ebat514.Value = Ebat4;
                        app.Ebat515.Value = Ebat5;
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                    else
                        coop=1;
                        Db = D; % priced feed in tariff
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short5prs(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        app.fva = fv;
                        app.fmo=fmon;
                        app.fca=fcar;
                        app.fde=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        
                        x=fc;
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        
                        app.Ebat511.Value = Ebat1;
                        app.Ebat512.Value = Ebat2;
                        app.Ebat513.Value = Ebat3;
                        app.Ebat514.Value = Ebat4;
                        app.Ebat515.Value = Ebat5;
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                    end
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop =2;
                        [fv,fc,fmon,fcar,fdep] = short5s(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        app.fva2 = fv;
                        app.fmo2=fmon;
                        app.fca2=fcar;
                        app.fde2=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        
                        x=fc;
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        
                        app.Ebat521.Value = Ebat1;
                        app.Ebat522.Value = Ebat2;
                        app.Ebat523.Value = Ebat3;
                        app.Ebat524.Value = Ebat4;
                        app.Ebat525.Value = Ebat5;
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                    else
                        coop=2;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short5prs(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        app.fva2 = fv;
                        app.fmo2=fmon;
                        app.fca2=fcar;
                        app.fde2=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        
                        x=fc;
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        
                        app.Ebat521.Value = Ebat1;
                        app.Ebat522.Value = Ebat2;
                        app.Ebat523.Value = Ebat3;
                        app.Ebat524.Value = Ebat4;
                        app.Ebat525.Value = Ebat5;
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                    end
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop=5;
                        [fv,fc,fmon,fcar,fdep] = short5s(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        app.fva3 = fv;
                        app.fmo3=fmon;
                        app.fca3=fcar;
                        app.fde3=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        x=fc;
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        
                        app.Ebat551.Value = Ebat1;
                        app.Ebat552.Value = Ebat2;
                        app.Ebat553.Value = Ebat3;
                        app.Ebat554.Value = Ebat4;
                        app.Ebat555.Value = Ebat5;
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                    else
                        coop=5;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short5prs(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        app.fva3 = fv;
                        app.fmo3=fmon;
                        app.fca3=fcar;
                        app.fde3=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        x=fc;
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        
                        app.Ebat551.Value = Ebat1;
                        app.Ebat552.Value = Ebat2;
                        app.Ebat553.Value = Ebat3;
                        app.Ebat554.Value = Ebat4;
                        app.Ebat555.Value = Ebat5;
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                    end
                    app.fva4 = 0;
                    app.fmo4=0;
                    app.fca4=0;
                    app.fde4=0;
                    
                    
                    
                    app.FvalEditField.Value = fv;
                    
                    
                    
                    
                elseif netsize == 6
                    
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop=1;
                        [fv,fc,fmon,fcar,fdep] = short6s(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        app.fva = fv;
                        app.fmo=fmon;
                        app.fca=fcar;
                        app.fde=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.Ebat611.Value = Ebat1;
                        app.Ebat612.Value = Ebat2;
                        app.Ebat613.Value = Ebat3;
                        app.Ebat614.Value = Ebat4;
                        app.Ebat615.Value = Ebat5;
                        app.Ebat616.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    else
                        coop=1;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short6prs(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.fva = fv;
                        app.fmo=fmon;
                        app.fca=fcar;
                        app.fde=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.Ebat611.Value = Ebat1;
                        app.Ebat612.Value = Ebat2;
                        app.Ebat613.Value = Ebat3;
                        app.Ebat614.Value = Ebat4;
                        app.Ebat615.Value = Ebat5;
                        app.Ebat616.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    end
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop=2;
                        [fv,fc,fmon,fcar,fdep] = short6s(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.fva2 = fv;
                        app.fmo2=fmon;
                        app.fca2=fcar;
                        app.fde2=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.Ebat621.Value = Ebat1;
                        app.Ebat622.Value = Ebat2;
                        app.Ebat623.Value = Ebat3;
                        app.Ebat624.Value = Ebat4;
                        app.Ebat625.Value = Ebat5;
                        app.Ebat626.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    else
                        coop =2;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short6prs(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.fva2 = fv;
                        app.fmo2=fmon;
                        app.fca2=fcar;
                        app.fde2=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.Ebat621.Value = Ebat1;
                        app.Ebat622.Value = Ebat2;
                        app.Ebat623.Value = Ebat3;
                        app.Ebat624.Value = Ebat4;
                        app.Ebat625.Value = Ebat5;
                        app.Ebat626.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                        
                    end
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop=3;
                        [fv,fc,fmon,fcar,fdep] = short6s(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.fva3 = fv;
                        app.fmo3=fmon;
                        app.fca3=fcar;
                        app.fde3=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.Ebat631.Value = Ebat1;
                        app.Ebat632.Value = Ebat2;
                        app.Ebat633.Value = Ebat3;
                        app.Ebat634.Value = Ebat4;
                        app.Ebat635.Value = Ebat5;
                        app.Ebat636.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    else
                        coop=3;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short6prs(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.fva3 = fv;
                        app.fmo3=fmon;
                        app.fca3=fcar;
                        app.fde3=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.Ebat631.Value = Ebat1;
                        app.Ebat632.Value = Ebat2;
                        app.Ebat633.Value = Ebat3;
                        app.Ebat634.Value = Ebat4;
                        app.Ebat635.Value = Ebat5;
                        app.Ebat636.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    end
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop=6;
                        [fv,fc,fmon,fcar,fdep] = short6s(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.fva4 = fv;
                        app.fmo4=fmon;
                        app.fca4=fcar;
                        app.fde4=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.Ebat661.Value = Ebat1;
                        app.Ebat662.Value = Ebat2;
                        app.Ebat663.Value = Ebat3;
                        app.Ebat664.Value = Ebat4;
                        app.Ebat665.Value = Ebat5;
                        app.Ebat666.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    else
                        coop=6;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short6prs(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.fva4 = fv;
                        app.fmo4=fmon;
                        app.fca4=fcar;
                        app.fde4=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.FvalEditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.Ebat661.Value = Ebat1;
                        app.Ebat662.Value = Ebat2;
                        app.Ebat663.Value = Ebat3;
                        app.Ebat664.Value = Ebat4;
                        app.Ebat665.Value = Ebat5;
                        app.Ebat666.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    end
                end
            end
            
            
            
            
            app.FvalEditField.Value = fv;
            
            
            
            
            
            raw = sum(sum((avda-avga).*D)); % raw cost
            
            %global store values
            app.fra=raw;
            
            app.RawcostEditField.Value = raw;
            app.fmonEditField.Value=fmon;
            app.fcarEditField.Value=fcar;
            app.fdepEditField.Value=fdep;
            
            
            toc;
            app.RuntimeEditField.Value = toc;
            
            % run comparative 0 weighted moo
            if app.LongrunCheckBox.Value == 1 && app.comp0mooCheckBox.Value == 1
                weight = 0;
                if netsize == 5
                    
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop=1;
                        [fv,fc,fmon,fcar,fdep] = short5s(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        app.cfva = fv;
                        app.cfmo=fmon;
                        app.cfca=fcar;
                        app.cfde=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        
                        x=fc;
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        
                        app.cEbat511.Value = Ebat1;
                        app.cEbat512.Value = Ebat2;
                        app.cEbat513.Value = Ebat3;
                        app.cEbat514.Value = Ebat4;
                        app.cEbat515.Value = Ebat5;
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                    else
                        coop=1;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short5prs(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        app.cfva = fv;
                        app.cfmo=fmon;
                        app.cfca=fcar;
                        app.cfde=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        
                        x=fc;
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        
                        app.cEbat511.Value = Ebat1;
                        app.cEbat512.Value = Ebat2;
                        app.cEbat513.Value = Ebat3;
                        app.cEbat514.Value = Ebat4;
                        app.cEbat515.Value = Ebat5;
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                    end
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop=2;
                        [fv,fc,fmon,fcar,fdep] = short5s(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        app.cfva2 = fv;
                        app.cfmo2=fmon;
                        app.cfca2=fcar;
                        app.cfde2=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        
                        x=fc;
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        
                        app.cEbat521.Value = Ebat1;
                        app.cEbat522.Value = Ebat2;
                        app.cEbat523.Value = Ebat3;
                        app.cEbat524.Value = Ebat4;
                        app.cEbat525.Value = Ebat5;
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                    else
                        coop=2;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short5prs(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        app.cfva2 = fv;
                        app.cfmo2=fmon;
                        app.cfca2=fcar;
                        app.cfde2=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        
                        x=fc;
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        
                        app.cEbat521.Value = Ebat1;
                        app.cEbat522.Value = Ebat2;
                        app.cEbat523.Value = Ebat3;
                        app.cEbat524.Value = Ebat4;
                        app.cEbat525.Value = Ebat5;
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                    end
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop =5;
                        [fv,fc,fmon,fcar,fdep] = short5s(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        app.cfva3 = fv;
                        app.cfmo3=fmon;
                        app.cfca3=fcar;
                        app.cfde3=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        x=fc;
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        
                        app.cEbat551.Value = Ebat1;
                        app.cEbat552.Value = Ebat2;
                        app.cEbat553.Value = Ebat3;
                        app.cEbat554.Value = Ebat4;
                        app.cEbat555.Value = Ebat5;
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                    else
                        coop=5;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short5prs(avda(:,1),avga(:,1),pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda(:,1:netsize),avga(:,1:netsize),ba1,ba2,ba3,ba4,ba5);
                        app.cfva3 = fv;
                        app.cfmo3=fmon;
                        app.cfca3=fcar;
                        app.cfde3=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        x=fc;
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        
                        app.cEbat551.Value = Ebat1;
                        app.cEbat552.Value = Ebat2;
                        app.cEbat553.Value = Ebat3;
                        app.cEbat554.Value = Ebat4;
                        app.cEbat555.Value = Ebat5;
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                    end
                    app.cfva4 = 0;
                    app.cfmo4=0;
                    app.cfca4=0;
                    app.cfde4=0;
                    
                    
                    
                    app.EditField.Value = fv;
                    
                    
                    
                    
                elseif netsize == 6
                    
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop=1;
                        [fv,fc,fmon,fcar,fdep] = short6s(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        app.cfva = fv;
                        app.cfmo=fmon;
                        app.cfca=fcar;
                        app.cfde=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.cEbat611.Value = Ebat1;
                        app.cEbat612.Value = Ebat2;
                        app.cEbat613.Value = Ebat3;
                        app.cEbat614.Value = Ebat4;
                        app.cEbat615.Value = Ebat5;
                        app.cEbat616.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    else
                        coop=1;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short6prs(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.cfva = fv;
                        app.cfmo=fmon;
                        app.cfca=fcar;
                        app.cfde=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.cEbat611.Value = Ebat1;
                        app.cEbat612.Value = Ebat2;
                        app.cEbat613.Value = Ebat3;
                        app.cEbat614.Value = Ebat4;
                        app.cEbat615.Value = Ebat5;
                        app.cEbat616.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    end
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop=2;
                        [fv,fc,fmon,fcar,fdep] = short6s(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.cfva2 = fv;
                        app.cfmo2=fmon;
                        app.cfca2=fcar;
                        app.cfde2=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.cEbat621.Value = Ebat1;
                        app.cEbat622.Value = Ebat2;
                        app.cEbat623.Value = Ebat3;
                        app.cEbat624.Value = Ebat4;
                        app.cEbat625.Value = Ebat5;
                        app.cEbat626.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    else
                        coop=2;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short6prs(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.cfva2 = fv;
                        app.cfmo2=fmon;
                        app.cfca2=fcar;
                        app.cfde2=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.cEbat621.Value = Ebat1;
                        app.cEbat622.Value = Ebat2;
                        app.cEbat623.Value = Ebat3;
                        app.cEbat624.Value = Ebat4;
                        app.cEbat625.Value = Ebat5;
                        app.cEbat626.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                        
                    end
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop=3;
                        [fv,fc,fmon,fcar,fdep] = short6s(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.cfva3 = fv;
                        app.cfmo3=fmon;
                        app.cfca3=fcar;
                        app.cfde3=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.cEbat631.Value = Ebat1;
                        app.cEbat632.Value = Ebat2;
                        app.cEbat633.Value = Ebat3;
                        app.cEbat634.Value = Ebat4;
                        app.cEbat635.Value = Ebat5;
                        app.cEbat636.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    else
                        coop=3;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short6prs(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.cfva3 = fv;
                        app.cfmo3=fmon;
                        app.cfca3=fcar;
                        app.cfde3=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.cEbat631.Value = Ebat1;
                        app.cEbat632.Value = Ebat2;
                        app.cEbat633.Value = Ebat3;
                        app.cEbat634.Value = Ebat4;
                        app.cEbat635.Value = Ebat5;
                        app.cEbat636.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    end
                    
                    if app.UseFixedFeedinTariffCheckBox.Value ==0
                        coop=6;
                        [fv,fc,fmon,fcar,fdep] = short6s(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,D,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.cfva4 = fv;
                        app.cfmo4=fmon;
                        app.cfca4=fcar;
                        app.cfde4=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.cEbat661.Value = Ebat1;
                        app.cEbat662.Value = Ebat2;
                        app.cEbat663.Value = Ebat3;
                        app.cEbat664.Value = Ebat4;
                        app.cEbat665.Value = Ebat5;
                        app.cEbat666.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    else
                        coop=6;
                        Db = D;
                        Ds = app.FITEditField.Value*ones(T,1);
                        [fv,fc,fmon,fcar,fdep] = short6prs(Ad,Cs,pdis,pcha,batcap,eff,pgrid,Cb,depr,start,batmin,T,outputcarbon,Db,Ds,weight,avp,x0,A,B,Aeq,Beq,options,coop,trials,A2,A3eq,avda,avga,ba1,ba2,ba3,ba4,ba5,ba6);
                        
                        app.cfva4 = fv;
                        app.cfmo4=fmon;
                        app.cfca4=fcar;
                        app.cfde4=fdep;
                        
                        disp(fmon)
                        disp(fcar)
                        disp(fdep)
                        disp(fv)
                        
                        app.EditField.Value = fv;
                        
                        x=fc;
                        
                        Ebat1 = x(T+1:2*T-1);
                        Ebat2 = x(T+1+mo:2*T-1+mo);
                        Ebat3 = x(T+1+mo*2:2*T-1+mo*2);
                        Ebat4 = x(T+1+mo*3:2*T-1+mo*3);
                        Ebat5 = x(T+1+mo*4:2*T-1+mo*4);
                        Ebat6 = x(T+1+mo*5:2*T-1+mo*5);
                        
                        app.cEbat661.Value = Ebat1;
                        app.cEbat662.Value = Ebat2;
                        app.cEbat663.Value = Ebat3;
                        app.cEbat664.Value = Ebat4;
                        app.cEbat665.Value = Ebat5;
                        app.cEbat666.Value = Ebat6;
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,Ebat1);
                        plot(app.UIAxes,Ebat2);
                        plot(app.UIAxes,Ebat3);
                        plot(app.UIAxes,Ebat4);
                        plot(app.UIAxes,Ebat5);
                        plot(app.UIAxes,Ebat6);
                    end
                end
            end
            %global store values
            app.EditField_2.Value = raw;
            app.EditField_3.Value=fmon;
            app.EditField_4.Value=fcar;
            app.EditField_5.Value=fdep;
            
            % update progress bar
            d.Value = .9;
            d.Message = 'Optization Complete';
            app.ProgressEditField.Value = 'Optization Complete';
            
            
            d.Value = 0.95;
            d.Message = 'finished';
            
            
            toc;
            app.RuntimeEditField.Value = toc; % runtime update
            
            
        end

        % Button pushed function: UpdateresultsButton
        function UpdateresultsButtonPushed(app, event)
            
            if app.LongrunCheckBox.Value == 0
                app.RawcostEditField.Value = app.fra;
                app.fmonEditField.Value=app.fmo;
                app.fcarEditField.Value=app.fca;
                app.fdepEditField.Value=app.fde;
                app.FvalEditField.Value=app.fva;
                
                
            else
                % displaying stored values and plots
                if app.nets == 5
                    if strcmp(app.LongrunresultsoptionsDropDown.Value,'Option 1')
                        
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        
                        
                        plot(app.UIAxes,app.Ebat511.Value);
                        plot(app.UIAxes,app.Ebat512.Value);
                        plot(app.UIAxes,app.Ebat513.Value);
                        plot(app.UIAxes,app.Ebat514.Value);
                        plot(app.UIAxes,app.Ebat515.Value);
                        
                        app.RawcostEditField.Value = app.fra;
                        app.fmonEditField.Value=app.fmo;
                        app.fcarEditField.Value=app.fca;
                        app.fdepEditField.Value=app.fde;
                        app.FvalEditField.Value=app.fva;
                        
                        if app.comp0mooCheckBox.Value==1
                            
                            app.EditField.Value=app.cfva;
                            app.EditField_2.Value = app.fra;
                            app.EditField_3.Value=app.cfmo;
                            app.EditField_4.Value=app.cfca;
                            app.EditField_5.Value=app.cfde;
                            
                        end
                        
                        
                    elseif strcmp(app.LongrunresultsoptionsDropDown.Value,'Option 2')
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,app.Ebat521.Value);
                        plot(app.UIAxes,app.Ebat522.Value);
                        plot(app.UIAxes,app.Ebat523.Value);
                        plot(app.UIAxes,app.Ebat524.Value);
                        plot(app.UIAxes,app.Ebat525.Value);
                        
                        app.RawcostEditField.Value = app.fra;
                        app.fmonEditField.Value=app.fmo2;
                        app.fcarEditField.Value=app.fca2;
                        app.fdepEditField.Value=app.fde2;
                        app.FvalEditField.Value=app.fva2;
                        
                        if app.comp0mooCheckBox.Value==1
                            
                            app.EditField.Value=app.cfva2;
                            app.EditField_2.Value = app.fra;
                            app.EditField_3.Value=app.cfmo2;
                            app.EditField_4.Value=app.cfca2;
                            app.EditField_5.Value=app.cfde2;
                            
                        end
                        
                    elseif strcmp(app.LongrunresultsoptionsDropDown.Value,'Option 3')
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,app.Ebat551.Value);
                        plot(app.UIAxes,app.Ebat552.Value);
                        plot(app.UIAxes,app.Ebat553.Value);
                        plot(app.UIAxes,app.Ebat554.Value);
                        plot(app.UIAxes,app.Ebat555.Value);
                        
                        app.RawcostEditField.Value = app.fra;
                        app.fmonEditField.Value=app.fmo3;
                        app.fcarEditField.Value=app.fca3;
                        app.fdepEditField.Value=app.fde3;
                        app.FvalEditField.Value=app.fva3;
                        
                        if app.comp0mooCheckBox.Value==1
                            
                            app.EditField.Value=app.cfva3;
                            app.EditField_2.Value = app.fra;
                            app.EditField_3.Value=app.cfmo3;
                            app.EditField_4.Value=app.cfca3;
                            app.EditField_5.Value=app.cfde3;
                            
                        end
                        
                    else
                        disp('5 house only have 3 set ups')
                    end
                    
                    
                elseif app.nets == 6
                    
                    if strcmp(app.LongrunresultsoptionsDropDown.Value,'Option 1')
                        
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,app.Ebat611.Value);
                        plot(app.UIAxes,app.Ebat612.Value);
                        plot(app.UIAxes,app.Ebat613.Value);
                        plot(app.UIAxes,app.Ebat614.Value);
                        plot(app.UIAxes,app.Ebat615.Value);
                        plot(app.UIAxes,app.Ebat616.Value);
                        
                        app.RawcostEditField.Value = app.fra;
                        app.fmonEditField.Value=app.fmo;
                        app.fcarEditField.Value=app.fca;
                        app.fdepEditField.Value=app.fde;
                        app.FvalEditField.Value=app.fva;
                        
                        if app.comp0mooCheckBox.Value==1
                            
                            app.EditField.Value=app.cfva;
                            app.EditField_2.Value = app.fra;
                            app.EditField_3.Value=app.cfmo;
                            app.EditField_4.Value=app.cfca;
                            app.EditField_5.Value=app.cfde;
                            
                        end
                        
                        
                    elseif strcmp(app.LongrunresultsoptionsDropDown.Value,'Option 2')
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,app.Ebat621.Value);
                        plot(app.UIAxes,app.Ebat622.Value);
                        plot(app.UIAxes,app.Ebat623.Value);
                        plot(app.UIAxes,app.Ebat624.Value);
                        plot(app.UIAxes,app.Ebat625.Value);
                        plot(app.UIAxes,app.Ebat626.Value);
                        
                        app.RawcostEditField.Value = app.fra;
                        app.fmonEditField.Value=app.fmo2;
                        app.fcarEditField.Value=app.fca2;
                        app.fdepEditField.Value=app.fde2;
                        app.FvalEditField.Value=app.fva2;
                        
                        if app.comp0mooCheckBox.Value==1
                            
                            app.EditField.Value=app.cfva2;
                            app.EditField_2.Value = app.fra;
                            app.EditField_3.Value=app.cfmo2;
                            app.EditField_4.Value=app.cfca2;
                            app.EditField_5.Value=app.cfde2;
                            
                        end
                        
                    elseif strcmp(app.LongrunresultsoptionsDropDown.Value,'Option 3')
                        
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,app.Ebat631.Value);
                        plot(app.UIAxes,app.Ebat632.Value);
                        plot(app.UIAxes,app.Ebat633.Value);
                        plot(app.UIAxes,app.Ebat634.Value);
                        plot(app.UIAxes,app.Ebat635.Value);
                        plot(app.UIAxes,app.Ebat636.Value);
                        
                        app.RawcostEditField.Value = app.fra;
                        app.fmonEditField.Value=app.fmo3;
                        app.fcarEditField.Value=app.fca3;
                        app.fdepEditField.Value=app.fde3;
                        app.FvalEditField.Value=app.fva3;
                        
                        if app.comp0mooCheckBox.Value==1
                            
                            app.EditField.Value=app.cfva3;
                            app.EditField_2.Value = app.fra;
                            app.EditField_3.Value=app.cfmo3;
                            app.EditField_4.Value=app.cfca3;
                            app.EditField_5.Value=app.cfde3;
                            
                        end
                    else
                        cla(app.UIAxes)
                        hold(app.UIAxes,'on')
                        
                        plot(app.UIAxes,app.Ebat661.Value);
                        plot(app.UIAxes,app.Ebat662.Value);
                        plot(app.UIAxes,app.Ebat663.Value);
                        plot(app.UIAxes,app.Ebat664.Value);
                        plot(app.UIAxes,app.Ebat665.Value);
                        plot(app.UIAxes,app.Ebat666.Value);
                        
                        app.RawcostEditField.Value = app.fra;
                        app.fmonEditField.Value=app.fmo4;
                        app.fcarEditField.Value=app.fca4;
                        app.fdepEditField.Value=app.fde4;
                        app.FvalEditField.Value=app.fva4;
                        
                        if app.comp0mooCheckBox.Value==1
                            
                            app.EditField.Value=app.cfva4;
                            app.EditField_2.Value = app.fra;
                            app.EditField_3.Value=app.cfmo4;
                            app.EditField_4.Value=app.cfca4;
                            app.EditField_5.Value=app.cfde4;
                            
                        end
                        
                    end
                    
                end
            end
        end

        % Button pushed function: StoreButton
        function StoreButtonPushed(app, event)
%             assignin('base','Ebat511',app.Ebat51.Value);
%             % send value to workstace for testing
            out = datapro(app.fmo,app.fmo2,app.fmo3,app.fmo4,app.cfmo,app.cfmo2,app.cfmo3,app.cfmo4,app.fca,app.fca2,app.fca3,app.fca4,app.cfca,app.cfca2,app.cfca3,app.cfca4,app.fde,app.fde2,app.fde3,app.fde4,app.cfde,app.cfde2,app.cfde3,app.cfde4,app.fva,app.fva2,app.fva3,app.fva4,app.cfva,app.cfva2,app.cfva3,app.cfva4,app.EmissionsweightSlider.Value);
            disp(out)
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 734 554];
            app.UIFigure.Name = 'UI Figure';

            % Create NumberofUsersDropDownLabel
            app.NumberofUsersDropDownLabel = uilabel(app.UIFigure);
            app.NumberofUsersDropDownLabel.HorizontalAlignment = 'right';
            app.NumberofUsersDropDownLabel.Position = [71 520 96 22];
            app.NumberofUsersDropDownLabel.Text = 'Number of Users';

            % Create NumberofUsersDropDown
            app.NumberofUsersDropDown = uidropdown(app.UIFigure);
            app.NumberofUsersDropDown.Items = {'5', '6'};
            app.NumberofUsersDropDown.ValueChangedFcn = createCallbackFcn(app, @NumberofUsersDropDownValueChanged, true);
            app.NumberofUsersDropDown.Position = [182 520 100 22];
            app.NumberofUsersDropDown.Value = '5';

            % Create EmissionsdataDropDownLabel
            app.EmissionsdataDropDownLabel = uilabel(app.UIFigure);
            app.EmissionsdataDropDownLabel.HorizontalAlignment = 'right';
            app.EmissionsdataDropDownLabel.Position = [80 476 87 22];
            app.EmissionsdataDropDownLabel.Text = 'Emissions data';

            % Create EmissionsdataDropDown
            app.EmissionsdataDropDown = uidropdown(app.UIFigure);
            app.EmissionsdataDropDown.Items = {'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'};
            app.EmissionsdataDropDown.Position = [182 476 100 22];
            app.EmissionsdataDropDown.Value = 'January';

            % Create DatePickerLabel
            app.DatePickerLabel = uilabel(app.UIFigure);
            app.DatePickerLabel.HorizontalAlignment = 'right';
            app.DatePickerLabel.Position = [50 432 67 22];
            app.DatePickerLabel.Text = 'Date Picker';

            % Create DatePicker
            app.DatePicker = uidatepicker(app.UIFigure);
            app.DatePicker.Limits = [datetime([2017 1 1]) datetime([2017 12 31])];
            app.DatePicker.DisplayFormat = 'dd.MM.uuuu';
            app.DatePicker.Position = [132 432 150 22];
            app.DatePicker.Value = datetime([2017 1 13]);

            % Create EmissionsweightSliderLabel
            app.EmissionsweightSliderLabel = uilabel(app.UIFigure);
            app.EmissionsweightSliderLabel.HorizontalAlignment = 'right';
            app.EmissionsweightSliderLabel.Position = [7 344 98 22];
            app.EmissionsweightSliderLabel.Text = 'Emissions weight';

            % Create EmissionsweightSlider
            app.EmissionsweightSlider = uislider(app.UIFigure);
            app.EmissionsweightSlider.Limits = [0 10];
            app.EmissionsweightSlider.Position = [126 353 150 3];

            % Create BatterycapacityKWhEditFieldLabel
            app.BatterycapacityKWhEditFieldLabel = uilabel(app.UIFigure);
            app.BatterycapacityKWhEditFieldLabel.HorizontalAlignment = 'right';
            app.BatterycapacityKWhEditFieldLabel.Position = [47 279 120 22];
            app.BatterycapacityKWhEditFieldLabel.Text = 'Battery capacity KWh';

            % Create BatterycapacityKWhEditField
            app.BatterycapacityKWhEditField = uieditfield(app.UIFigure, 'numeric');
            app.BatterycapacityKWhEditField.Limits = [2 50];
            app.BatterycapacityKWhEditField.RoundFractionalValues = 'on';
            app.BatterycapacityKWhEditField.Position = [182 279 100 22];
            app.BatterycapacityKWhEditField.Value = 10;

            % Create StartSOCSliderLabel
            app.StartSOCSliderLabel = uilabel(app.UIFigure);
            app.StartSOCSliderLabel.HorizontalAlignment = 'right';
            app.StartSOCSliderLabel.Position = [45 235 60 22];
            app.StartSOCSliderLabel.Text = 'Start SOC';

            % Create StartSOCSlider
            app.StartSOCSlider = uislider(app.UIFigure);
            app.StartSOCSlider.Limits = [0 1];
            app.StartSOCSlider.Position = [126 244 150 3];
            app.StartSOCSlider.Value = 0.4;

            % Create BatteryminSliderLabel
            app.BatteryminSliderLabel = uilabel(app.UIFigure);
            app.BatteryminSliderLabel.HorizontalAlignment = 'right';
            app.BatteryminSliderLabel.Position = [39 171 66 22];
            app.BatteryminSliderLabel.Text = 'Battery min';

            % Create BatteryminSlider
            app.BatteryminSlider = uislider(app.UIFigure);
            app.BatteryminSlider.Limits = [0 1];
            app.BatteryminSlider.Position = [126 180 150 3];
            app.BatteryminSlider.Value = 0.1;

            % Create FvalEditFieldLabel
            app.FvalEditFieldLabel = uilabel(app.UIFigure);
            app.FvalEditFieldLabel.HorizontalAlignment = 'right';
            app.FvalEditFieldLabel.Position = [461 229 28 22];
            app.FvalEditFieldLabel.Text = 'Fval';

            % Create FvalEditField
            app.FvalEditField = uieditfield(app.UIFigure, 'numeric');
            app.FvalEditField.Editable = 'off';
            app.FvalEditField.Position = [504 229 100 22];

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Battery Storage')
            xlabel(app.UIAxes, 'Hours')
            ylabel(app.UIAxes, 'Energy Stored KWh')
            app.UIAxes.PlotBoxAspectRatio = [1 0.517985611510791 0.517985611510791];
            app.UIAxes.Position = [300 345 326 200];

            % Create RunButton
            app.RunButton = uibutton(app.UIFigure, 'push');
            app.RunButton.ButtonPushedFcn = createCallbackFcn(app, @RunButtonPushed, true);
            app.RunButton.Position = [504 266 100 22];
            app.RunButton.Text = 'Run';

            % Create DatePicker2Label
            app.DatePicker2Label = uilabel(app.UIFigure);
            app.DatePicker2Label.HorizontalAlignment = 'right';
            app.DatePicker2Label.Position = [43 388 74 22];
            app.DatePicker2Label.Text = 'Date Picker2';

            % Create DatePicker2
            app.DatePicker2 = uidatepicker(app.UIFigure);
            app.DatePicker2.Limits = [datetime([2017 1 1]) datetime([2017 12 31])];
            app.DatePicker2.DisplayFormat = 'dd.MM.uuuu';
            app.DatePicker2.Position = [132 388 150 22];
            app.DatePicker2.Value = datetime([2017 1 13]);

            % Create cooperationDropDownLabel
            app.cooperationDropDownLabel = uilabel(app.UIFigure);
            app.cooperationDropDownLabel.HorizontalAlignment = 'right';
            app.cooperationDropDownLabel.Position = [99 99 68 22];
            app.cooperationDropDownLabel.Text = 'cooperation';

            % Create cooperationDropDown
            app.cooperationDropDown = uidropdown(app.UIFigure);
            app.cooperationDropDown.Items = {'1', '2', '3', 'all'};
            app.cooperationDropDown.Position = [182 99 100 22];
            app.cooperationDropDown.Value = '1';

            % Create KeepdataSwitchLabel
            app.KeepdataSwitchLabel = uilabel(app.UIFigure);
            app.KeepdataSwitchLabel.HorizontalAlignment = 'center';
            app.KeepdataSwitchLabel.Position = [317 165 60 22];
            app.KeepdataSwitchLabel.Text = 'Keep data';

            % Create KeepdataSwitch
            app.KeepdataSwitch = uiswitch(app.UIFigure, 'slider');
            app.KeepdataSwitch.Position = [323 202 45 20];

            % Create RawcostEditFieldLabel
            app.RawcostEditFieldLabel = uilabel(app.UIFigure);
            app.RawcostEditFieldLabel.HorizontalAlignment = 'right';
            app.RawcostEditFieldLabel.Position = [436 195 55 22];
            app.RawcostEditFieldLabel.Text = 'Raw cost';

            % Create RawcostEditField
            app.RawcostEditField = uieditfield(app.UIFigure, 'numeric');
            app.RawcostEditField.Editable = 'off';
            app.RawcostEditField.Position = [504 196 100 22];

            % Create UseFixedFeedinTariffCheckBox
            app.UseFixedFeedinTariffCheckBox = uicheckbox(app.UIFigure);
            app.UseFixedFeedinTariffCheckBox.Text = {'Use Fixed '; 'Feed in Tariff'};
            app.UseFixedFeedinTariffCheckBox.Position = [301 224 100 68];

            % Create FITEditFieldLabel
            app.FITEditFieldLabel = uilabel(app.UIFigure);
            app.FITEditFieldLabel.HorizontalAlignment = 'right';
            app.FITEditFieldLabel.Position = [464 303 25 22];
            app.FITEditFieldLabel.Text = 'FIT';

            % Create FITEditField
            app.FITEditField = uieditfield(app.UIFigure, 'numeric');
            app.FITEditField.Position = [504 303 100 22];
            app.FITEditField.Value = 0.1;

            % Create OnedaytestpriceCheckBox
            app.OnedaytestpriceCheckBox = uicheckbox(app.UIFigure);
            app.OnedaytestpriceCheckBox.Text = {'One day'; 'test price'};
            app.OnedaytestpriceCheckBox.Position = [301 286 71 27];

            % Create fmonEditFieldLabel
            app.fmonEditFieldLabel = uilabel(app.UIFigure);
            app.fmonEditFieldLabel.HorizontalAlignment = 'right';
            app.fmonEditFieldLabel.Position = [457 163 32 22];
            app.fmonEditFieldLabel.Text = 'fmon';

            % Create fmonEditField
            app.fmonEditField = uieditfield(app.UIFigure, 'numeric');
            app.fmonEditField.Editable = 'off';
            app.fmonEditField.Position = [504 163 100 22];

            % Create fcarEditFieldLabel
            app.fcarEditFieldLabel = uilabel(app.UIFigure);
            app.fcarEditFieldLabel.HorizontalAlignment = 'right';
            app.fcarEditFieldLabel.Position = [464 131 25 22];
            app.fcarEditFieldLabel.Text = 'fcar';

            % Create fcarEditField
            app.fcarEditField = uieditfield(app.UIFigure, 'numeric');
            app.fcarEditField.Editable = 'off';
            app.fcarEditField.Position = [504 131 100 22];

            % Create fdepEditFieldLabel
            app.fdepEditFieldLabel = uilabel(app.UIFigure);
            app.fdepEditFieldLabel.HorizontalAlignment = 'right';
            app.fdepEditFieldLabel.Position = [460 99 29 22];
            app.fdepEditFieldLabel.Text = 'fdep';

            % Create fdepEditField
            app.fdepEditField = uieditfield(app.UIFigure, 'numeric');
            app.fdepEditField.Editable = 'off';
            app.fdepEditField.Position = [504 99 100 22];

            % Create UpdateresultsButton
            app.UpdateresultsButton = uibutton(app.UIFigure, 'push');
            app.UpdateresultsButton.ButtonPushedFcn = createCallbackFcn(app, @UpdateresultsButtonPushed, true);
            app.UpdateresultsButton.Position = [301 135 100 22];
            app.UpdateresultsButton.Text = 'Update results';

            % Create ProgressEditFieldLabel
            app.ProgressEditFieldLabel = uilabel(app.UIFigure);
            app.ProgressEditFieldLabel.HorizontalAlignment = 'right';
            app.ProgressEditFieldLabel.Position = [50 13 53 22];
            app.ProgressEditFieldLabel.Text = 'Progress';

            % Create ProgressEditField
            app.ProgressEditField = uieditfield(app.UIFigure, 'text');
            app.ProgressEditField.Position = [118 13 358 22];

            % Create LongrunresultsoptionsLabel
            app.LongrunresultsoptionsLabel = uilabel(app.UIFigure);
            app.LongrunresultsoptionsLabel.HorizontalAlignment = 'right';
            app.LongrunresultsoptionsLabel.Position = [313 94 86 27];
            app.LongrunresultsoptionsLabel.Text = {'Long run'; ' results options'};

            % Create LongrunresultsoptionsDropDown
            app.LongrunresultsoptionsDropDown = uidropdown(app.UIFigure);
            app.LongrunresultsoptionsDropDown.Position = [313 67 110 22];

            % Create LongrunCheckBox
            app.LongrunCheckBox = uicheckbox(app.UIFigure);
            app.LongrunCheckBox.Text = 'Long run';
            app.LongrunCheckBox.Position = [300 323 69 22];

            % Create RuntimeEditFieldLabel
            app.RuntimeEditFieldLabel = uilabel(app.UIFigure);
            app.RuntimeEditFieldLabel.HorizontalAlignment = 'right';
            app.RuntimeEditFieldLabel.Position = [436 67 53 22];
            app.RuntimeEditFieldLabel.Text = 'Run time';

            % Create RuntimeEditField
            app.RuntimeEditField = uieditfield(app.UIFigure, 'numeric');
            app.RuntimeEditField.Position = [504 67 100 22];

            % Create StoreButton
            app.StoreButton = uibutton(app.UIFigure, 'push');
            app.StoreButton.ButtonPushedFcn = createCallbackFcn(app, @StoreButtonPushed, true);
            app.StoreButton.Position = [182 67 100 22];
            app.StoreButton.Text = 'Store';

            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'numeric');
            app.EditField.Position = [625 230 100 22];

            % Create EditField_2
            app.EditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_2.Position = [625 195 100 22];

            % Create EditField_3
            app.EditField_3 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_3.Position = [625 165 100 22];

            % Create EditField_4
            app.EditField_4 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_4.Position = [625 135 100 22];

            % Create EditField_5
            app.EditField_5 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_5.Position = [625 99 100 22];

            % Create comp0mooCheckBox
            app.comp0mooCheckBox = uicheckbox(app.UIFigure);
            app.comp0mooCheckBox.Text = {'comp 0 moo'; ''};
            app.comp0mooCheckBox.Position = [625 266 88 22];

            % Create TrialPointsEditFieldLabel
            app.TrialPointsEditFieldLabel = uilabel(app.UIFigure);
            app.TrialPointsEditFieldLabel.HorizontalAlignment = 'right';
            app.TrialPointsEditFieldLabel.Position = [515 13 65 22];
            app.TrialPointsEditFieldLabel.Text = 'Trial Points';

            % Create TrialPointsEditField
            app.TrialPointsEditField = uieditfield(app.UIFigure, 'numeric');
            app.TrialPointsEditField.Limits = [300 5000];
            app.TrialPointsEditField.Position = [595 13 100 22];
            app.TrialPointsEditField.Value = 1000;

            % Create IDEditFieldLabel
            app.IDEditFieldLabel = uilabel(app.UIFigure);
            app.IDEditFieldLabel.HorizontalAlignment = 'right';
            app.IDEditFieldLabel.Position = [688 485 25 22];
            app.IDEditFieldLabel.Text = 'ID';

            % Create IDEditField
            app.IDEditField = uieditfield(app.UIFigure, 'text');
            app.IDEditField.Position = [630 453 100 22];
        end
    end

    methods (Access = public)

        % Construct app
        function app = shortnewseper

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
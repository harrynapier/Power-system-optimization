 function [avganew, avdanew] = validate(avga,avda,scheck,echeck)
    
    swapcheck=sum(sum(isnan(avga)))+ sum(sum(isnan(avda)));
    if swapcheck ~= 0
        disp('first avga')
        disp(avga)
        disp('first avda')
        disp(avda)
        
        
        [rowsg, columnsg] = find(isnan(avga));
        swapsg = unique(columnsg);
        
        [rowsd, columnsd] = find(isnan(avga));
        swapsd = unique(columnsd);
        
        swapsb = [swapsg swapsd];
        
        swaps = unique(swapsb);
        errors = length(swaps);
        
        while swapcheck ~= 0
            [T,avg2,avd2,avg,avd,avga2,avda2] = pecfunc2uni(scheck,echeck,errors);
            swapcheck = sum(sum(isnan(avga2)))+ sum(sum(isnan(avda2)));
            disp('fail')
        end
        avganew = avga;
        avdanew = avda; 
        for i = 1 : errors
            avganew(:,swaps(i)) = avga2(:,i);
            avdanew(:,swaps(i)) = avda2(:,i);
        end
        
        
        disp('final avga')
        disp(avganew)
        disp('final avda')
        disp(avdanew)
        
        
    else
        avganew = avga;
        avdanew = avda;
    end


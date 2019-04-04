function [T,avg2,avd2,avg,avd,avga,avda] = pecfunc2uni(scheck,echeck,netsize)
%% datamanager
% scheck = datetime(2017,1,1,0,0,0);
% echeck = datetime(2017,6,1,23,0,0);
% netsize=10;  % number of homes in local area cooparative
T=24;
export = newdetoctuni();

tim = table2array(export(:,1));
houseid = table2array(export(:,2));
de = table2array(export(:,3));   % Kw
genn = table2array(export(:,4)); % Kw

uniqueids = unique(houseid);

numberofhomes = length(uniqueids);
%netsize = 10; %number of homes being grouped up

rng('shuffle'); % seed random number generator with current time
randomchoices = randperm(numberofhomes, netsize);
randomids = uniqueids(randomchoices);
allchoices = [];%zeros(length(houseid),netsize);
lengths = [];
for n = 1:netsize
    choices= find(houseid==randomids(n));
    allchoices = [allchoices,choices'];
    lengths = [lengths,length(choices)];
end
endchoices = allchoices';
rahouseids=houseid(endchoices);
allchoicesgen = genn(endchoices);
allchoicestime = tim(endchoices);
allchoicesdem = de(endchoices);
len = length(allchoices);

for n = 1:netsize
    ends = sum(lengths(1:n));
    start = ends - lengths(n) +1;
%     figure
%     plot(allchoicestime(start:end),allchoicesgen(start:end));
end

%% making average gen at each time


starts = find(allchoicestime== scheck);
finishs = find(allchoicestime==echeck);
tilen = length(scheck:hours(1):echeck);
avg = NaN(tilen,1);
avd = NaN(tilen,1);
for t = scheck:hours(1):echeck
    inds = find(allchoicestime==t);
    spot = length(scheck:hours(1):t);
    avg(spot,1) = mean(allchoicesgen(inds));
    avd(spot,1) = mean(allchoicesdem(inds));
end


avd=abs(avd);
% plot(allchoicestime(starts:finishs),avg(1:end-1))
% hold on
% plot(allchoicestime(starts:finishs),avd(1:end-1))

%% make an average for a day 
avg2=NaN(24,1);
avd2=NaN(24,1);

for t = scheck:hours(1):echeck
    inds = find(hour(allchoicestime)==hour(t));
    spot = hour(t)+1;
    avg2(spot,1) = mean(allchoicesgen(inds));
    avd2(spot,1) = mean(allchoicesdem(inds));
end
%% make a set values for each home in a coop
avga = NaN(tilen,netsize);
avda = NaN(tilen,netsize);
for t = scheck:hours(1):echeck
    inds = find(allchoicestime==t);
    spot = length(scheck:hours(1):t);
    for i = 1 : length(inds)
    avga(spot,i) = allchoicesgen(inds(i));
    avda(spot,i) = allchoicesdem(inds(i));
    end
end
disp('pecan in');
end
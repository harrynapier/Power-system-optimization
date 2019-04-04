
function [avp,avp2,tilen] = pricefuncuni(scheck,echeck)
%% Import price data
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\Users\harry\Documents\work\4 year\20170101-20171231 ERCOT Real-time Price.xlsm
%    Worksheet: 20170101-20171231 ERCOT Real-ti
%
% Auto-generated by MATLAB on 20-Nov-2018 15:44:56

%% Setup the Import Options
opts = spreadsheetImportOptions("NumVariables", 3);

% Specify sheet and range
opts.Sheet = "20170101-20171231 ERCOT Real-ti";
opts.DataRange = "A2:C70073";

% Specify column names and types
opts.VariableNames = ["Date", "Price", "Zone"];
opts.VariableTypes = ["datetime", "double", "categorical"];
opts = setvaropts(opts, 3, "EmptyFieldRule", "auto");

% Import the data
ERCOTRealtimePrice = readtable("J:\dis\20170101-20171231 ERCOT Real-time Price.xlsm", opts, "UseExcel", false);


%% Clear temporary variables
clear opts


pricedate = table2array(ERCOTRealtimePrice(:,1));
pricev = table2array(ERCOTRealtimePrice(:,2));   % $/Mwh
pricezone = table2array(ERCOTRealtimePrice(:,3));

zone = 'LZ_SOUTH';

zoneinds = find(pricezone== zone);
%% getting the data for only the correct zone
pricevzo = pricev(zoneinds);       
pricedatezo = pricedate(zoneinds);
priceadjusted = pricevzo/1000; % convert to $/Kwh
%% finding the price for each hour across the selected period same as per pecfunc

% scheck = datetime(2017,1,1,0,0,0);
% echeck = datetime(2017,6,1,23,0,0);

starts = find(pricedatezo== scheck);
finishs = find(pricedatezo==echeck);
tilen = length(scheck:hours(1):echeck);
avp = NaN(tilen,1);

for t = scheck:hours(1):echeck
    inds = find(pricedatezo==t);
    spot = length(scheck:hours(1):t);
    avp(spot,1) = mean(priceadjusted(inds));
    
end

avp=abs(avp);

%% finding the average price for each hour  in a day across the selected period same as per pecfunc

avp2=NaN(24,1);


for t = scheck:hours(1):echeck
    inds = find(hour(pricedatezo)==hour(t));
    spot = hour(t)+1;
    avp2(spot,1) = mean(priceadjusted(inds));
    
end
disp('price in');
end

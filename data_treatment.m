%% Housekeeping %%
clear
clc

%% Importing data %%
load('data.mat');

%% Replacing boolean by 1 or 0 %%
temp=ones(length(stream),1);
for i=1:length(browser)
    if strcmp(connected(i),'false')==1
        temp(i,1)=0;
    end
end
connected=temp;
clear temp

%% Separating data for each ISP, each stream and each browser %%
% Very simple but ugly quick & dirty method, ideally creating functions would be much
% more elegant and clear.
% Browsers
l=1; k=1;
j=ones(1,9);
u=1; m=1; n=1;
Stream2ISP=zeros(1,3);
Stream3ISP=zeros(1,3);
Stream2Browser=zeros(1,2);
Stream3Browser=zeros(1,2);

for i=1:length(browser)
    if strcmp(browser(i),'Iron')==1
        Iron.isp(l,1)=isp(i);
        Iron.connected(l,1)=connected(i);
        Iron.stream(l,1)=stream(i);
        Iron.cdn(l,1)=cdn(i);
        Iron.p2p(l,1)=p2p(i);
        l=l+1;
    elseif strcmp(browser(i),'EarthWolf')==1
        EarthWolf.isp(k,1)=isp(i);
        EarthWolf.connected(k,1)=connected(i);
        EarthWolf.stream(k,1)=stream(i);
        EarthWolf.cdn(k,1)=cdn(i);
        EarthWolf.p2p(k,1)=p2p(i);
        k=k+1;
    end
% ISP
    if strcmp(isp(i),'Fro')==1
        Fro.browser(u,1)=browser(i);
        Fro.connected(u,1)=connected(i);
        Fro.stream(u,1)=stream(i);
        Fro.cdn(u,1)=cdn(i);
        Fro.p2p(u,1)=p2p(i);
        u=u+1;
    elseif strcmp(isp(i),'Arange')==1
        Arange.browser(m,1)=browser(i);
        Arange.connected(m,1)=connected(i);
        Arange.stream(m,1)=stream(i);
        Arange.cdn(m,1)=cdn(i);
        Arange.p2p(m,1)=p2p(i);
        m=m+1;
    else
        BTP.browser(n,1)=browser(i);
        BTP.connected(n,1)=connected(i);
        BTP.stream(n,1)=stream(i);
        BTP.cdn(n,1)=cdn(i);
        BTP.p2p(n,1)=p2p(i);
        n=n+1;
    end
% Stream
    switch stream(i)
        case 1
            stream1.browser(j(1),1)=browser(i);
            stream1.connected(j(1),1)=connected(i);
            stream1.isp(j(1),1)=isp(i);
            stream1.cdn(j(1),1)=cdn(i);
            stream1.p2p(j(1),1)=p2p(i);
            j(1)=j(1)+1;
        case 2
            stream2.browser(j(2),1)=browser(i);
            stream2.connected(j(2),1)=connected(i);
            stream2.isp(j(2),1)=isp(i);
            stream2.cdn(j(2),1)=cdn(i);
            stream2.p2p(j(2),1)=p2p(i);
            j(2)=j(2)+1;
            if strcmp(isp(i),'Arange')==1
                Stream2ISP(1)=Stream2ISP(1)+1;
            elseif strcmp(isp(i),'BTP')==1
                Stream2ISP(2)=Stream2ISP(2)+1;
            else
                Stream2ISP(3)=Stream2ISP(3)+1;
            end
            if strcmp(browser(i), 'EarthWolf')==1
                Stream2Browser(1)=Stream2Browser(1)+1;
            else
                Stream2Browser(2)=Stream2Browser(2)+1;
            end
        case 3
            stream3.browser(j(3),1)=browser(i);
            stream3.connected(j(3),1)=connected(i);
            stream3.isp(j(3),1)=isp(i);
            stream3.cdn(j(3),1)=cdn(i);
            stream3.p2p(j(3),1)=p2p(i);
            j(3)=j(3)+1;
            if strcmp(isp(i),'Arange')==1
                Stream3ISP(1)=Stream3ISP(1)+1;
            elseif strcmp(isp(i),'BTP')==1
                Stream3ISP(2)=Stream3ISP(2)+1;
            else
                Stream3ISP(3)=Stream3ISP(3)+1;
            end
             if strcmp(browser(i), 'EarthWolf')==1
                Stream3Browser(1)=Stream3Browser(1)+1;
            else
                Stream3Browser(2)=Stream3Browser(2)+1;
            end
        case 4
            stream4.browser(j(4),1)=browser(i);
            stream4.connected(j(4),1)=connected(i);
            stream4.isp(j(4),1)=isp(i);
            stream4.cdn(j(4),1)=cdn(i);
            stream4.p2p(j(4),1)=p2p(i);
            j(4)=j(4)+1;
        case 5
            stream5.browser(j(5),1)=browser(i);
            stream5.connected(j(5),1)=connected(i);
            stream5.isp(j(5),1)=isp(i);
            stream5.cdn(j(5),1)=cdn(i);
            stream5.p2p(j(5),1)=p2p(i);
            j(5)=j(5)+1;
        case 6
            stream6.browser(j(6),1)=browser(i);
            stream6.connected(j(6),1)=connected(i);
            stream6.isp(j(6),1)=isp(i);
            stream6.cdn(j(6),1)=cdn(i);
            stream6.p2p(j(6),1)=p2p(i);
            j(6)=j(6)+1;
        case 7
            stream7.browser(j(7),1)=browser(i);
            stream7.connected(j(7),1)=connected(i);
            stream7.isp(j(7),1)=isp(i);
            stream7.cdn(j(7),1)=cdn(i);
            stream7.p2p(j(7),1)=p2p(i);
            j(7)=j(7)+1;
        case 8
            stream8.browser(j(8),1)=browser(i);
            stream8.connected(j(8),1)=connected(i);
            stream8.isp(j(8),1)=isp(i);
            stream8.cdn(j(8),1)=cdn(i);
            stream8.p2p(j(8),1)=p2p(i);
            j(8)=j(8)+1;
        case 9
            stream9.browser(j(9),1)=browser(i);
            stream9.connected(j(9),1)=connected(i);
            stream9.isp(j(9),1)=isp(i);
            stream9.cdn(j(9),1)=cdn(i);
            stream9.p2p(j(9),1)=p2p(i);
            j(9)=j(9)+1;
    end
end
%% Average p2p to cdn ratio %%
% Once again, quick & dirty, could be done much mor efficiently by creating
% functions and even storing the variables in a single matrix and looping
% through it.
% Total average
AvgP2P=mean(p2p./(p2p+cdn));
% Browsers
AvgIron=mean(Iron.p2p./(Iron.p2p+Iron.cdn));
DevIron=AvgP2P-AvgIron;
AvgEW=mean(EarthWolf.p2p./(EarthWolf.p2p+EarthWolf.cdn));
DevEW=AvgP2P-AvgEW;
%ISPs
AvgArange=mean(Arange.p2p./(Arange.p2p+Arange.cdn));
DevArange=AvgP2P-AvgArange;
AvgBTP=mean(BTP.p2p./(BTP.p2p+BTP.cdn));
DevBTP=AvgP2P-AvgBTP;
AvgFro=mean(Fro.p2p./(Fro.p2p+Fro.cdn));
DevFro=AvgP2P-AvgFro;
% Streams
AvgStream1=mean(stream1.p2p./(stream1.p2p+stream1.cdn));
DevStream1=AvgP2P-AvgStream1;
AvgStream2=mean(stream2.p2p./(stream2.p2p+stream2.cdn));
DevStream2=AvgP2P-AvgStream2;
AvgStream3=mean(stream3.p2p./(stream3.p2p+stream3.cdn));
DevStream3=AvgP2P-AvgStream3;
AvgStream4=mean(stream4.p2p./(stream4.p2p+stream4.cdn));
DevStream4=AvgP2P-AvgStream4;
AvgStream5=mean(stream5.p2p./(stream5.p2p+stream5.cdn));
DevStream5=AvgP2P-AvgStream5;
AvgStream6=mean(stream6.p2p./(stream6.p2p+stream6.cdn));
DevStream6=AvgP2P-AvgStream6;
AvgStream7=mean(stream7.p2p./(stream7.p2p+stream7.cdn));
DevStream7=AvgP2P-AvgStream7;
AvgStream8=mean(stream8.p2p./(stream8.p2p+stream8.cdn));
DevStream8=AvgP2P-AvgStream8;
AvgStream9=mean(stream9.p2p./(stream9.p2p+stream9.cdn));
DevStream9=AvgP2P-AvgStream9;

%% Merit Index %%
% Normalised performance index defined as the ratio of the average p2p
% multiplied by the fraction of streamers not connected to the backend.
% Gives an idea of which parameter induces the most disparity.
Mb=zeros(1,2);
Mi=zeros(1,3);
Ms=zeros(1,9);
Mb(1)=AvgEW*(1-sum(EarthWolf.connected)/length(connected));
Mb(2)=AvgIron*(1-sum(Iron.connected)/length(connected));
Mi(1)=AvgArange*(1-sum(Arange.connected)/length(connected));
Mi(2)=AvgBTP*(1-sum(BTP.connected)/length(connected));
Mi(3)=AvgFro*(1-sum(Fro.connected)/length(connected));
Ms(1)=AvgStream1*(1-sum(stream1.connected)/length(connected));
Ms(2)=AvgStream2*(1-sum(stream2.connected)/length(connected));
Ms(3)=AvgStream3*(1-sum(stream3.connected)/length(connected));
Ms(4)=AvgStream4*(1-sum(stream4.connected)/length(connected));
Ms(5)=AvgStream5*(1-sum(stream5.connected)/length(connected));
Ms(6)=AvgStream6*(1-sum(stream6.connected)/length(connected));
Ms(7)=AvgStream7*(1-sum(stream7.connected)/length(connected));
Ms(8)=AvgStream8*(1-sum(stream8.connected)/length(connected));
Ms(9)=AvgStream9*(1-sum(stream9.connected)/length(connected));
Mb=Mb./max(Mb);
Mi=Mi./max(Mi);
Ms=Ms./max(Ms);
Stream2ISP=Stream2ISP./sum(Stream2ISP);
Stream3ISP=Stream3ISP./sum(Stream3ISP);
Stream2Browser=Stream2Browser./sum(Stream2Browser);
Stream3Browser=Stream3Browser./sum(Stream3Browser);
Viewers=[length(stream1.browser) length(stream2.browser) length(stream3.browser) length(stream4.browser) length(stream5.browser) length(stream6.browser) length(stream7.browser) length(stream8.browser) length(stream9.browser)];
BTPStreams=[sum(BTP.stream==1) sum(BTP.stream==2) sum(BTP.stream==3) sum(BTP.stream==4) sum(BTP.stream==5) sum(BTP.stream==6) sum(BTP.stream==7) sum(BTP.stream==8) sum(BTP.stream==9)];
BTPStreams=BTPStreams./max(BTPStreams);
ArangeStreams=[sum(Arange.stream==1) sum(Arange.stream==2) sum(Arange.stream==3) sum(Arange.stream==4) sum(Arange.stream==5) sum(Arange.stream==6) sum(Arange.stream==7) sum(Arange.stream==8) sum(Arange.stream==9)];
ArangeStreams=ArangeStreams./max(ArangeStreams);
FroStreams=[sum(Fro.stream==1) sum(Fro.stream==2) sum(Fro.stream==3) sum(Fro.stream==4) sum(Fro.stream==5) sum(Fro.stream==6) sum(Fro.stream==7) sum(Fro.stream==8) sum(Fro.stream==9)];
FroStreams=FroStreams./max(FroStreams);
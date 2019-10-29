% Set up an nSD file

nSD.device='ninjaNIRS';
nSD.lambda=[730, 850];
nSD.nLambdas=2;
nSD.nSrcs=8;
nSD.nDets=8;
nSD.spatialUnit='mm';
nSD.measList=[]; 
nSD.srcPos=[]; %[nSrcs,3]
nSD.detPos=[]; %[nDets,3]
nSD.nStates=1;
nSD.srcFreqMap=[];  %[nSrcs,nWavelengths,nStates]

d=27.5;
dd=2.5;
nSD.srcPos=[-dd,0,0;...
    d-dd,0,0;...
    2*d-dd,0,0;...
    3*d-dd,0,0;...    
    -dd,-d,0;...
    d-dd,-d,0;...
    2*d-dd,-d,0;...
    3*d-dd,-d,0;...    
    ];

nSD.detPos=[dd,0,0;...
    d+dd,0,0;...
    2*d+dd,0,0;...
    3*d+dd,0,0;...    
    +dd,-d,0;...
    d+dd,-d,0;...
    2*d+dd,-d,0;...
    3*d+dd,-d,0;...    
    ];

nSD.freqMap=cat(3,[1;3;5;1;-5;0;0;0],[2;4;6;2;-6;0;0;0]);

nSD.freqMap=cat(3,[1;3;0;5;-5;0;0;0],[2;4;0;6;-6;0;0;0]);

nSD.freqMap=cat(3,[1;3;5;1;-5;0;0;0],[2;4;6;2;-6;0;0;0]);


nSD.measList=[1,1,1,1;...
    2,2,1,1;...
    3,3,1,1;...
    4,4,1,1;...
    5,1,1,1;...
    1,2,1,1;...
    1,1,1,2;...       
    2,2,1,2;...    
    3,3,1,2;...    
    4,4,1,2;...    
    5,1,1,2;...
    1,2,1,2;...
    ]; %[source,detector,state,lambda]

nSD.measList=[1,5,1,1;...
    1,6,1,1;...
    2,6,1,1;...
    3,7,1,1;...
    4,8,1,1;...
    5,5,1,1;...    
    ]; %[source,detector,state,lambda]

nSD.measList=[1,5,1,1;...    
    2,6,1,1;...
    3,7,1,1;...
    4,8,1,1;...
    5,5,1,1;...    
    ]; %[source,detector,state,lambda]

N=size(nSD.measList,1);
nSD.measList=[nSD.measList;nSD.measList];

nSD.measList(N+1:end,4)=2;

% %the following two associate each source and detector with an optode
% nSD.Source2Optode=[1,2,3,4,5]';
% nSD.Detector2Optode=[5,6,7,8]';

% so, for example Detector2Optode(MeasList(n,2)) tells us what optode is
% receiving channel n. abs(freqMap(Source2Optode(MeasList(n,1)),s,m)) tells us
% the frequency for that channel at state 1 for wavelength m
save('mental_math.nsd','nSD','-mat')
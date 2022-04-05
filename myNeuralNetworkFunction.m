function [Y,Xf,Af] = myNeuralNetworkFunction(X,Xi,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 03-Apr-2022 10:48:25.
%
% [Y,Xf,Af] = myNeuralNetworkFunction(X,Xi,~) takes these arguments:
%
%   X = 2xTS cell, 2 inputs over TS timesteps
%   Each X{1,ts} = 4xQ matrix, input #1 at timestep ts.
%   Each X{2,ts} = 10xQ matrix, input #2 at timestep ts.
%
%   Xi = 2x2 cell 2, initial 2 input delay states.
%   Each Xi{1,ts} = 4xQ matrix, initial states for input #1.
%   Each Xi{2,ts} = 10xQ matrix, initial states for input #2.
%
%   Ai = 2x0 cell 2, initial 2 layer delay states.
%   Each Ai{1,ts} = 10xQ matrix, initial states for layer #1.
%   Each Ai{2,ts} = 10xQ matrix, initial states for layer #2.
%
% and returns:
%   Y = 1xTS cell of 2 outputs over TS timesteps.
%   Each Y{1,ts} = 10xQ matrix, output #1 at timestep ts.
%
%   Xf = 2x2 cell 2, final 2 input delay states.
%   Each Xf{1,ts} = 4xQ matrix, final states for input #1.
%   Each Xf{2,ts} = 10xQ matrix, final states for input #2.
%
%   Af = 2x0 cell 2, final 0 layer delay states.
%   Each Af{1ts} = 10xQ matrix, final states for layer #1.
%   Each Af{2ts} = 10xQ matrix, final states for layer #2.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [0;-4.44;0;0];
x1_step1.gain = [0.0246913580246914;0.257400257400257;0.00564971751412429;0.0119047619047619];
x1_step1.ymin = -1;

% Input 2
x2_step1.xoffset = [0;0;0;0;0;0;0;0;0;0];
x2_step1.gain = [2;2;2;2;2;2;2;2;2;2];
x2_step1.ymin = -1;

% Layer 1
b1 = [1.0801281717727395648;-1.3109126004464974891;0.94043359071482002243;-0.81368279707896140618;0.43294911658742113447;0.068784327532554534468;-0.29264096087120716749;0.78055572291726771361;-1.1279668888864309295;1.7338922757099712868];
IW1_1 = [-0.12247236387164020521 -0.32724598255041281725 -0.16442714495808471997 0.57264450002805056261 -0.060485688780750737625 0.22322716447306628629 -0.019058424240247777426 0.54601807057933582357;0.24246572292937407234 0.61044817882070490089 0.029426927959954295166 -0.3893125699092508385 -0.36272900222533577264 -0.23942306972545565613 -0.068311785910934952337 -0.072636666512103126303;0.087862715394548568382 -0.10868956786818624594 0.0033206883222020996613 -0.028863266432759278335 -0.0043095641812815202801 0.093685284602520735309 -0.038558146992500569317 0.085459281232959857788;0.32753399114338510589 -0.065166889413771203476 0.27781031371815179121 0.53810605087198792873 0.2696434774191964201 0.18087211570422026541 -0.20367457353888440696 0.10791682785607462081;-0.094321921767162794636 0.38491223036690941361 -0.013107624645180011858 0.4324022256446347634 0.014674708465267973304 -0.31185525012588249938 0.0075660192753139393976 0.35924302483212766646;0.21766330475063871974 0.016095522363542603267 0.033732702636458403167 0.46116176686153181885 -0.1841467185569863052 -0.063574757337699086546 -0.041177180544662406181 0.0034308485870010846895;0.36120168756955084444 -0.16936012860708668515 -0.03761077928321635705 -0.2152776354201784148 0.063784222288394157308 0.074419431451781384301 -0.006242489319285959154 -0.1292421417000215178;0.022449281190989153062 0.0043591732249231721422 -0.012387990238712145302 0.26181403269689113023 -0.0095257403322733507495 0.10425349583705242895 0.0096691436937527200368 0.0038250469223412991715;0.045454074938318156374 0.43299066027697208359 -0.075727796069269423529 0.29755618533440436613 -0.069004825392815521967 -0.34511534054524678483 0.17919963849835010561 0.26485060102794777404;0.19081856193894822238 -0.36430855282007040818 0.042247088415687049368 -0.45119258187933986015 0.22592894952518274843 -0.32625106261493108661 -0.055006142323480805567 -0.24411780103274494103];
IW1_2 = [0.53212174794800748412 0.81701857234694896803 -0.074931024593516373788 0.53944162567220654836 0.10845896887198758218 1.132252522673124151 0.32763636065751761128 0.70994173397534010572 0.58470900732655350929 0.52260250019830811752 0.72376531811480038225 0.19840439179716332085 0.59422533919091902188 0.47878574674410395717 0.57315091609280255369 0.99686198383266788614 0.043988644397989336288 -0.075888627954154158628 0.31747460749385864043 0.21959045620169062585;-0.020494574826593402878 1.9312316925216492791 -0.34938090935206361776 -0.49579672410839842334 0.4462057175629552952 0.2624729045003009742 -0.41517043024050115374 0.27825514302766735097 -0.58721155899074073403 -0.31111504995260885753 0.20821562253311046153 0.067148242044303654841 -0.25777295332244265502 -0.22302526384316123664 -0.022003728674898470619 0.06479706940143212246 0.12165369849454538143 0.032225768311224568807 -0.074935128081674157174 -0.083081573074283737723;0.31129663907117616217 0.34476222867146461004 0.027829735007213623338 0.22585587146941493719 -0.50201215734075166353 -0.51006517344202284558 0.3688504139077540267 -0.40179012127214958072 0.32114224203135532942 -1.1663541493134153004 -0.14780223197228950505 -0.18351030317673061587 -0.073676336642303622004 0.16235579999607066548 -0.11271509011977244585 0.18484675496267616301 0.3133439802259381235 -0.2525198004205236324 -0.2213608654914979712 -0.18418129719576162295;-0.057514447860808053103 0.24881934617227785544 0.43617910852595143112 0.62850371404861415936 0.36035378989942534744 0.31964955442511788775 -0.056141492256935675298 -0.064208192404333938597 -0.29833039907127073542 0.31668229022288313379 0.30019781194378586386 0.65177870612658328486 0.73164918882610630035 0.27621917784086125192 0.21479502919349152679 -0.075386917469367528688 0.31110973689461568492 0.17531495814920522447 0.60752070052883466733 -0.066568139738983303499;-1.6438076496059796927 -0.08632476330677768539 -0.093691736957249152629 0.25442029202287258505 -0.054027839442380681811 0.025839570314925057459 0.48380883965954130099 0.03150115061397613242 0.24596738775655305198 -0.042183055954132561705 -0.31190782193923655141 -0.35523913097318005061 -0.38021712626112214028 -0.36220596545408795253 -0.43192613117432948622 -0.34764619875349367373 -0.12566311488510098493 -0.052109898949633533249 -0.35013824716016600513 -0.26372936208806979641;-0.12694654716119752047 -0.10739417764484891771 1.8210936696847757066 0.080510695697349143884 0.67265333014620309893 0.049347224056254017366 -0.08771465728828066466 -0.386646596389371211 0.081461495145102896798 0.18476929393235350108 0.097584970602374893067 0.23686387838281811047 0.18453348187990009643 0.23280447289610495254 0.66432886846381211665 0.20178486093899183906 -0.06813233120139008947 0.33143308198795773389 0.11090926884688463716 -0.10537243237728100009;0.40704503180193413181 0.50594537530523042701 -0.0068743700354775500241 0.46010194336906318213 -0.1843383523793279688 -0.42734680647747791404 0.32657684054661662021 -0.48288735438193303162 -2.5983837432135010737 0.30342385655129250344 -0.40218424266766250597 0.19897535163832824612 0.21797111424780143962 -0.1617479669766087591 -0.20078791917442481707 -0.78544000090399235248 0.2832995201846685851 -0.22058409323238736821 -0.10221069813239268276 -0.21755351921661569836;-0.13894941599945964672 -0.1921035916034811164 0.023064825387133815193 1.2014007333682692469 0.32834265774768944812 0.5265421081264912706 -0.32939142986903546806 0.41718756594962536077 -0.31262797148317117424 0.033794282522205724983 0.067737402656323081329 0.032053071412869955925 0.19929652256205754313 0.050050256175566194827 0.3172456304800368998 0.20726574255140789438 -0.045075160924855757483 0.37041218182295465589 0.051850875414569286281 0.18497420111830004119;-0.43500127768142565765 -0.21616887846867186007 0.20199634426998705483 -0.15392579474173373466 -0.12359328339492926807 0.10924243951800226282 -0.121462177183892725 0.96693327144510654581 -0.48085345138300411572 0.52516676378619431276 0.022650694986053689084 0.042120637528565200991 0.29306435756609394705 0.0069529580942173513369 -0.41215575080634220262 -0.13247520658085978895 0.022667487210585372109 0.55121351512932381667 -0.31747484661548464047 0.10419837802455202136;0.14913405077030778001 0.016092934597212338321 -0.49705650789047201021 -0.47348819318803136991 0.015101954729597374602 -0.18292268097430719465 -0.34197417891304082715 0.13787415094158320117 -0.38400401242187853779 -0.25628984613667782355 -0.46217496945329034075 -0.40550556407280946569 -0.45555654150527608026 -0.60706695608606775494 0.16179245849985096628 0.17104317293034254632 -0.21604383331581841765 -0.2246726112300536371 -0.1709689141764914877 0.19648240179275863748];

% Layer 2
b2 = [0.63231114797012033524;0.077425009453641446822;0.69336797498678903739;0.96191102890088908683;-0.012805708021796273835;0.1820181237505598959;-3.1816936364779904167;-0.37416037372160165786;-0.77823497583398237865;0.84377782802628620296];
LW2_1 = [0.25931099111015321057 0.043027177460193015424 -0.031630578930780896274 -0.89462068706781638916 -1.3766357076801596371 0.010137211285814212713 -0.036902676601514618204 0.070425457439557262451 0.12616224313455731698 -0.62073804551550160191;0.63030827275463219284 0.95420909453976487935 -0.017068421299363607108 0.10423405085466287689 0.093335144344598802713 0.057065955576594648568 -0.0036970778483764979612 0.022628422538665812075 -0.16999748891350002777 0.44670086060336111622;-1.364902980843731628 -0.0099506250485993270882 0.0049445806313728026329 0.52636799453096261292 0.010760884196607662516 3.2396981083788300992 0.017582706363676956635 -0.0084493274178605876773 -0.048844856273780573597 0.62848193276936803464;0.060748789116446537395 -0.0079414306158894099746 -0.024655658667851406557 -0.03616832501611878109 0.017769845931746054701 -0.0068220245921715421539 0.0047869357173603317018 1.8282331769414068567 -0.33645790335109720948 -0.44435428800856008325;-0.014074758694958703145 -0.081360871514492449919 0.11812012194321816483 0.7649109681679789885 0.11204011842603171789 -0.38561013622705569981 0.094092375718802051532 -0.15289820050647812133 -0.024140118772927387364 -1.0248764967263737091;0.091941509329082168889 0.0089317019625690090984 -0.0027021633876380731637 0.43848771159122201801 -0.010539276489478908994 0.10749719032801560714 -0.013926862203781770894 0.014467383049023820052 0.033730896861891353222 -0.47233994547981617007;1.207987929744268385 -0.96997720146081534143 1.3419936506258491882 2.4831383979858090427 1.236241853293317039 -2.9872874742087569544 0.99144276990696145191 -1.8470882435209095007 -0.39711441564978733343 -1.9294405292739680302;-0.6917669747991321838 0.020058864427243805473 0.23445204902586566642 0.1681016969514140813 -0.016157270553128027374 -0.17576946951472391389 -0.021758463862406492162 0.046202714262242240706 0.92224582634424034921 -0.57227723426191967615;0.19083063270129360656 -0.018250875038045986237 0.006372142546187395569 -0.071890224988197803935 0.044783945745097551716 0.02606451021162137921 -0.94180942639733522537 -0.022845789788841774914 -0.20169008677005745289 0.63128763532050136131;0.25935308000900364478 0.034478896622406912664 -1.6397341980970749908 0.037171314064603451499 -0.044091665192930361294 0.1138066817364345451 -0.040461815656080674097 0.076249347774990011706 -0.27787700567267387131 0.047364494032463178019];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [2;2;2;2;2;2;2;2;2;2];
y1_step1.xoffset = [0;0;0;0;0;0;0;0;0;0];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
    X = {X};
end
if (nargin < 2), error('Initial input states Xi argument needed.'); end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},2); % samples/series
elseif ~isempty(Xi)
    Q = size(Xi{1},2);
else
    Q = 0;
end

% Input 1 Delay States
Xd1 = cell(1,3);
for ts=1:2
    Xd1{ts} = mapminmax_apply(Xi{1,ts},x1_step1);
end

% Input 2 Delay States
Xd2 = cell(1,3);
for ts=1:2
    Xd2{ts} = mapminmax_apply(Xi{2,ts},x2_step1);
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Rotating delay state position
    xdts = mod(ts+1,3)+1;
    
    % Input 1
    Xd1{xdts} = mapminmax_apply(X{1,ts},x1_step1);
    
    % Input 2
    Xd2{xdts} = mapminmax_apply(X{2,ts},x2_step1);
    
    % Layer 1
    tapdelay1 = cat(1,Xd1{mod(xdts-[1 2]-1,3)+1});
    tapdelay2 = cat(1,Xd2{mod(xdts-[1 2]-1,3)+1});
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*tapdelay1 + IW1_2*tapdelay2);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
end

% Final Delay States
finalxts = TS+(1: 2);
xits = finalxts(finalxts<=2);
xts = finalxts(finalxts>2)-2;
Xf = [Xi(:,xits) X(:,xts)];
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
    Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end
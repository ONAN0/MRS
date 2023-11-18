%% prevodova char
maska = Meranie01_finally.time >= 50;
T50 = Meranie01_finally.time .* maska;
%premaskovanie nepotrebnych dat
Meranie01_50 = Meranie01_finally.signals(3).values(maska);
Meranie02_50 = Meranie02_finally.signals(3).values(maska);
Meranie03_50 = Meranie03_finally.signals(3).values(maska);
Meranie04_50 = Meranie04_finally.signals(3).values(maska);
Meranie05_50 = Meranie05_finally.signals(3).values(maska);
Meranie06_50 = Meranie06_finally.signals(3).values(maska);
Meranie07_50 = Meranie07_finally.signals(3).values(maska);
Meranie08_50 = Meranie08_finally.signals(3).values(maska);
Meranie09_50 = Meranie09_finally.signals(3).values(maska);
Meranie10_50 = Meranie10_finally.signals(3).values(maska);
Test_50 = Test.signals(3).values(maska);
%plotovanie vsetjych priebehov merania
figure (1);
plot(Meranie01_finally.time, Meranie01_finally.signals(3).values)
hold on;
plot(Meranie01_finally.time, Meranie02_finally.signals(3).values)
plot(Meranie01_finally.time, Meranie03_finally.signals(3).values)
plot(Meranie01_finally.time, Meranie04_finally.signals(3).values)
plot(Meranie01_finally.time, Meranie05_finally.signals(3).values)
plot(Meranie01_finally.time, Meranie06_finally.signals(3).values)
plot(Meranie01_finally.time, Meranie07_finally.signals(3).values)
plot(Meranie01_finally.time, Meranie08_finally.signals(3).values)
plot(Meranie01_finally.time, Meranie09_finally.signals(3).values)
plot(Meranie01_finally.time, Meranie10_finally.signals(3).values)
grid on;
hold off;

%vypocet priemernej hodnoty z ustalenych casti
Avg01= mean(Meranie01_50);
Avg02= mean(Meranie02_50);
Avg03= mean(Meranie03_50);
Avg04= mean(Meranie04_50);
Avg05= mean(Meranie05_50);
Avg06= mean(Meranie06_50);
Avg07= mean(Meranie07_50);
Avg08= mean(Meranie08_50);
Avg09= mean(Meranie09_50);
Avg10= mean(Meranie10_50);
AvgTest=mean(Test_50);
%priemerne hodnoty do vektora
AVG = [AvgTest, Avg01, Avg02, Avg03, Avg04, Avg05, Avg06, Avg07, Avg08, Avg09, Avg10];
p=(0:1:10);
%plotnutie prevodovej char
figure (2);
hold on;
plot(p,AVG,"rx");
grid on;
hold off;

%% PRACOVNE body / prechodova char.
figure(3);
plot(PB_02.time,PB_04.signals(3).values),
%tvorba masiek a k tomu prislusnych casov
maskaLOW = (PB_02.time >=30) &  (PB_02.time<= 50);
maskaHI = (PB_02.time >=90) &  (PB_02.time<= 120);
timeLOW = PB_02.time(maskaLOW);
timeHI = PB_02.time(maskaHI);
%premaskovanie nepotrebnych dat
PB_02_L=PB_02.signals(3).values(maskaLOW);
PB_02_H=PB_02.signals(3).values(maskaHI);

PB_03_L=PB_03.signals(3).values(maskaLOW);
PB_03_H=PB_03.signals(3).values(maskaHI);

PB_04_L=PB_04.signals(3).values(maskaLOW);
PB_04_H=PB_04.signals(3).values(maskaHI);

PB_05_L=PB_05.signals(3).values(maskaLOW);
PB_05_H=PB_05.signals(3).values(maskaHI);


%priemerne hodnoty z ustalenych casti
avgPB_02_L = mean(PB_02_L);
avgPB_02_H = mean(PB_02_H);
avgPB_04_L = mean(PB_04_L);
avgPB_04_H = mean(PB_04_H);
for i = 1:1:201
    VavgPB_02_L(i) =avgPB_02_L;
    VavgPB_04_L(i) =avgPB_04_L;
end
for i = 1:1:301
   
    VavgPB_02_H(i) =avgPB_02_H;
    VavgPB_04_H(i) =avgPB_04_H;
end
%plotovanie ustalenych casti pred a po skoku
figure(4);
subplot(2,2,1);
plot(timeLOW, PB_02_L,'b',timeLOW,VavgPB_02_L,'r');
title('Pred skokom 2 -> 2.2');
xlabel('t[s]');
ylabel('U[V]')
subplot(2,2,2);
plot(timeHI, PB_02_H,'b',timeHI,VavgPB_02_H,'r');
title('Po skoku 2 -> 2.2');
xlabel('t[s]');
ylabel('U[V]')
subplot(2,2,3);
plot(timeLOW, PB_04_L,'b',timeLOW,VavgPB_04_L,'r');
title('Pred skokom 8 -> 8.8');
xlabel('t[s]');
ylabel('U[V]')
subplot(2,2,4);
plot(timeHI, PB_04_H,'b',timeHI,VavgPB_04_H,'r');
title('Po skoku 8 -> 8.8');
xlabel('t[s]');
ylabel('U[V]')





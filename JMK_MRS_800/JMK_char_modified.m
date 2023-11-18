% Prevodova char
maska = Meranie01_finally.time >= 50;
T50 = Meranie01_finally.time .* maska;

% premaskovanie nepotrebnych dat

% Definuje pocet signalov
numSignals = 10;

% Vytvara "cell" pole na uloženie hodnot
Meranie_50 = cell(1, numSignals);

% Prechadza signalmi
for i = 1:numSignals
    variableName = sprintf('Meranie%02d', i);
    Meranie_50{i} = eval([variableName '_finally.signals(3).values(maska)']);
end

% Extrahuje casovy vektor
timeVector = Meranie01_finally.time;

% Vykresli signaly
figure(1);
hold on;

for i = 1:10
    signalName = sprintf('Meranie%02d_finally', i);
    plot(timeVector, eval([signalName '.signals(3).values']));
end

grid on;
hold off;
legend('Signal 1', 'Signal 2', 'Signal 3', 'Signal 4', 'Signal 5', 'Signal 6', 'Signal 7', 'Signal 8', 'Signal 9', 'Signal 10');
xlabel('Time');
ylabel('Values');
title('Plots of Signals 1 to 10');

% Rata priemerne hodnoty
averageValues = zeros(1, numSignals);
for i = 1:numSignals
    variableName = sprintf('Meranie%02d_50', i);
    averageValues(i) = mean(eval(variableName));
end
averageValues = [mean(Test_50), averageValues];

% Vytvorty indexy na vykreslenie
indexes = 0:numSignals;

% Plot the average values
figure(2);
hold on;
plot(indexes, averageValues, 'rx');
grid on;
hold off;

xlabel('Index');
ylabel('Average Values');
title('Plot of Average Values');


% PRACOVNE body / prechodova char.
figure(3);
plot(PB_02.time, PB_04.signals(3).values),

% Tvorba masiek a k tomu prislusnych casov
maskaLOW = (PB_02.time >= 30) & (PB_02.time <= 50);
maskaHI = (PB_02.time >= 90) & (PB_02.time <= 120);

% Premaskovanie nepotrebnych dat
timeLOW = PB_02.time(maskaLOW);
timeHI = PB_02.time(maskaHI);

% Predefinovanie premaskovanych dat
PB_02_L = PB_02.signals(3).values(maskaLOW);
PB_02_H = PB_02.signals(3).values(maskaHI);

PB_03_L = PB_03.signals(3).values(maskaLOW);
PB_03_H = PB_03.signals(3).values(maskaHI);

PB_04_L = PB_04.signals(3).values(maskaLOW);
PB_04_H = PB_04.signals(3).values(maskaHI);

PB_05_L = PB_05.signals(3).values(maskaLOW);
PB_05_H = PB_05.signals(3).values(maskaHI);

% Priemerne hodnoty z ustalenych casti
avgPB_02_L = mean(PB_02_L);
avgPB_02_H = mean(PB_02_H);
avgPB_04_L = mean(PB_04_L);
avgPB_04_H = mean(PB_04_H);

% Vytvorenie vektorov s priemernymi hodnotami
VavgPB_02_L = ones(size(timeLOW)) * avgPB_02_L;
VavgPB_04_L = ones(size(timeLOW)) * avgPB_04_L;
VavgPB_02_H = ones(size(timeHI)) * avgPB_02_H;
VavgPB_04_H = ones(size(timeHI)) * avgPB_04_H;

% Plotovanie ustalenych casti pred a po skoku
figure(4);

subplot(2,2,1);
plot(timeLOW, PB_02_L, 'b', timeLOW, VavgPB_02_L, 'r');
title('Pred skokom 2 -> 2.2');
xlabel('t[s]');
ylabel('U[V]')

subplot(2,2,2);
plot(timeHI, PB_02_H, 'b', timeHI, VavgPB_02_H, 'r');
title('Po skoku 2 -> 2.2');
xlabel('t[s]');
ylabel('U[V]')

subplot(2,2,3);
plot(timeLOW, PB_04_L, 'b', timeLOW, VavgPB_04_L, 'r');
title('Pred skokom 8 -> 8.8');
xlabel('t[s]');
ylabel('U[V]')

subplot(2,2,4);
plot(timeHI, PB_04_H, 'b', timeHI, VavgPB_04_H, 'r');
title('Po skoku 8 -> 8.8');
xlabel('t[s]');
ylabel('U[V]')

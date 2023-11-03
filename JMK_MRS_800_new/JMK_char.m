
maska = Meranie01_finally.time >= 50;
T50 = Meranie01_finally.time .* maska;

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

AVG = [AvgTest, Avg01, Avg02, Avg03, Avg04, Avg05, Avg06, Avg07, Avg08, Avg09, Avg10];
p=(0:1:10);

plot(p,AVG,"r+");
grid on


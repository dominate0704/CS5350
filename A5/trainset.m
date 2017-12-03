clear all;
traindata = readTxt('speeches.train.liblinear');
testdata = readTxt('speeches.test.liblinear');
training00 = readTxt('training00.data');
training01 = readTxt('training01.data');
training02 = readTxt('training02.data');
training03 = readTxt('training03.data');
training04 = readTxt('training04.data');
save('data.mat','traindata','testdata','training00','training01','training02','training03','training04');

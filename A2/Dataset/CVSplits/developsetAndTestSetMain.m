clear All;
dataTrain = readTxt('phishing.train');
dataDev = readTxt('phishing.dev');
bestEpoch = ones(1,4);
learningRate = [0.1, 1, 0.1, 0.01];
margin = 0.01;
wAnswer = cell(20,4);
bAnswer = cell(20,4);
eAnswer = cell(20,4);
correctRate = cell(20,4);
wTest = cell(1,4);
bTest = cell(1,4);
cerrectTest = cell(1,4);
[w ,b ,errors] = simplePerceptronTrain(dataTrain, learningRate(1),20);
for i = 1:20
    wAnswer{i,1} = w{i,1};
    bAnswer{i,1} = b{i,1};
    eAnswer{i,1} = errors{i,1};
    correctRate{i,1} = checkPerceptron(dataDev, wAnswer{i,1},bAnswer{i,1})/length(dataDev);
    if correctRate{i,1} >= correctRate{bestEpoch(1,1),1}
        bestEpoch(1,1) = i;
        wTest{1,1} = wAnswer{i,1};
        bTest{1,1} = bAnswer{i,1};
    end
end
[w ,b ,errors] = dynamicPerceptronTrain(dataTrain, learningRate(2),20);
for i = 1:20
    wAnswer{i,2} = w{i,1};
    bAnswer{i,2} = b{i,1};
    eAnswer{i,2} = errors{i,1};
    correctRate{i,2} = checkPerceptron(dataDev, wAnswer{i,2},bAnswer{i,2})/length(dataDev);
    if correctRate{i,2} >= correctRate{bestEpoch(1,2),2}
        bestEpoch(1,2) = i;        
        wTest{1,2} = wAnswer{i,2};
        bTest{1,2} = bAnswer{i,2};
    end
end
[w ,b ,errors] = marginPerceptronTrain(dataTrain, learningRate(3),margin,20);
for i = 1:20
    wAnswer{i,3} = w{i,1};
    bAnswer{i,3} = b{i,1};
    eAnswer{i,3} = errors{i,1};
    correctRate{i,3} = checkPerceptron(dataDev, wAnswer{i,3},bAnswer{i,3})/length(dataDev);
    if correctRate{i,3} >= correctRate{bestEpoch(1,3),3}
        bestEpoch(1,3) = i;
        wTest{1,3} = wAnswer{i,3};
        bTest{1,3} = bAnswer{i,3};
    end
end
[w ,b ,errors] = averagePerceptronTrain(dataTrain, learningRate(4),20);
for i = 1:20
    wAnswer{i,4} = w{i,1};
    bAnswer{i,4} = b{i,1};
    eAnswer{i,4} = errors{i,1};
    correctRate{i,4} = checkPerceptron(dataDev, wAnswer{i,4},bAnswer{i,4})/length(dataDev);
    if correctRate{i,4} >= correctRate{bestEpoch(1,4),4}
        bestEpoch(1,4) = i;
        wTest{1,4} = wAnswer{i,4};
        bTest{1,4} = bAnswer{i,4};
    end
end
dataTest = readTxt('phishing.test');
correctTest{1,1} = checkPerceptron(dataTest, wTest{1,1},bTest{1,1})/length(dataTest);
correctTest{1,2} = checkPerceptron(dataTest, wTest{1,2},bTest{1,2})/length(dataTest);
correctTest{1,3} = checkPerceptron(dataTest, wTest{1,3},bTest{1,3})/length(dataTest);
correctTest{1,4} = checkPerceptron(dataTest, wTest{1,4},bTest{1,4})/length(dataTest);


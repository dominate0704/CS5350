data0 = readTxt('updated_training00.txt');
data1 = readTxt('updated_training01.txt');
data2 = readTxt('updated_training02.txt');
data3 = readTxt('updated_training03.txt');
dataT0 = readTxt('updated_train.txt');
dataT1 = readTxt('updated_test.txt');
dataWhole = {data0,data1,data2, data3};
attributes = ['2','3','4','5','6','7','8'];
attributesLive= [1,1,1,1,1,1];
[rows,cols] =size(data0);
errorList = zeros(4,6);
for j = [1,2,3,4,5,6]
    for i = 1:4
        dataTest = dataWhole{1,i};
        dataTrain = [dataWhole{1,mod(i,4)+1};dataWhole{1,mod(i+1,4)+1};dataWhole{1,mod(i+2,4)+1}];
        nodeCur = id3Depth(dataTrain,attributes, attributesLive, j);
        list = visitNode(nodeCur, dataTest);
        errorList(i,j) = length(list);
    end
end
errorListAccuracy = (111-errorList)/111;
meanAndVar = zeros(3,6);
meanAndVar(1,:) = max(errorListAccuracy);
meanAndVar(2,:) = var(errorListAccuracy);
meanAndVar(3,:) = mean(errorListAccuracy);
disp('Q2-1. the accuracy of different depth for each fold ');
disp('the row is different piece of data as test data, so there are 4 rows.');
disp('the column is different depth from 1 to 6.');

disp(errorListAccuracy);
disp('Q2-1. the analystic variables of the accuracy table above.');
disp('the row is the maximum, the variance , the mean. ');
disp('the column is different depth from 1 to 6.');
disp(meanAndVar);
% errorsList = visitNode(node, data0);
% errors = length(errorsList);
% % global newData;
% % newData = zeros(2^6,7);
% % newData = visitNode(node,1,[],newData);
% dataTest = readTxt('updated_test.txt');
% errorsListTest = visitNode(node, dataTest);
% errorsTest = length(errorsListTest);


nodeDepth4 = id3Depth(dataT0,attributes, attributesLive, 4);
testList = visitNode(nodeDepth4, dataT1);
errorNumber = length(testList);
disp('Q2-2. the error rows of prediciton when useing the updated-test.txt as test data.');
disp(testList);

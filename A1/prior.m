data = readTxt('updated_train.txt');
attributes = ['2','3','4','5','6','7','8'];
attributesLive= [1,1,1,1,1,1];
[rows,cols] =size(data);
node = id3(data,attributes,rows, attributesLive);
errorsList = visitNode(node, data);
disp('Q1-3. the rows of error prediction when the updated_train.txt as test data.');
disp(errorsList);
errors = length(errorsList);


dataTest = readTxt('updated_test.txt');
disp('Q1-4. the rows of error prediction when the updated_test.txt as test data.');
errorsListTest = visitNode(node, dataTest);
disp(errorsListTest);
errorsTest = length(errorsListTest);
disp('Q1-5. find the deepest node in this decision tree.');
depth = findDepth(node,0);
disp(depth);
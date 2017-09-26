clear;
data = cell(1,5);
wAnswer = cell(3,5);
bAnswer = cell(3,5);
eAnswer = cell(3,5);
correctRate = cell(3,6);
data{1} = readTxt('training00.data');
data{2} = readTxt('training01.data');
data{3} = readTxt('training02.data');
data{4} = readTxt('training03.data');
data{5} = readTxt('training04.data');
learningRate = [1, 0.1 , 0.01];
margin = [1, 0.1 , 0.01];
wMarginAnswer = cell(9,5);
bMarginAnswer = cell(9,5);
eMarginAnswer = cell(9,5);
correctRateMargin = cell(9,6);
for i = 1:5
  dataTrain = [data{mod(i,5)+1};data{mod(i+1,5)+1};data{mod(i+2,5)+1};data{mod(i+3,5)+1}];
  dataTest = data{i};
%   for j = 1:3
%       [w ,b ,errors] = simplePerceptron(dataTrain, learningRate(j),10);
%       wAnswer{j,i} = w;
%       bAnswer{j,i} = b;
%       eAnswer{j,i} = errors;
%       correctRate{j,i} = checkPerceptron(dataTest, w,b)/1658;
%   end
%   for j = 1:3
%       [w ,b ,errors] = dynamicPerceptron(dataTrain, learningRate(j),10);
%       wAnswer{j,i} = w;
%       bAnswer{j,i} = b;
%       eAnswer{j,i} = errors;
%       correctRate{j,i} = checkPerceptron(dataTest, w,b)/1658;
%   end
  for j = 1:3
      for n = 1:3
          [w ,b ,errors] = marginPerceptron(dataTrain, learningRate(j), margin(n),10);
          wMarginAnswer{(j-1)*3+n,i} = w;
          bMarginAnswer{(j-1)*3+n,i} = b;
          eMarginAnswer{(j-1)*3+n,i} = errors;
          correctRateMargin{(j-1)*3+n,i} = checkPerceptron(dataTest, w,b)/1658;
      end
  end
%   for j = 1:3
%       [w ,b ,errors] = averagePerceptron(dataTrain, learningRate(j),10);
%       wAnswer{j,i} = w;
%       bAnswer{j,i} = b;
%       eAnswer{j,i} = errors;
%       correctRate{j,i} = checkPerceptron(dataTest, w,b)/1658;
%   end
%     for p = 1:3
%         correctRate{p,6} = (correctRate{p,1}+correctRate{p,2}+correctRate{p,3}+correctRate{p,4}+correctRate{p,5})/5;
%     end
    for p = 1:9
        correctRateMargin{p,6} = (correctRateMargin{p,1}+correctRateMargin{p,2}+correctRateMargin{p,3}+correctRateMargin{p,4}+correctRateMargin{p,5})/5;
    end
end

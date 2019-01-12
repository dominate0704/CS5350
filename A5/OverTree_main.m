clear;
load('data.mat');
data{1} = training00;
data{2} = training01;
data{3} = training02;
data{4} = training03;
data{5} = training04;
gamma = [1,0.1,0.01,0.001,0.0001,0.00001];
C = [10,1,0.1,0.01,0.001,0.0001];
sigma2 = [0.1,1,10,100,1000,10000];
Best = zeros(1,6);
load('BG_dep3.mat');
% BestAnswer; Answer; AnswerAccuracy; TrainingAccuracy;
% TestAccuray;Best_parameter
% for i = 1:5
%   dataTrain = [data{mod(i,5)+1} data{mod(i+1,5)+1} data{mod(i+2,5)+1} data{mod(i+3,5)+1}];
%   dataTest = data{i};
%   % SGD
%   for j = 1:length(gamma)
%       for m = 1:length(C)
%           if i ==1
%               AnswerAccuracyBG((j-1)*length(C)+m).accuracy = 0;
%           end
%           svm_data = SVMovertrees(Answer_tree, dataTrain);
%           w_cur = SGD_form2(svm_data,gamma(j),C(m), 5);
%           AnswerBG((j-1)*length(C)+m).weight = w_cur;
%           [correctNumber,result] = checkErrors_form2(dataTest,Answer_tree, w_cur);
%           len = length(dataTest);
%           AnswerAccuracyBG((j-1)*length(C)+m).accuracy =AnswerAccuracyBG((j-1)*length(C)+m).accuracy+ correctNumber/len;
%           AnswerAccuracyBG((j-1)*length(C)+m).gamma = gamma(j);
%           AnswerAccuracyBG((j-1)*length(C)+m).C = C(m);
%       end
%   end
%   
%   index = length(gamma)*length(C);
%   % LogisticRegression
%   for j = 1:length(gamma)
%       for m = 1:length(sigma2)
%           if i ==1
%               AnswerAccuracyBG(index+(j-1)*length(sigma2)+m).accuracy = 0;
%           end
%           svm_data = SVMovertrees(Answer_tree, dataTrain);
%           w_cur = LogisticRegression_form2(svm_data,gamma(j),sigma2(m), 5);
%           AnswerBG(index+(j-1)*length(sigma2)+m).weight = w_cur;
%           [correctNumber,result] = checkErrors_form2(dataTest, Answer_tree, w_cur);
%           len = length(dataTest);
%           AnswerAccuracyBG(index+(j-1)*length(sigma2)+m).accuracy = AnswerAccuracyBG(index+(j-1)*length(sigma2)+m).accuracy+correctNumber/len ;
%           AnswerAccuracyBG(index+(j-1)*length(sigma2)+m).gamma = gamma(j);
%           AnswerAccuracyBG(index+(j-1)*length(sigma2)+m).sigma2 = sigma2(m);
%       end
%   end
%   index = index + length(gamma)*length(sigma2);
% end
% save('AnswerAccuracyBG.mat', 'AnswerAccuracyBG','AnswerBG');
load('AnswerAccuracyBG.mat');
index = length(gamma)*length(C);
%%
%SGD
best =0;
for n = 1:index
    if best < AnswerAccuracyBG(n).accuracy
        best = AnswerAccuracyBG(n).accuracy;
        gamma_SGD = AnswerAccuracyBG(n).gamma;
        C_SGD = AnswerAccuracyBG(n).C;
    end
end

x1 = ['For SGD, the best hyper_parameter: gamma = ', num2str(gamma_SGD), ' ; C = ', num2str(C_SGD)];
x2 = ['Average cross-validation accuracy = ',num2str(best/5)];
disp(x1);
disp(x2);
svm_data = SVMovertrees(Answer_tree, traindata);
w_cur = SGD_form2(svm_data,gamma_SGD,C_SGD, 5);
[correctNumber,~] = checkErrors_form2(traindata, Answer_tree, w_cur);
TrainingAccuracyBG(1) = correctNumber/length(traindata);
x3 = ['For SGD, the Training Accuracy = ', num2str(correctNumber/length(traindata))];
[correctNumber,~] = checkErrors_form2(testdata,Answer_tree, w_cur);
TestAccuracyBG(1) = correctNumber/length(testdata);
x4 = ['For SGD, the Testing Accuracy = ', num2str(correctNumber/length(testdata))];
disp(x3);
disp(x4);


%% LogisticRegression
index = length(gamma)*length(C)+1;
index1 = index + length(gamma)*length(sigma2);
best =0;
for n = index:index1-1
    if best < AnswerAccuracyBG(n).accuracy
        best = AnswerAccuracyBG(n).accuracy;
        gamma_LR = AnswerAccuracyBG(n).gamma;
        sigma2_LR = AnswerAccuracyBG(n).sigma2;
    end
end
x1 = ['For LR, the best hyper_parameter: gamma = ', num2str(gamma_LR), ' ; sigma2 = ', num2str(sigma2_LR)];
x2 = ['Average cross-validation accuracy = ',num2str(best/5)];
disp(x1);
disp(x2);
svm_data = SVMovertrees(Answer_tree, traindata);
w_cur = LogisticRegression_form2(svm_data,gamma_LR,sigma2_LR, 5);
[correctNumber,~] = checkErrors_form2(traindata,Answer_tree, w_cur);
TrainingAccuracyBG(2) = correctNumber/length(traindata);
x3 = ['For LR, the Training Accuracy = ', num2str(correctNumber/length(traindata))];
[correctNumber,~] = checkErrors_form2(testdata, Answer_tree, w_cur);
TestAccuracyBG(2) = correctNumber/length(testdata);
x4 = ['For LR, the Testing Accuracy = ', num2str(correctNumber/length(testdata))];
disp(x3);
disp(x4);

save('resultAccuracyBG.mat', 'TrainingAccuracyBG','TestAccuracyBG');
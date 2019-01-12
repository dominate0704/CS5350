
load('AnswerAccuracy.mat');
len = length(AnswerAccuracy);
for n = 1:len
    AnswerAccuracy(n).accuracy = AnswerAccuracy(n).accuracy/5;
end
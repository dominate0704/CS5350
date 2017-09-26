function [wAnswer,bAnswer, eAnswer] = averagePerceptronTrain( data, learningRate,epochs)
     mySeed = 15;
     rng(mySeed); 
     wAnswer = cell(epochs,1);
     bAnswer = cell(epochs,1);
     eAnswer = cell(epochs,1);
     w = -0.01 + (0.02)*rand(1,70);
     b = -0.01 + (0.02)*rand;
     errors = 0;
     a = 0;
     b_A = 0;
     for epoch = 1:epochs
         data = data(randperm(end),:);
         for i = 1: length(data)
             y = data(i,71);
             x = data(i,1:70);
             if y*(w*x'+b) <= 0
                 w = w+ learningRate*y*x;
                 b = b + learningRate*y;
                 errors = errors +1;
                 a = a+w;
                 b_A= b_A+b;
             else
                 a = a+w;
                 b_A= b_A+b;
             end
         end
        wAnswer{epoch,1} = a;
        bAnswer{epoch,1} = b_A;
        eAnswer{epoch,1} = errors;
     end
end
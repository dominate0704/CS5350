function [wAnswer,bAnswer, eAnswer] = simplePerceptronTrain( data, learningRate,epochs)
     wAnswer = cell(epochs,1);
     bAnswer = cell(epochs,1);
     eAnswer = cell(epochs,1);
     w = -0.01 + (0.02)*rand(1,70);
     b = -0.01 + (0.02)*rand;
     errors = 0;
     for epoch = 1:epochs
         data = data(randperm(end),:);
         for i = 1: length(data)
             y = data(i,71);
             x = data(i,1:70);
             if y*(w*x'+b) <= 0
                 w = w+ learningRate*y*x;
                 b = b + learningRate*y;
                 errors = errors +1;
             end
        end
        wAnswer{epoch,1} = w;
        bAnswer{epoch,1} = b;
        eAnswer{epoch,1} = errors;
     end
end
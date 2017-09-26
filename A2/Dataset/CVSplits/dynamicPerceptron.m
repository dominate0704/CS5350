function [w, b, errors] = dynamicPerceptron( data, learningRate,epochs)
     w = -0.01 + (0.02)*rand(1,70);
     b = -0.01 + (0.02)*rand;
     errors = 0;
     steps = 0;
     for epoch = 1:epochs
         data = data(randperm(end),:);
         for i = 1: length(data)
             y = data(i,71);
             x = data(i,1:70);
             if y*(w*x'+b) <= 0
                 dynamicRate = learningRate/(1+steps);
                 w = w+ dynamicRate*y*x;
                 b = b + dynamicRate*y;
                 errors = errors +1;
             end
             steps = steps+1;
        end
     end
     
end
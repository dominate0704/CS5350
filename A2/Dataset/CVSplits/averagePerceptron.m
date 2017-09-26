function [a,b_A, errors] = averagePerceptron( data, learningRate,epochs)
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
     end
end
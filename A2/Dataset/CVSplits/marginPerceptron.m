function [w, b, errors] = marginPerceptron(data, learningRate, margin)
     w = -0.01 + (0.02)*rand(1,70);
     b = -0.01 + (0.02)*rand;
     errors = 0;
     for i = 1: length(data)
         y = data(i,71);
         x = data(i,1:70);
         if y*(w*x'+b) <= margin
             dynamicRate = learningRate/(1+errors);
             w = w+ dynamicRate*y*x;
             b = b + dynamicRate*y;
             errors = errors +1;
         end
     end
end
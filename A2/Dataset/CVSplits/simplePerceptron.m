function [w,b, errors] = simplePerceptron( data, learningRate)
     w  = zeros(1,70);
     b = 0;
     errors = 0;
     for i = 1: length(data)
         y = data(i,71);
         x = data(i,1:70);
         if (y*w*x') <= 0
             w = w+ learningRate*y*x;
             b = b + learningRate*y;
             errors = errors +1;
         end
     end
end
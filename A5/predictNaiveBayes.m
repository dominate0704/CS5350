function [correctNumber,result] = predictNaiveBayes(data, p)    
    correctNumber = 0;
    result =[];
    scale = 1;
    yPredict_1 = log(p(1,70001)*scale);
    yPredict_0 = log(p(2,70001)*scale);
    for i = 1: length(data)
        x = data(i).line;
        x_len = length(x);
        x_new = zeros(70000,1);
        y = x(1);
        if x_len >1
            for j = 2:x_len
                x_new(x(j)) = 1;     
            end
        end
        for j = 1:70000
            if x_new(j) ==1
               yPredict_1 = yPredict_1+log(p(1,j)*scale);
               yPredict_0 = yPredict_0+log(p(3,j)*scale);
            else
               yPredict_1 = yPredict_1+log(p(2,j)*scale);
               yPredict_0 = yPredict_0+log(p(4,j)*scale);
            end
        end
        if yPredict_1 > yPredict_0 && y ==1
            correctNumber = correctNumber +1;
            result =[result,i];
        elseif  yPredict_1 < yPredict_0 && y == -1
            correctNumber = correctNumber +1;
            result =[result,i];
        end
    end     
end
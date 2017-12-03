function [correctNumber,result] = checkErrors(data, w)    
    correctNumber = 0;
    result =[];
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
        x_new(70000) = 1;
        yPredict = w*x_new;
        if yPredict > 0 && y == 1
            correctNumber = correctNumber +1;
            result =[result,i];
        elseif yPredict <= 0 && y == -1
            correctNumber = correctNumber +1;
            result =[result,i];
        end
    end     
end
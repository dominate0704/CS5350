function correctNumber = checkPerceptron( data, w, b)    
    correctNumber = 0;
    for i = 1: length(data)
        y = data(i,71);
        x = data(i,1:70);
        yPredict = w*x'+b;
        if yPredict > 0 && y == 1
            correctNumber = correctNumber +1;
        elseif yPredict <= 0 && y == -1
            correctNumber = correctNumber +1;
        end
    end
end
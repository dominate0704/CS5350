function [correctNumber,result] = checkErrors_form2(data,tree, w)
    [svm_data] = SVMovertrees(tree, data);
    correctNumber = 0;
    result =[];
    for i = 1: length(svm_data)
        x = svm_data(i).line;
        x_len = length(x);
        x_new = x(1:x_len-1);
        y = x(x_len);
        yPredict = w*x_new';
        if yPredict > 0 && y == 1
            correctNumber = correctNumber +1;
            result =[result,i];
        elseif yPredict <= 0 && y == -1
            correctNumber = correctNumber +1;
            result =[result,i];
        end
    end     
end
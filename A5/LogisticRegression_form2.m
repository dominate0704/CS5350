function  w  = LogisticRegression_form2( data, gamma, sigma2 ,epoch)
len = length(data(1).line);
w = zeros(1,len-1);
step = 1;
for t = 1:epoch
    data = data(randperm(end));
    for i = 1:len
        x = data(i).line;
        x_len = length(x);
        x_new = x(1:x_len-1);
        cur_gamma = gamma/(1+step);
        y = x(x_len);
        s = exp(y*w*x_new');
        w = w-cur_gamma*(((-y)*x_new)/(1+s)+2*(w/sigma2));
        step= step+1;
    end
end
end
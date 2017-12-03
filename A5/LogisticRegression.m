function  w  = LogisticRegression( data, gamma, sigma2 ,epoch)
w = zeros(1,70000);
len = length(data);
step = 1;
for t = 1:epoch
    data = data(randperm(end));
    for i = 1:len
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
        cur_gamma = gamma/(1+step);
        s = exp(y*w*x_new);
        w = w-cur_gamma*(((-y)*x_new')/(1+s)+2*(w/sigma2));
        step= step+1;
    end
end
end
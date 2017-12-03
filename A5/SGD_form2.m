function  w  = SGD_form2( data, gamma, C ,epoch)
len = length(data(1).line);
w = zeros(1,len-1);
step = 1;
for t = 1:epoch
    data = data(randperm(end));
    for i = 1:length(data)
        x = data(i).line;
        x_len = length(x);
        x_new = x(1:x_len-1);
        cur_gamma = gamma/(1+step);
        y = x(x_len);
        if y*w*x_new' <= 1
            w = (1-cur_gamma)*w+cur_gamma*C*y*x_new;
        else
            w = (1-cur_gamma)*w;
        end
        step= step+1;
    end
end
end


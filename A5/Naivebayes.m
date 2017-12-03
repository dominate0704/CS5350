function  p  = Naivebayes( data, lambda)
p = zeros(4,70001);
len = length(data);
data = data(randperm(end));
count_y = 0;
for i = 1:len
    x = data(i).line;
    x_len = length(x);
    x_new = zeros(70000,1);
    y = x(1);
    if y ==1
        count_y = count_y+1;
    end
    if x_len >1
        for j = 2:x_len
            x_new(x(j)) = 1;     
        end
    end
    for j = 1:70000
        if y ==1
            if x_new(j) ==1
                p(1,j) = p(1,j)+1;
            else
                p(2,j) = p(2,j)+1;
            end
        else
            if x_new(j) ==1
                p(3,j) = p(3,j)+1;
            else
                p(4,j) = p(4,j)+1;
            end
        end
    end
end
p(1:2,:) = (p(1:2,:)+lambda)/(count_y+2*lambda);
p(3:4,:) = (p(3:4,:)+lambda)/(len-count_y+2*lambda);
p(1,70001) = (count_y+lambda)/(len+2*lambda);
p(2,70001) = (len - count_y+lambda)/(len+2*lambda);
end
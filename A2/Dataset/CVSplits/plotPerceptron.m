y = zeros(1,20);
x = 1:20;
for i = 1:20
    y(i) = correctRate{i,1};
end
plot(x,y,'o-');
xlabel('epoch');
ylabel('accuracy rate');
title('Simple Perceptron');

y = zeros(1,20);
x = 1:20;
for i = 1:20
    y(i) = correctRate{i,2};
end
plot(x,y,'o-');
xlabel('epoch');
ylabel('accuracy rate');
title('Dynamic Perceptron');

y = zeros(1,20);
x = 1:20;
for i = 1:20
    y(i) = correctRate{i,3};
end
plot(x,y,'o-');
xlabel('epoch');
ylabel('accuracy rate');
title('Margin Perceptron');

y = zeros(1,20);
x = 1:20;
for i = 1:20
    y(i) = correctRate{i,4};
end
plot(x,y,'o-');
xlabel('epoch');
ylabel('accuracy rate');
title('Average Perceptron');

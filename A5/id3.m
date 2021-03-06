function  root  = id3( data, attributes,len, attributesLive )

numberOfActiveA = length(attributesLive);

lastColumnSum = sum(data(:, numberOfActiveA + 1));
parent = numberOfActiveA + 1;
root = struct('value', 'null', 'left0', 'null', 'right1', 'null');

% if the label remaining are all 0, then return 0.
if lastColumnSum == 0
    root.value = '0';
    return
end
%  if the label remaining are all 1, then return 1.
if lastColumnSum == len
    root.value = '1';
    return
end

% if there is no attribut which is activity, then return the larger label.
if sum(attributesLive) == 0
    if lastColumnSum >= len / 2
        root.value = '1';
    else
        root.value = '0';
    end
    return
end

parentEntropy = booleanEntropy(lastColumnSum,len - lastColumnSum);
Infgain = 0;
index = [];

for i=1:numberOfActiveA
    if (attributesLive(i)) % if this attribute is activity, then calculate its entropy.
        sum0 = 0; 
        sum0_1 = 0;
        sum1 = 0; 
        sum1_1 = 0;
        for j=1:len
            if data(j,i) 
                sum1 = sum1 + 1;
                if data(j, parent) 
                    sum1_1 = sum1_1 + 1;
                end
            else
                sum0 = sum0 + 1;
                if data(j, parent) 
                    sum0_1 = sum0_1 + 1;
                end
            end
        end
        curInfgain = parentEntropy - ((sum1/len)*booleanEntropy(sum1_1,sum1-sum1_1)) - ((sum0/len)*booleanEntropy(sum0_1,sum0-sum0_1));
        if curInfgain >= Infgain
            Infgain = curInfgain;
            index = i;
        end
    end
end


% set the value of this level of tree as bestAttribute.
root.value = attributes(index);
% remove this attribute from the activity attribute list.
attributesLive(index) = 0;

% divide the data base on the bestAttribute.
data_0= data(data(:,index)==0,:);
data_1= data(data(:,index)==1,:);

% the main label in data_0.
if isempty(data_0)
    leaf = struct('value', 'null', 'left0', 'null', 'right1', 'null');
    if lastColumnSum >= len / 2
        leaf.value = '1';
    else
        leaf.value = '0';
    end
    root.left0 = leaf;
else
    % recursive
    root.left0 = id3(data_0, attributes,length(data_0(:,1)), attributesLive);
end
% the main label in data_1
if isempty(data_1)
    leaf = struct('value', 'null', 'left0', 'null', 'right1', 'null');
    if lastColumnSum >= len / 2 
        leaf.value = '1';
    else
        leaf.value = '0';
    end
    root.right1 = leaf;
else
    % recursive
    root.right1 = id3(data_1, attributes, length(data_1(:,1)),attributesLive);
end

% when all attributes are not activity. 
return
end



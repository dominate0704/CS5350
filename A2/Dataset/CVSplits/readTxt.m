function result = readTxt(filename)
delimiterIn = ' ';
A = importdata(filename,delimiterIn);
% delimiterIn = ':';
% A = importdata(filename,delimiterIn);
A(cellfun(@(x) isnumeric(x) && isnan(x), A)) = {'NaN NaN'};
A = regexp(A,' ', 'split');
result = zeros(1658,71);
for i = 1:1658
    newline = regexp(A{i},':', 'split');
    line_combined=[newline{:}];
    for t = 1:length(line_combined)
        if t == 1
            result(i,71) = str2double(line_combined(t));
        elseif mod(t,2)==0
            row = str2double(line_combined(t));
        elseif mod(t,2)==1
            result(i,row) = str2double(line_combined(t)); 
        end
    end
end

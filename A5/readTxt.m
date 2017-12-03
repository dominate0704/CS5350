function table = readTxt(filename)
    fid = fopen(filename);
    dataline = fgetl(fid);
    index = 1;
    count =1;
    while ischar(dataline)
       dataline = regexp(dataline,' ', 'split');
       dataline = regexp(dataline,':', 'split');
       len = length(dataline(1,:));
       vector = [];
       for i = 1:len
           line_combined=[dataline{1,i}];
           cell_len = length(line_combined);
           if i == 1
               vector = [vector str2double(line_combined(1))];
               continue;
           end       
           if cell_len == 2
               vector = [vector str2double(line_combined(1))];
           end
       end
       table(count).line = vector;
       dataline = fgetl(fid);
       count= count+1; 
    end
    fclose(fid);
end

function LastName = findLastName( Name2, Name3, Name4 )
% Find the last name of these names.
%  
    LastName = Name2;
    for n = 1: length(1)
        LN3 = find(~cellfun(@isempty,Name3));
        for i = LN3
            LastName(i,1) = Name3(i,1);
        end
        LN4 = find(~cellfun(@isempty,Name4)); 
        for i = LN4
            LastName(i,1) = Name4(i,1);
        end
    end
end


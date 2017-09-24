function b = firstNameLonger( FirstName, LastName, b )
% if first name is longer than the lastName return 1.
    for n = 1: length(b)
        if cellfun('size',FirstName(n,1),2) >  cellfun('size',LastName(n,1),2)
                b(n,2) = 1;
        end
    end
end


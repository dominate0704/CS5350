function b = lastNameEven( LastName, len, b )
% Is the number of letters in their last name even?
    for n = 1: len
        str = LastName(n,1);
        c = char(str);
        if mod(length(c),2) == 0 
                b(n,7) = 1;
        end
    end
end


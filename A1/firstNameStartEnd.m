function b=  firstNameStartEnd( FirstName, len, b )
% if this column has middleName then return 1.
    for n = 1: len
        str = FirstName(n,1);
        c = char(str);
        if strcmpi(c(1),c(length(c)))
                b(n,4) = 1;
        end
    end
end

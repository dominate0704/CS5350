function b = firstNameBefore( FirstName, LastName, b )
% first name come alphabetically before their last name
    for n = 1: length(b)
        cL = char(LastName(n));
        cR = char(FirstName(n));
       if cL(1) - cR(1) > 0
           b(n,5) = 1;
       end
    end
end
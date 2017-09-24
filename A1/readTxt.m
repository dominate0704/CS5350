function data = readTxt(filename)
    [invite, FirstName, Name2,  Name3, Name4] = textread(filename,'%c %s %s %s %s');
    len= size(invite);
    b= zeros(len);
    LastName = findLastName(Name2, Name3, Name4);
    b = invited(invite,b,len);
    b = firstNameLonger(FirstName, LastName, b);
    b = haveMiddleName(LastName, Name2, len,b);
    b = firstNameStartEnd( FirstName, len,b);
    b = firstNameBefore( FirstName, LastName, b );
    b = firstNameSecondVowel( FirstName, b );
    b = lastNameEven(LastName, len, b);
    data = b;
    data(:,1:6) = b(:,2:7);
    data(:,7) = b(:,1);
end
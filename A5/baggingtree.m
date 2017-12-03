function  tree  = baggingtree( data, number_of_group, depth ,num_of_tree)
for t = 1:num_of_tree
    data = data(randperm(end));
    table =[];
    for i = 1:number_of_group
        x = data(i).line;
        x_len = length(x);
        x_new = zeros(70000,1);
        if x(1) == 1
            x_new(70000) = 1;
        else
            x_new(70000) = 0;
        end
        if x_len >1
            for j = 2:x_len
                x_new(x(j)) = 1;     
            end
        end
        table =[table;x_new'];
    end
    tree(t).node = id3Depth( table, 2:70000, ones(1,69999), depth );
end
end
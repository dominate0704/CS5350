function [svm_data] = SVMovertrees(tree, data)
    len = length(data);
    len_tree = length(tree);
    for row = 1:len(1)
        new_line = zeros(1,len_tree);
        x = data(row).line;
        x_len = length(x);
        x_new = zeros(1,70000);
        y = x(1);
        if x_len >1
            for j = 2:x_len
                x_new(x(j)) = 1;     
            end
        end
        for t = 1:len_tree
            curNode = tree(t).node;
            while curNode.value >1
                i = curNode.value;
                if x_new(i-1)
                    curNode = curNode.right1;
                else
                    curNode = curNode.left0;
                end         
            end
            i = curNode.value;
            if i == 1
                new_line(t) = 1;
            else
                new_line(t) = -1;
            end
        end
        new_line(len_tree+1) = y;
        svm_data(row).line = new_line;
    end
end
function[vector] = backDivide(A, b)
    if length(b) ~= size(A, 1)
           disp('Error: The length of vector b must be equal to the number of rows of A');
           return;
    else
        matrix = [A, b];
        counter = 0;
        for x = 1 : size(A, 1)% - 1 % do * for all column except the last
            
            % Pivoting
            % 1st step: deleting all zeros column
            while true
                if matrix(:, 1) == zeros(size(matrix, 1), 1)
                    matrix(:, 1) = [];
                else
                    break;
                end
            end
            % All other steps of pivoting
            counter = counter + 1;
            if matrix(counter, counter) == 0
                for y = counter + 1 : size(A, 1)
                    if matrix(y, counter) ~= 0
                        pivot = matrix(counter, :);
                        matrix(counter, :) = matrix(y, :);
                        matrix(y, :) = pivot;
                        break;
                    end
                end
            end
            
            for y = x + 1 : size(A, 1) % turn 1 column from the pivot down to end into 0 = *
                matrix(y, :) = matrix(y, :) + matrix(x, :) .* -matrix(y, x) / matrix(x, x);
            end
                
        end  
        % Turn diagonal into 1
        for x = 1 : size(A, 1) 
            matrix(x, :) = matrix(x, :) / matrix(x, x);
        end  
        
        % Take note of at least 1 row that is now all 0 except augmented part
        anotherCounter = 0;
        for i = 1 : size(matrix, 1)
            if matrix(i, 1 : size(matrix, 2) - 1) == zeros(1, size(matrix, 2) - 1) & matrix(i, size(matrix, 2)) ~= 0
                anotherCounter = anotherCounter + 1;
            end
        end
        % Delete rows that are now all 0
        while true
            if matrix(size(matrix, 1), :) == zeros(1, size(matrix, 2))
                matrix(size(matrix, 1), :) = [];
            else
                break;
            end
        end 
        
        if size(matrix, 1) > size(matrix, 2) - 1 || anotherCounter > 0
            disp('The system is overdetermined');
            return;
        elseif size(matrix, 1) < size(matrix, 2) - 1
            disp('The system is underdetermined');
            return;
        else
            % Back propagation
            vector = zeros(length(b), 1);
            vector(length(b)) = matrix(length(b), length(b) + 1);
            y = length(b) - 1;% 1st loop start
            while y >= 1
                adder = 0;
                x = length(b);% 2nd loop start
                while x >= y + 1
                    adder = adder + matrix(y, x) * vector(x);
                    x = x - 1;% 2nd loop count
                end
                vector(y) = matrix(y, length(b) + 1) - adder;
                y = y - 1;% 1st loop count
            end
        end
    end
end


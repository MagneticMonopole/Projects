function[matrix] = nonMultiple(A)
%     for x = 1 : size(A, 1)
%         for y = 1 : size(A, 1)
%             if theSame(A(x, :) ./ A(y, :)) && x ~= y
%                 A(x, :) = NaN;
%             end
%         end
%     end
    x = 1; y = 1; endX = size(A, 1); endY = size(A, 1);
    while x <= endX
        while y <= endY
            if theSame(A(x, :) ./ A(y, :)) && x ~= y
                A(x, :) = [];
                x = x - 1;
                y = y - 1;
                endX = endX - 1;
                endY = endY - 1;
            end
            y = y + 1;
        end
        x = x + 1;
    end
    matrix = A;
end
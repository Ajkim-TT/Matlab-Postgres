function [Valor] = EsPrimo(num)
if num<1
    Valor = false;
elseif num == 2
    Valor = true;
else
    for i = 2:1:num
        if mod(num,i) == 0
            Valor = false;
        end
    end
end
end
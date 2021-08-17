clc
clear

disp('Factore Primo más grande de 600851475143?')
factores = zeros;
contador = 0;
for i = 1:1:600851475144
    if mod(13195,i) == 0
        if isprime(i) == 1
            contador = contador + 1;
            factores(contador) = i;
        end
    end
end
disp(len(factores))

clc
clear
fileID = fopen('201630870_MATLAB.txt','a+');
datasource = "Parcial1";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'FactoresPrimos';

disp('Factores Primos de 13195')
factores = zeros;
contador = 0;
for i = 1:1:13196
    if mod(13195,i) == 0
        if isprime(i) == 1
            contador = contador + 1;
            factores(contador) = i;
        end
    end
end
texto = sprintf('\nLos Factores Primos de 13195 son:\n');
disp(texto)
disp(factores)
txt = sprintf('\n%d,',factores);
fprintf(fileID,txt);
largo = length(factores);
lita_t = string;
for i = 1:largo
    lita_t=strcat(lita_t,num2str(factores(i)));
    lita_t=strcat(lita_t,', ');
end
data = table(lita_t,'VariableNames',{'factores'});
sqlwrite(conn,tablename,data)

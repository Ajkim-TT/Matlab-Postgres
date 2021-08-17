clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'divnum';

disp('DIVISORES DE UN NUMERO')
try
    numero = input('Ingrese un número entero:\n');
    if numero < 0
        disp('El número ingresado es negativo')
    else
        divisores = zeros;
        contador = 0;
        for i  = 1:numero
            residuo = mod(numero,i);
            if residuo == 0
                contador = contador + 1;
                divisores(contador) = i;
            end
        end
        texto = sprintf('\nLos divisores de %d son',numero);
        fprintf(fileID,'\nLos divisores de %d son\n',numero);
        fprintf(fileID,'%d ',divisores);
        fprintf(fileID,'\n');
        disp(texto)
        disp(divisores)
        %divisores = string(divisores);
        largo = length(divisores);
        divisor = string;
        for i = 1:largo
            divisor=strcat(divisor,num2str(divisores(i)));
            divisor=strcat(divisor,', ');
        end
        data = table(numero,divisor,'VariableNames',{'numero' 'lista'});
        sqlwrite(conn,tablename,data)
    end
catch
    sprintf('El caracter ingresado no es un numero entero')
end
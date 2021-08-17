clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'compare3num';

disp('COMPARACIÓN DE 3 NUMEROS')
try
    numero1 = input('Primer Numero: ');
    numero2 = input('Segundo Numero: ');
    numero3 = input('Tercer Numero: ');

    if (numero1 > numero2) && (numero1 > numero3)
        if (numero2 ~= numero3)
            resultado = numero1+numero2+numero3;
            texto = sprintf('El primer numero es más grande, la suma de los 3 es %d',resultado);
            fprintf(fileID,'\nEl primer numero es más grande, la suma de los 3 es %d\n',resultado);
            data = table(numero1,numero2,numero3,"SUMA",resultado,'VariableNames',{'numero1' 'numero2' 'numero3' 'comparacion' 'resultado'});
            sqlwrite(conn,tablename,data)
            disp(texto)
        else
            texto = sprintf('El numero diferente es %d',numero1);
            fprintf(fileID,'\nEl numero diferente es %d\n',numero1);
            data = table(numero1,numero2,numero3,"PRIMERO DIFERENTE",numero1,'VariableNames',{'numero1' 'numero2' 'numero3' 'comparacion' 'resultado'});
            sqlwrite(conn,tablename,data)
            disp(texto)
        end
    elseif (numero2 > numero1) && (numero2 > numero3)
        if (numero1 ~= numero3)
            resultado = numero1*numero2*numero3;
            texto = sprintf('El segundo numero es más grande, la multiplicación de los 3 es %d',resultado);
            fprintf(fileID,'\nEl segundo numero es más grande, la multiplicación de los 3 es %d\n',resultado);
            data = table(numero1,numero2,numero3,"MULTIPLICACION",resultado,'VariableNames',{'numero1' 'numero2'
                'numero3' 'comparacion' 'resultado'});
            sqlwrite(conn,tablename,data)
            disp(texto)
        else
            texto = sprintf('El numero diferente es %d',numero2);
            fprintf(fileID,'\nEl numero diferente es %d\n',numero2);
            data = table(numero1,numero2,numero3,"SEGUNDO DIFERENTE",numero2,'VariableNames',{'numero1' 'numero2' 'numero3' 'comparacion' 'resultado'});
            sqlwrite(conn,tablename,data)
            disp(texto)
        end
    elseif (numero3 > numero1) && (numero3 > numero2)
        if (numero1 ~= numero2)
            %resultado = strcat(num2str(numero1),num2str(numero2),num2str(numero3));
            texto = sprintf('La concatenacion de los 3 es %d%d%d',numero1,numero2,numero3);
            fprintf(fileID,'\nLa concatenacion de los 3 es %d%d%d\n',numero1,numero2,numero3);
            text_aux = sprintf('%d%d%d',numero1,numero2,numero3);
            doble = str2double(text_aux);
            data = table(numero1,numero2,numero3,"CONCATENACION",doble,'VariableNames',{'numero1' 'numero2' 
                'numero3' 'comparacion' 'resultado'});
            sqlwrite(conn,tablename,data)
            disp(texto)
        else
            texto = sprintf('El numero diferente es %d',numero3);
            fprintf(fileID,'\nEl numero diferente es %d\n',numero3);
            data = table(numero1,numero2,numero3,"TERCERO DIFERENTE",numero3,'VariableNames',{'numero1' 'numero2' 
                'numero3' 'comparacion' 'resultado'});
            sqlwrite(conn,tablename,data)
            disp(texto)
        end
    else
        disp('Los numeros son iguales')
        fprintf(fileID,'\nLos numeros son iguales\n');
        data = table(numero1,numero2,numero3,"TODOS SON IGUALES",0,'VariableNames',{'numero1' 'numero2' 'numero3' 
            'comparacion' 'resultado'});
        sqlwrite(conn,tablename,data)
    end
catch
    sprintf('ERROR: CARACTER NO ES UN NUMERO')
end
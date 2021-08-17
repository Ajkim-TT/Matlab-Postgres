clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'fact_div7';

disp('CALCULAR DE NUMERO DIVISIBLE EXACTAMENTE EN 7')
accion = input('Qué desea hacer\n(I)ingresar Datos\nVer (H)istorial\n','s');

if accion == 'I' || accion == 'i'
    numero = input('INGRESE EL NUMERO ENTERO DIVISIBLE EN 7:\n');
    divisibilidad = mod(numero,7);
    if divisibilidad == 0
        texto = sprintf('El factorial del numero %d es %d',numero,factorial(numero));
        fprintf(fileID,'\nEl factorial del numero %d es %d\n',numero,factorial(numero));
        data = table(numero,factorial(numero),'VariableNames',{'numero' 'factorial'});
        sqlwrite(conn,tablename,data)
        disp(texto)
    else
        texto = sprintf('El numero no es divisible en 7');
        fprintf(fileID,'\nEl numero no es divisible en 7\n');
        disp(texto)
    end
elseif accion == 'H' || accion == 'h'
    disp('HISTORIAL')
    datos = sqlread(conn,tablename);
    disp(datos)
else
    disp('Opcion No Valida')
end
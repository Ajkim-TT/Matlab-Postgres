clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'sumadesde0';


disp('SUMA DESDE 0 HASTA UN NUMERO')
try
    numero = input('Ingrese un número: ');
    if numero<0
        disp('El número ingresado es negativo')
        fprintf(fileID,'\nEl número ingresado es negativo\n');
    else
        suma = 0;
        for i = 0:numero
            suma = suma+i;
        end
        texto= sprintf('La suma desde 0 hasta %d es %d',numero,suma);
        fprintf(fileID,'\nLa suma desde 0 hasta %d es %d\n',numero,suma);
        data = table(numero,suma,'VariableNames',{'numero' 'suma'});
        sqlwrite(conn,tablename,data)
        disp(texto)
    end
catch
    disp('ERROR: ')
end
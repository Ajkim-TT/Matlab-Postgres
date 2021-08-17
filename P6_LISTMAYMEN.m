clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'list_mame';

disp('LISTA DE NUMEROS DE MAYOR A MENOR')
numero1 = input('Ingrese el primer numero: ');
numero2 = input('Ingrese el segundo numero: ');

lista = zeros;

if numero1>numero2
    for i = 1:1+(numero1-numero2)
        lista(i) = numero1 - (i-1);
    end
    texto = sprintf('La lista de %d a %d',numero1,numero2);
    fprintf(fileID,'\nLa lista de %d a %d\n',numero1,numero2);
    fprintf(fileID,'%d ',lista);
    fprintf(fileID,'\n');
    disp(texto)
    disp(lista)
    largo = length(lista);
    lista_t = string;
    for i = 1:largo
        lista_t=strcat(lista_t,num2str(lista(i)));
        lista_t=strcat(lista_t,', ');
    end
    data = table(numero1,numero2,lista_t,'VariableNames',{'numero_mayor' 'numero_menor' 'lista'});
    sqlwrite(conn,tablename,data)
elseif numero2>numero1
    for i = 1:1+(numero2-numero1)
        lista(i) = numero2 - (i-1);
    end
    texto = sprintf('La lista de %d a %d',numero2,numero1);
    fprintf(fileID,'\nLa lista de %d a %d\n',numero2,numero1);
    fprintf(fileID,'%d ',lista);
    fprintf(fileID,'\n');
    disp(texto)
    disp(lista)
    largo = length(lista);
    lista_t = string;
    for i = 1:largo
        lista_t=strcat(lista_t,num2str(lista(i)));
        lista_t=strcat(lista_t,', ');
    end
    data = table(numero2,numero1,lista_t,'VariableNames',{'numero_mayor' 'numero_menor' 'lista'});
    sqlwrite(conn,tablename,data)
else
    disp('Los numeros son iguales')
end
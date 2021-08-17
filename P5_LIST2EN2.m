clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'lista2en2';

disp('LISTA DE NUMEROS DE 2 EN 2')
numero1 = input('Ingrese el primer numero: ');
numero2 = input('Ingrese el segundo numero: ');

lista = zeros;

if numero1>numero2
    for i = 1:1+(numero1-numero2)/2
        lista(i) = numero2 + 2*(i-1);
    end
    texto = sprintf('La lista de 2 en 2 de %d a %d',numero2,numero1);
    fprintf(fileID,'\nLa lista de 2 en 2 de %d a %d\n',numero2,numero1);
    fprintf(fileID,'%d ',lista);
    fprintf(fileID,'\n');
    disp(texto)
    disp(lista)
    largo = length(lista);
    lita_t = string;
    for i = 1:largo
        lita_t=strcat(lita_t,num2str(lista(i)));
        lita_t=strcat(lita_t,', ');
    end
    data = table(numero1,numero2,lita_t,'VariableNames',{'numero1' 'numero2' 'lista'});
    sqlwrite(conn,tablename,data)
elseif numero2>numero1
    for i = 1:1+(numero2-numero1)/2
        lista(i) = numero1 + 2*(i-1);
    end
    texto = sprintf('La lista de 2 en 2 de %d a %d',numero1,numero2);
    fprintf(fileID,'\nLa lista de 2 en 2 de %d a %d\n',numero1,numero2);
    fprintf(fileID,'%d ',lista);
    fprintf(fileID,'\n');
    disp(texto)
    disp(lista)
    largo = length(lista);
    lita_t = string;
    for i = 1:largo
        lita_t=strcat(lita_t,num2str(lista(i)));
        lita_t=strcat(lita_t,', ');
    end
    data = table(numero1,numero2,lita_t,'VariableNames',{'numero1' 'numero2' 'lista'});
    sqlwrite(conn,tablename,data)
else
    disp('Los numeros son iguales')
end
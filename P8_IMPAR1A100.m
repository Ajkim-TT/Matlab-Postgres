clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'par_impar';

disp('Numeros pares o impares de 1 al 100')
accion = input('Qué desea hacer?\n(E)legir lista\nVer (H)istorial\n','s');
if accion == 'E' || accion == 'e'
    opcion = input('Desea ver los numeros (p)ares o (i)mpares\n','s');
    if opcion == 'P' || opcion == 'p'
        npares = 0;
        contador = 0;
        pares = zeros;
        for i=1:100
            paridad = mod(i,2);
            if paridad == 0
                npares = npares + 1;
                contador = contador + 1;
                pares(contador) = i;
            end
        end
        texto = sprintf('La cantidad de numeros pares es %d y son',npares);
        fprintf(fileID,'\nLa cantidad de numeros pares es %d y son\n',npares);
        fprintf(fileID,'%d ',pares);
        fprintf(fileID,'\n');
        disp(texto)
        disp(pares)
        largo = length(pares);
        lista_t = string;
        for i = 1:largo
            lista_t=strcat(lista_t,num2str(pares(i)));
            lista_t=strcat(lista_t,', ');
        end
        data = table("P",npares,lista_t,'VariableNames',{'eleccion' 'cantidad' 'lista'});
        sqlwrite(conn,tablename,data)
    elseif opcion == 'I' || opcion == 'i'
        nimpares = 0;
        contador = 0;
        impares = zeros;
        for i=1:100
            paridad = mod(i,2);
            if paridad == 1
                nimpares = nimpares + 1;
                contador = contador + 1;
                impares(contador) = i;
            end
        end
        texto = sprintf('La cantidad de numeros impares es %d y son',nimpares);
        fprintf(fileID,'\nLa cantidad de numeros impares es %d y son\n',nimpares);
        fprintf(fileID,'%d ',impares);
        fprintf(fileID,'\n');
        disp(texto)
        disp(impares)
        largo = length(impares);
        lista_t = string;
        for i = 1:largo
            lista_t=strcat(lista_t,num2str(impares(i)));
            lista_t=strcat(lista_t,', ');
        end
        data = table("I",nimpares,lista_t,'VariableNames',{'eleccion' 'cantidad' 'lista'});
        sqlwrite(conn,tablename,data)
    else
        disp('La opcion no es valida')
    end
elseif accion == 'H' || accion == 'h'
    disp('HISTORIAL')
    datos = sqlread(conn,tablename);
    disp(datos)
else
    disp('Opcion no valida')
end
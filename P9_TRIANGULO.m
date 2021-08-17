clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'triangulo_s';

disp('DETERMINAR EL TRIANGULO POR SUS TRES LADOS ')
accion = input('Qué desea hacer?\n(I)ngresar Datos\nVer (H)istorial\n','s');
if accion == 'I' || accion == 'i'
    lado1 = input('Ingrese el primer lado del triángulo: \n');
    lado2 = input('Ingrese el segundo lado del triángulo: \n');
    lado3 = input('Ingrese el tercer lado del triángulo: \n');

    if lado1 == lado2 && lado2 == lado3
        texto = sprintf('El triangulo de lados %d,%d,%d, es EQUILATERO',lado1,lado2,lado3);
        fprintf(fileID,'\nEl triangulo de lados %d,%d,%d, es EQUILATERO\n',lado1,lado2,lado3);
        data = table(lado1,lado2,lado3,"EQUILATERO",'VariableNames',{'lado1' 'lado2' 'lado3' 'triangulo'});
        sqlwrite(conn,tablename,data)
        disp(texto)
    elseif lado1 ~= lado2 && lado2 ~= lado3 && lado1 ~= lado3
        texto = sprintf('El triangulo de lados %d,%d,%d, es ESCALENO',lado1,lado2,lado3);
        fprintf(fileID,'\nEl triangulo de lados %d,%d,%d, es ESCALENO\n',lado1,lado2,lado3);
        data = table(lado1,lado2,lado3,"ESCALENO",'VariableNames',{'lado1' 'lado2' 'lado3' 'triangulo'});
        sqlwrite(conn,tablename,data)
        disp(texto)
    else
        texto = sprintf('El triangulo de lados %d,%d,%d, es ISOSELES',lado1,lado2,lado3);
        fprintf(fileID,'\nEl triangulo de lados %d,%d,%d, es ISOSELES\n',lado1,lado2,lado3);
        data = table(lado1,lado2,lado3,"ISOSELES",'VariableNames',{'lado1' 'lado2' 'lado3' 'triangulo'});
        sqlwrite(conn,tablename,data)
        disp(texto)
    end
elseif accion == 'H' || accion == 'h'
    disp('HISTORIAL')
    datos = sqlread(conn,tablename);
    disp(datos)
else
    disp('Accion No Valida')
end
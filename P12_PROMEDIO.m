clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'promediando';

disp('CALCULAR EL PROMEDIO DE NOTAS')
accion = input('Qué desea hacer?\n(I)ngresar Datos\nVer (H)istorial\n','s');
if accion == 'I' || accion == 'i'
    nota1 = input('Ingrese la primera nota:\n');
    nota2 = input('Ingrese la segunda nota:\n');
    nota3 = input('Ingrese la tercera nota:\n');

    if nota1<0 || nota2<0 || nota3<0
        disp('Nota Negativa. USTED ES UN MAL CATEDRÁTICO')
    else
        promedio = (nota1+nota2+nota3)/3;
        if promedio >= 60
            textopromedio = sprintf('El almuno está APROBADO y su promedio es %d',promedio);
            fprintf(fileID,'\nEl alumno con notas %d,%d,%d, fue APROBADO con un promedio de %d\n',nota1,nota2,nota3,promedio);
            data = table(nota1,nota2,nota3,promedio,"APROBADO",'VariableNames',{'nota1' 'nota2' 'nota3' 'promedio' 'estado'});
            sqlwrite(conn,tablename,data)
            disp(textopromedio)
        else
            textopromedio = sprintf('El almuno está REPROBADO y su promedio es %d',promedio);
            fprintf(fileID,'\nEl alumno con notas %d,%d,%d, fue REPROBADO con un promedio de %d\n',nota1,nota2,nota3,promedio);
            data = table(nota1,nota2,nota3,promedio,"REPROBADO",'VariableNames',{'nota1' 'nota2' 'nota3' 'promedio' 'estado'});
            sqlwrite(conn,tablename,data)
            disp(textopromedio)  
        end
    end
elseif accion == 'H' || accion == 'h'
    disp('HISTORIAL')
    datos = sqlread(conn,tablename);
    disp(datos)
else
    disp('Accion No Valida')
end
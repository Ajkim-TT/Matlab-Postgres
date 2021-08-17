clear
clc
fileID = fopen('201630870_MATLAB.txt','a+');
datasource = "Parcial1";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'numerosnaturales10';

disp('Operacion de los primeros 10 numeros naturales')
sumadecuadrados_int = 0;
cuadradodesumas_int = 0;
sumadecuadrados_str = string;
cuadradodesumas_str = string;

for i = 1:10
    if i < 10
        sumadecuadrados_int = sumadecuadrados_int + i^2;
        sumadecuadrados_str = sumadecuadrados_str + i + '^2 + ';
    else
        sumadecuadrados_int = sumadecuadrados_int + i^2;
        sumadecuadrados_str = sumadecuadrados_str + i + '^2';
    end 
end
for i = 1:10
    if i < 10
        cuadradodesumas_int = cuadradodesumas_int + i;
        cuadradodesumas_str = cuadradodesumas_str + i + ' + ';
    else
        cuadradodesumas_int = cuadradodesumas_int + i;
        cuadradodesumas_str = cuadradodesumas_str + i;
    end 
end
cuadradodesumas_int = cuadradodesumas_int^2;
texto1 = sprintf('El la suma de cuadrados de los primeros 10 numeros naturales es \n %s = %d',sumadecuadrados_str,sumadecuadrados_int);
disp(texto1)
texto2 = sprintf('El cuadrado de la suma de los primeros 10 numeros naturales es \n (%s)^2 = %d',cuadradodesumas_str,cuadradodesumas_int);
disp(texto2)
texto3 = sprintf('Por lo tanto la diferencia entre la suma de los cuadrado\nde los primeros 10 numeros y el cuadrado de la suma es\n%d',cuadradodesumas_int-sumadecuadrados_int);
disp(texto3)
fprintf(fileID,texto1);
fprintf(fileID,texto2);
fprintf(fileID,texto3);
data = table(sumadecuadrados_int,cuadradodesumas_int,cuadradodesumas_int-sumadecuadrados_int,'VariableNames',{'sumadecuadrados' 'cuadradodesumas' 'diferencia'});
sqlwrite(conn,tablename,data)

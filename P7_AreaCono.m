clear
clc
fileID = fopen('201630870_MATLAB.txt','a+');
datasource = "Parcial1";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'cono';

radio = input('Ingrese el Radio del cono\n');
altura = input('Ingrese la Altura del cono\n');
generatriz = input('Ingrese la Generatriz del cono\n');

area_base = (radio^2)*(pi);
area_lateral = pi*radio*generatriz;
area_total = area_base + area_lateral;
volumen = (pi/3)*(radio^2)*(altura);

texto1 = sprintf('\nEl area de la base del cono es: %d',area_base);
disp(texto1)
texto2 = sprintf('\nEl area lateral del cono es: %d',area_lateral);
disp(texto2)
texto3 = sprintf('\nEl area total del cono es: %d',area_total);
disp(texto3)
texto4 = sprintf('\nEl volumen del cono es: %d',volumen);
disp(texto4)
fprintf(fileID,texto1);
fprintf(fileID,texto2);
fprintf(fileID,texto3);
fprintf(fileID,texto4);
data = table(area_base,area_lateral,area_total,volumen,'VariableNames',{'area_base' 'area_lateral' 'area_total' 'volumen'});
sqlwrite(conn,tablename,data)

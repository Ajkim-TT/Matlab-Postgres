clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'cuentavocal';

disp('CONTADOR DE VOCALES')
palabra = input('Ingrese una palabra: ','s');
voc = 0;
for i = 1:length(palabra)
    if palabra(1,i) == 'A' || palabra(1,i) == 'E' || palabra(1,i) == 'I' || palabra(1,i) == 'O' || palabra(1,i) == 'U'
        voc = voc+1;
    elseif palabra(1,i) == 'a' || palabra(1,i) == 'e' || palabra(1,i) == 'i' || palabra(1,i) == 'o' || palabra(1,i) == 'u'
        voc = voc+1;
    end
end
texto = sprintf('La cantidad de vocales en la palabra %s es %d',palabra,voc);
fprintf(fileID,'\nLa cantidad de vocales en la palabra %s es %d\n',palabra,voc);
palabra = string(palabra);
data = table(palabra,voc,'VariableNames',{'palabra' 'cantidad'});
sqlwrite(conn,tablename,data)
disp(texto)

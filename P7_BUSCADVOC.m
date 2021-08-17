clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'busca_cada_vocal';

disp('BUSCADOR DE CADA VOCAL')
palabra = input('Ingrese una palabra: ','s');
voca = 0;
voce = 0;
voci = 0;
voco = 0;
vocu = 0;
for i = 1:length(palabra)
    if palabra(1,i) == 'A' || palabra(1,i) == 'a' 
        voca = voca+1;
    elseif palabra(1,i) == 'E'|| palabra(1,i) == 'e'
        voce = voce+1;
    elseif palabra(1,i) == 'I'|| palabra(1,i) == 'i'
        voci = voci+1;
    elseif palabra(1,i) == 'O'|| palabra(1,i) == 'o'
        voco = voco+1;
    elseif palabra(1,i) == 'U'|| palabra(1,i) == 'u'
        vocu = vocu+1;
    end
end
texto = sprintf('Las vocales presentes en la palabra "%s" son',palabra);
fprintf(fileID,'\nLas vocales presentes en la palabra "%s" son\n',palabra);
textoa = sprintf('Vocal A: %d',voca);
fprintf(fileID,'Vocal A: %d\n',voca);
textoe = sprintf('Vocal E: %d',voce);
fprintf(fileID,'Vocal E: %d\n',voce);
textoi = sprintf('Vocal I: %d',voci);
fprintf(fileID,'Vocal I: %d\n',voci);
textoo = sprintf('Vocal O: %d',voco);
fprintf(fileID,'Vocal O: %d\n',voco);
textou = sprintf('Vocal U: %d',vocu);
fprintf(fileID,'Vocal U: %d\n',vocu);
disp(texto)
disp(textoa)
disp(textoe)
disp(textoi)
disp(textoo)
disp(textou)
palabra = string(palabra);
data = table(palabra,voca,voce,voci,voco,vocu,'VariableNames',{'palabra' 'vocal_a' 'vocal_e' 'vocal_i' 'vocal_o' 'vocal_u'});
sqlwrite(conn,tablename,data)
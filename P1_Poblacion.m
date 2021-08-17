clear
clc
fileID = fopen('201630870_MATLAB.txt','a+');
datasource = "Parcial1";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'poblacion';

N = input('Ingrese la cantidad de personas\n');

if N < 0
    disp('Debe ingresar un número positivo')
else
    NM = 0;
    NF = 0;
    prom_W_M = 0;
    prom_H_M = 0;
    prom_W_F = 0;
    prom_H_F = 0;
    prom_W_G = 0;
    prom_H_G = 0;
    while j<N
        j = j+1;
        t1 = sprintf('Ingrese el peso de la persona numero %d en libras',j);
        disp(t1)
        peso = input('');
        t2 = sprintf('Ingrese la altura de la persona numero %d en metros',j);
        disp(t2)
        altura = input('');
        t3 = sprintf('Ingrese el género de la persona numero %d \nM o m = Masculino\nF o f = Femenino',j);
        disp(t3)
        genero = input('','s');
        prom_W_G = prom_W_G + peso;
        prom_H_G = prom_H_G + altura;
        if genero == 'M' || genero == 'm'
            NM = NM +1;
            prom_W_M = prom_W_M + peso;
            prom_H_M = prom_H_M + altura;
        elseif  genero == 'F' || genero == 'f'
            NF = NF + 1;
            prom_W_F = prom_W_F + peso;
            prom_H_F = prom_H_F + altura;
        else
            disp('Género Inválido')
            disp('Programa Reiniciado')
            NM = 0;
            NF = 0;
            prom_W_M = 0;
            prom_H_M = 0;
            prom_W_F = 0;
            prom_H_F = 0;
            prom_W_G = 0;
            prom_H_G = 0;
            j = 0;
        end
    end
    if NM ~= 0 && NF == 0
        prom_W_M = prom_W_M/NM;
        prom_H_M = prom_H_M/NM;
        texto1 = sprintf('El promedio de peso masculino es %d',prom_W_M);
        texto2 = sprintf('El promedio de altura masculino es %d',prom_H_M);
        texto3 = sprintf('El promedio de peso general es %d',prom_W_M);
        texto4 = sprintf('El promedio de altura general es %d',prom_H_M);
        disp(texto1)
        disp(texto2)
        disp(texto3)
        disp(texto4)
        fprintf(fileID,'\nEl promedio de peso masculino es %d\n',prom_W_M);
        fprintf(fileID,'\nEl promedio de altura masculino es %d\n',prom_H_M);
        fprintf(fileID,'\nEl promedio de peso general es %d\n',prom_W_M);
        fprintf(fileID,'\nEl promedio de altura general es %d\n',prom_H_M);
        data = table(prom_W_M,prom_H_M,prom_W_M,prom_H_M,'VariableNames',{'prom_peso_general' 'prom_altura_general' 'prom_peso_masculino' 'prom_altura_masculino'});
        sqlwrite(conn,tablename,data)
    elseif NF ~= 0 && NM == 0
        prom_W_F = prom_W_F/NF;
        prom_H_F = prom_H_F/NF;
        texto1 = sprintf('El promedio de peso masculino es %d',(prom_W_F));
        texto2 = sprintf('El promedio de altura masculino es %d',(prom_H_F));
        texto3 = sprintf('El promedio de peso general es %d',(prom_W_F));
        texto4 = sprintf('El promedio de altura general es %d',(prom_H_F));
        disp(texto1)
        disp(texto2)
        disp(texto3)
        disp(texto4)
        fprintf(fileID,'\nEl promedio de peso femenino es %d\n',prom_W_F);
        fprintf(fileID,'\nEl promedio de altura femenino es %d\n',prom_H_F);
        fprintf(fileID,'\nEl promedio de peso general es %d\n',prom_W_F);
        fprintf(fileID,'\nEl promedio de altura general es %d\n',prom_H_F);
        data = table(prom_W_F,prom_H_F,prom_W_F,prom_H_F,'VariableNames',{'prom_peso_general' 'prom_altura_general' 'prom_peso_femenino' 'prom_altura_femenino'});
        sqlwrite(conn,tablename,data)
    else
        prom_W_F = prom_W_F/NF;
        prom_H_F = prom_H_F/NF;
        prom_W_M = prom_W_M/NM;
        prom_H_M = prom_H_M/NM;
        prom_W_G = prom_W_G/N;
        prom_H_G = prom_H_G/N;
        texto1 = sprintf('El promedio de peso masculino es %d',(prom_W_M));
        texto2 = sprintf('El promedio de altura masculino es %d',(prom_H_M));
        texto3 = sprintf('El promedio de peso femenino es %d',(prom_W_F));
        texto4 = sprintf('El promedio de altura femenino es %d',(prom_H_F));
        texto5 = sprintf('El promedio de peso general es %d',(prom_W_G));
        texto6 = sprintf('El promedio de altura general es %d',(prom_H_G));
        disp(texto1)
        disp(texto2)
        disp(texto3)
        disp(texto4)
        disp(texto5)
        disp(texto6)
        fprintf(fileID,'\nEl promedio de peso femenino es %d\n',prom_W_F);
        fprintf(fileID,'\nEl promedio de altura femenino es %d\n',prom_H_F);
        fprintf(fileID,'\nEl promedio de peso general es %d\n',prom_W_F);
        fprintf(fileID,'\nEl promedio de altura general es %d\n',prom_H_F);
        data = table(prom_W_G,prom_H_G,prom_W_M,prom_H_M,prom_W_F,prom_H_F,'VariableNames',{'prom_peso_general' 'prom_altura_general' 'prom_peso_masculino' 'prom_altura_masculino' 'prom_peso_femenino' 'prom_altura_femenino'});
        sqlwrite(conn,tablename,data)
    end
end
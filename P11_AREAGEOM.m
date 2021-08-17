clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
disp('CALCULAR ÁREA DE FIGURAS GEOMÉTRICAS')
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'areas_geo';

accion = input('Qué desea hacer?\n(I)ngresar Datos\nVer (H)istorial\n','s');
if accion == 'I' || accion == 'i'
    figura = input('Elija la figura\n1.(Ci)rculo\n2.(Cu)adrado\n3.(R)ectangulo\n4.(T)riangulo\n');
    switch figura
        case 1
            disp('Calcular Área de Crículo')
            radio = input('Ingrese el Radio del círculo\n');
            area = pi*radio^2;
            text = sprintf('El área del circulo de radio %d es %d unidades cuadradas',radio,area);
            fprintf(fileID,'\nEl área del circulo de radio %d es %d unidades cuadradas\n',radio,area);
            data = table("Circulo",radio,0,area,'VariableNames',{'forma' 'dimension1' 'dimension2' 'area'});
            sqlwrite(conn,tablename,data)
            disp(text)
        case 2
            disp('Calcular Área de Cuadrado')
            lado = input('Ingrese el Lado del cuadrado\n');
            area = lado^2;
            text = sprintf('El área del cuadrado de lado %d es %d unidades cuadradas',lado,area);
            fprintf(fileID,'\nEl área del cuadrado de lado %d es %d unidades cuadradas\n',lado,area);
            data = table("Cuadrado",lado,0,area,'VariableNames',{'forma' 'dimension1' 'dimension2' 'area'});
            sqlwrite(conn,tablename,data)
            disp(text)
        case 3
            disp('Calcular Área de Rectángulo')
            base = input('Ingrese la Base del rectángulo\n');
            altura = input('Ingrese la Altura del rectángulo\n');
            area = base*altura;
            text = sprintf('El área del rectángulo de base %d y altura %d es %d unidades cuadradas',base,altura,area);
            fprintf(fileID,'\nEl área del rectángulo de base %d y altura %d es %d unidades cuadradas\n',base,altura,area);
            data = table("Rectangulo",base,altura,area,'VariableNames',{'forma' 'dimension1' 'dimension2' 'area'});
            sqlwrite(conn,tablename,data)
            disp(text)
        case 4
            disp('Calcular Área de Triángulo')
            base = input('Ingrese la Base del triángulo\n');
            altura = input('Ingrese la Altura del triángulo\n');
            area = base*altura*0.5;
            text = sprintf('El área del triángulo de base %d y altura %d es %d unidades cuadradas',base,altura,area);
            fprintf(fileID,'\nEl área del triángulo de base %d y altura %d es %d unidades cuadradas\n',base,altura,area);
            data = table("Triangulo",base,altura,area,'VariableNames',{'forma' 'dimension1' 'dimension2' 'area'});
            sqlwrite(conn,tablename,data)
            disp(text)
    end
elseif accion == 'H' || accion == 'h'
    disp('HISTORIAL')
    datos = sqlread(conn,tablename);
    disp(datos)
else
    disp('Accion No Valida')
end
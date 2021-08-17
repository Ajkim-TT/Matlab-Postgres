clear
clc
fileID = fopen('INFORMACION_TAXIS.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'bdd_taxis';


disp('BASE DE DATOS DE TAXIS')
opcion = input('¿Qué desea hacer?\n1.Ingresar Informacion\n2.Ver Historial\n');
switch opcion
    case 1
        disp('INGRESAR INFORMACION DE TAXIS')
        anio = input('Ingrese el modelo del vehículo(años):\n');
        recorrido = input('Ingrese le kilometraje del vehículo(kms):\n');
        if anio <0 || recorrido <0
            disp('Datos Incorrectos. VALORES NEGATIVOS')
        elseif anio<2007 && recorrido > 20000
            disp('DEBE RENOVARSE')
            fprintf(fileID,'\nAÑO: %d KILOMETRAJE: %d DEBE RENOVARSE\n',anio,recorrido);
            data = table(anio,recorrido,"DEBE RENOVARSE",'VariableNames',{'anio' 'recorrido' 'estado'});
            sqlwrite(conn,tablename,data)
        elseif anio >= 2007 && anio <= 2013 && recorrido == 20000
            disp('DEBE RECIBIR MANTENIMIENTO')
            fprintf(fileID,'\nAÑO: %d KILOMETRAJE: %d DEBE RECIBIR MANTENIMIENTO\n',anio,recorrido);
            data = table(anio,recorrido,"DEBE RECIBIR MANTENIMIENTO",'VariableNames',{'anio' 'recorrido' 'estado'});
            sqlwrite(conn,tablename,data)
        elseif anio > 2013 && recorrido < 10000
            disp('ESTA EN OPTIMAS CONDICIONES')
            fprintf(fileID,'\nAÑO: %d KILOMETRAJE: %d ESTA EN OPTIMAS CONDICIONES\n',anio,recorrido);
            data = table(anio,recorrido,"ESTA EN OPTIMAS CONDICIONES",'VariableNames',{'anio' 'recorrido' 'estado'});
            sqlwrite(conn,tablename,data)
        else
            disp('MECANICO')
            fprintf(fileID,'\nAÑO: %d KILOMETRAJE: %d MECANICO\n',anio,recorrido);
            data = table(anio,recorrido,"MECANICO",'VariableNames',{'anio' 'recorrido' 'estado'});
            sqlwrite(conn,tablename,data)
        end
    case 2
        disp('HISTORIAL')
        datos = sqlread(conn,tablename);
        disp(datos)
        %type INFORMACION_TAXIS.txt
    otherwise
        disp('OPCION NO EXISTE')
end
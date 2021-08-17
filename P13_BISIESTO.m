clear
clc
fileID = fopen('TareaPrimerParcialMATLAB.txt','a+');
datasource = "BASEDEDATOS";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'anios_bis';

disp('DETERMINAR SI EL AÑO ES BISIESTO')
accion = input('Qué desea hacer?\n(I)ngresar Datos\nVer (H)istorial\n','s');
if accion == 'I' || accion == 'i'
    anio = input('Ingrese el año\n');
    if anio<0
        disp('Los años datos anteriores al año 0 son imprecisos')
    else
        if mod(anio,4) == 0
            if mod(anio,100) == 0
                if mod(anio,400) == 0
                    textobisiesto = sprintf('El año %d SI fue un año bisiesto',anio);
                    fprintf(fileID,'\nEl año %d SI fue un año bisiesto\n',anio);
                    data = table(anio,"SI FUE BISIESTO",'VariableNames',{'anio' 'bisiesto'});
                    sqlwrite(conn,tablename,data)
                    disp(textobisiesto) 
                else
                    textobisiesto = sprintf('El año %d NO fue un año bisiesto',anio);
                    fprintf(fileID,'\nEl año %d NO fue un año bisiesto\n',anio);
                    data = table(anio,"NO FUE BISIESTO",'VariableNames',{'anio' 'bisiesto'});
                    sqlwrite(conn,tablename,data)
                    disp(textobisiesto) 
                end
            else
               textobisiesto = sprintf('El año %d SI fue un año bisiesto',anio);
               fprintf(fileID,'\nEl año %d SI fue un año bisiesto\n','anio');
               data = table(anio,"SI FUE BISIESTO",'VariableNames',{'anio' 'bisiesto'});
               sqlwrite(conn,tablename,data)
               disp(textobisiesto) 
            end
        else
            textobisiesto = sprintf('El año %d NO fue un año bisiesto',anio);
            fprintf(fileID,'\nEl año %d NO fue un año bisiesto\n',anio);
            data = table(anio,"NO FUE BISIESTO",'VariableNames',{'anio' 'bisiesto'});
            sqlwrite(conn,tablename,data)
            disp(textobisiesto)
        end
    end
elseif accion == 'H' || accion == 'h'
    disp('HISTORIAL')
    datos = sqlread(conn,tablename);
    disp(datos)
else
    disp('Accion No Valida')
end
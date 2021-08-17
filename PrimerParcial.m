clear
clc
disp('Bienvenido a la selección de programas para el primer parcial.')
disp('Seleccione el programa que desea probar.')
flag = 1;
while flag 
    try
        clc
        menu = sprintf('1.Información de Población\n2.Operación con los 10 primeros números naturales\n3.La diferencia entre la suma de los 100 primeros numeros naturales\n4.Los factores primos de 13195\n5.¿Cuál es el factor primo más grande de 600851475143?\n6.Suseción de Fibonacci\n7.Areas de un cono\nOtro.Salir');
        disp(menu)
        programa = input('PROGRAMA: \n');
        switch programa
            case 1
                P1_Poblacion
                fclose(fileID);
                close(conn)
            case 2
                P2_NumerosNaturales10
                close(conn)
                fclose(fileID);
            case 3
                P3_NumerosNaturales100
                close(conn)
                fclose(fileID);
            case 4
                P4_FactoresPrimos13195
                close(conn)
                fclose(fileID);
            case 5
                P5_Factor600851475143
            case 6
                P6_Fibonacci
                close(conn)
                fclose(fileID);
            case 7
                P7_AreaCono
                close(conn)
                fclose(fileID);
            otherwise
                break
        end
        continuar = input('Desea continuar?(S/N)\n','s');
        if continuar == 'S' || continuar == 's'
            flag = 1;
        elseif continuar == 'N' || continuar == 'n'
            clear
            clc
            flag = 0;
        end
    catch
       disp('Caracter Incorrecto') 
       fclose(fileID);
       flag = 1;
    end
end

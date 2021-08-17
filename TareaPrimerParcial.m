clear
clc
disp('Bienvenido a la selección de programas para el primer parcial.')
disp('Seleccione el programa que desea probar.')
flag = 1;
while flag 
    try
        clc
        menu = sprintf('1.COMPARACIÓN DE 3 NUMEROS\n2.DIVISORES DE UN NUMERO\n3.CONTADOR DE VOCALES\n4.SUMA DESDE 0 HASTA UN NUMERO\n5.LISTA DE NUMEROS DE 2 EN 2\n6.LISTA DE NUMEROS DEL MAYOR AL MENOR\n7.BUSCADOR DE CADA VOCAL\n8.NUMEROS IMPARES DEL 1 AL 100\n9.TRES LADOS DEL TRIANGULO\n10.FACTORIAL DE NUMERO DIVISIBLE ENTRE 7\n11.CALCULAR AREA DE FIGURAS GEOMÉTRICAS\n12.PROMEDIO DE NOTAS\n13.DETERMINAR SI EL AÑO FUE BICIESTO\n14.Base de Datos de Taxis\nOtro - Salir\n');
        disp(menu)
        programa = input('PROGRAMA: \n');
        switch programa
            case 1
                P1_COMP3NUM
                fclose(fileID);
                close(conn)
            case 2
                P2_DIVNUM
                fclose(fileID);
                close(conn)
            case 3
                P3_CONTVOC
                fclose(fileID);
                close(conn)
            case 4
                P4_SUM0ANUM
                fclose(fileID);
                close(conn)
            case 5
                P5_LIST2EN2
                fclose(fileID);
                close(conn)
            case 6
                P6_LISTMAYMEN
                fclose(fileID);
                close(conn)
            case 7
                P7_BUSCADVOC
                fclose(fileID);
                close(conn)
            case 8
                P8_IMPAR1A100
                fclose(fileID);
                close(conn)
            case 9
                P9_TRIANGULO
                fclose(fileID);
                close(conn)
            case 10
                P10_FACT7DIV
                fclose(fileID);
                close(conn)
            case 11
                P11_AREAGEOM
                fclose(fileID);
                close(conn)
            case 12
                P12_PROMEDIO
                fclose(fileID);
                close(conn)
            case 13
                P13_BISIESTO
                fclose(fileID);
                close(conn)
            case 14
                P14_BDDTAXIS
                fclose(fileID);
                close(conn)
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

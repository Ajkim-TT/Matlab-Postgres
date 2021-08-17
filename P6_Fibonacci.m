clc
clear
disp('Suceción de Fibonacci')
fileID = fopen('201630870_MATLAB.txt','a+');
datasource = "Parcial1";
username = "postgres";
password = "ajkimtepaz";
conn = database(datasource,username,password);
tablename = 'Fibobibo';
try
    n = input('Ingrese un número entero: ');
    if n<0
        disp('Debe Ingresar un Número Positivo')
    else
        fibo = zeros;
        n1 = 0;
        n2 = 1;
        if n == 0
            fibo = 0;
            disp('La suseción de Fibonacci hasta 0 es:')
            disp(fibo)
        elseif n ==1
            fibo = [0 1];
            disp('La suseción de Fibonacci hasta 1 es:')
            disp(fibo)
        else
            fibo = [0 1];
            contador = 2;
            for i = 2:1:n
                
                nth = n1 + n2;
                n1 = n2;
                n2 = nth;
                contador = contador +1;
                fibo(contador) = nth;
            end
            txt = sprintf('La suseción de fibonacci hasta %d es:\n',n);
            disp(txt)
            disp(fibo)
        end
        
        largo = length(fibo);
        susecion = string;
        for i = 1:largo
            susecion=strcat(susecion,num2str(fibo(i)));
            susecion=strcat(susecion,', ');
        end
        txt = sprintf('\nSuseción de Fibonacci hasta %d es: %s',n,susecion);
        fprintf(fileID,txt);
        data = table(n,susecion,'VariableNames',{'numero_limite' 'suseciones'});
        sqlwrite(conn,tablename,data)
    end
catch
    disp('Debe Ingresar un Número Entero')
end
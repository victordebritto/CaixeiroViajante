function [Maior,Menor,x,y,nCidades,atual,Distancias,z] = read

    [nome , caminho] = uigetfile ({'*.tsp', 'Arquivo .tsp'},'Selecione o Arquivo.');
    
    if isequal(nome,0) || isequal(caminho,0)
        disp('Erro ao tentar ler arquivo')
    else
        arquivo = strcat(caminho,nome);
        [fid] = fopen(arquivo,'r');
        
        for i=1:6
            if i == 4
                fscanf(fid,'%s',2);
                nCidades=fscanf(fid,'%d',1);
                fgetl(fid);
            else
                fgetl(fid);
            end
            
        end
        Maior = 0;
        Menor = 1000000000;
        for i=1:nCidades
            atual(i) = fscanf(fid,'%d',1); %cidade atual 
            x(i) = fscanf(fid,'%e',1); % coluna 1
            y(i) = fscanf(fid,'%e',1); % coluna 2
            if Maior < y(i)
                Maior = y(i) + 480;
            end
            if Menor > x(i)
                Menor = x(i) - 400;
            end
        end
        fclose(fid); % fecha o arquivo
        clc;
        fprintf('\tO arquivo possui %d cidades,\n\tLevará algum tempo para calcular as distancias relativas, \n\tAguarde o fim da leitura...\n\t\n',nCidades)
        pause(2);
        
        for i=1:nCidades
            for j=i:nCidades
                Distancias(i,j)=sqrt(((x(i)-x(j))^2)+((y(i)-y(j))^2));
            end
        end
        disp('Digonal superior foi calculada');
        
        for i=1:nCidades
            z(i,1)=x(i);
            z(i,2)=y(i);
            
        end
        principal;

    end
end
menu1 = menu('Busca Tabu - Problema do Caixeiro Viajante','Ler arquivo','Melhor Caminho','Sair');

switch menu1
    case 1
        [Maior,Menor,x,y,nCidades,atual,Distancias,z] = read;
    case 2
        tabu(nCidades,Distancias,z,Maior,Menor);
    case 3
        break;
end
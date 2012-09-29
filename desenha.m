function desenha(z,melhorCamin,menDist,p,f,Maior,Menor)
    nCidades=size(z,1);
        for i=1:nCidades-1
            plot([z(melhorCamin(i),1),z(melhorCamin(i+1),1)],[z(melhorCamin(i),2),z(melhorCamin(i+1),2)],'bs-','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k');
            hold on;
        end
    plot([z(melhorCamin(nCidades),1),z(melhorCamin(1),1)],[z(melhorCamin(nCidades),2),z(melhorCamin(1),2)],'bs-','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','k');
    title([num2str(nCidades),' Cidades Pesquisadas']);
        if f==0
            text(Menor,Maior,[' ',int2str(p),' iterações realizadas',' - Menor distância encontrada foi:  ',num2str(menDist)]);
        else
            text(Menor,Maior,['Menor distância pesquisada ',num2str(menDist)]);
        end
    zoom off
    hold off;
    pause(0.01); 
end


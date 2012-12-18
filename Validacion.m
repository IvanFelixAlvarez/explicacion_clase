function e=Validacion()
    x=0;
    for i=1:72
        for j=1:15
            aux = imread(['Rostro_' num2str(i) '.' num2str(j) '.jpg']);
            a=MatrizValidacion(i,j);
            r=ReconocePatrones(a,aux);
            if(r==i)
                x=x+1;
            end
        end
        e(i)=(x*100)/15;
        x=0;
    end
    y=randperm(72);
    for h=1:15
        aux = imread(['Rostro_' num2str(y(1)) '.' num2str(h) '.jpg']);
        a=PatronesMedios();
        r=ReconocePatrones(a,aux);
        if(r==h)
            x=x+1;
        end
        e(73)=(x*100)/15;
    end
end
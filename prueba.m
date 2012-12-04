function tp = prueba(Patrones)
res = 0;
    for i=1:72
        aux = imread(['Rostro_' num2str(i) '.' num2str(5) '.jpg']);
        l = ReconocePatrones(Patrones, aux);
        if(l == i)
            res = res+1;
        end
    end
    res
    tp = (res*100)/72;
end
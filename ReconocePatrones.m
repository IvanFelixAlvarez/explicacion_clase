function r = ReconocePatrones(Patrones, imagen)
    detector_cara=vision.CascadeObjectDetector();
    bbox=step(detector_cara,imagen);
    imagen=imagen(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3));
    imagen=imresize(imagen,[143 143]);
    imagen1=edge(imagen,'sobel','vertical');
    imagen2=edge(imagen,'sobel','horizontal');
    imagen3=imagen1+imagen2;
    a=Patrones;
    m1=mean(imagen3);
    m3 = 256;
    l=0;
    for i=1:72
        m2=mean(a(:,:,i));
        %Distancia euclidea
        m = sum((m2(1:length(m2))-m1(1:length(m1))).^2);
        if m<m3
            m3 = m;
            l = i;
        end
    end
    imshow(imread(['Rostro_' num2str(l) '.' num2str(1) '.jpg']));
    r = l;
end

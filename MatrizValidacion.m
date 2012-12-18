function res=MatrizValidacion(a,b)
    detector_cara = vision.CascadeObjectDetector(); %Nos detecta por defecto caras
    res = zeros(143,143);
    b4=zeros(143,143);
    for i=1:14
        if(i~=b)
        aux = imread(['Rostro_' num2str(a) '.' num2str(i) '.jpg']);
        bbox = step(detector_cara, aux)
        if(~isempty(bbox))
            b = aux(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3));
            b = imresize(b,[143 143]);
            b1 = edge(b,'sobel','vertical');
            b3 = edge(b,'sobel','horizontal');
            b3 = b1+b3;
            b4 = b4+b3;
        end
        end
    end
    res=b4/15;
end
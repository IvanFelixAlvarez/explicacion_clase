% Create a cascade detector object.
function res = PatronesMedios()
detector_cara = vision.CascadeObjectDetector(); %Nos detecta por defecto caras
res = zeros(143,143,72);
for j=1:72
    b4=zeros(143,143,3);
    for i=1:15
        aux = imread(['Rostro_' num2str(j) '.' num2str(i) '.jpg']);
        bbox = step(detector_cara, aux)
        if(~isempty(bbox))
            b = aux(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3));
            b = imresize(b,[143 143]);
            b1 = edge(b,'sobel','vertical');
            b3 = edge(b,'sobel','horizontal');
            b3 = b1+b3;
            b2 = find(b3==1);
            b4 = b4 + aux(b2);
        end
    end
    res(:,:,j) = b4/15;
    figure,imshow(b4);
    close all
end
end
%IFaces = vision.ShapeInserter;
%a = step(IFaces,aux,int32([x y w h])); Si no recortaramos le añadiriamos
%un cuadrito al rededor de la cara. Esta 'a' deberia ser la que
%mostrasemos.

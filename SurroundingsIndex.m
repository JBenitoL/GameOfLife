%Funcion que me da un vector con 9 elementos: El inddice del punto del
%input, y los 8 vecinos.
function [surroundings] = SurroundingsIndex(Board,Vivo)
sz = size(Board);
surroundings = ones(1,9);
%Paso a coordenadas
[CordX, CordY] = ind2sub(sz, Vivo);
%Ojo los bordes de nuevo
    if CordX>1 && CordY>1
         surroundings(1) = sub2ind(sz,CordX-1,CordY-1);
         surroundings(2) = sub2ind(sz, CordX-1,CordY);
         surroundings(3) = sub2ind(sz,CordX,CordY-1);
    end
    if CordX>1 && CordY < size(Board,2)
         surroundings(4) = sub2ind(sz,CordX-1,CordY+1);
         surroundings(5) = sub2ind(sz,CordX,CordY+1);
    end
    
    if CordX < size(Board,1) && CordY > 1
         surroundings(6) = sub2ind(sz,CordX+1,CordY-1);
         surroundings(7) = sub2ind(sz,CordX+1,CordY);
    end
    
    if CordX < size(Board,1) && CordY < size(Board,2)
         surroundings(8) = sub2ind(sz,CordX+1,CordY+1);
    end
   surroundings(9) = sub2ind(sz, CordX, CordY);        
%Game of LIFE

%Defino el tablero

NX =64;
NY = 64;

Board = zeros(NX,NY);
drawBoard(Board,NX,NY)
%Elijo con el puntero 5 individuos
Poblation = 5;
for i = 1:Poblation
    [PointY, PointX] = ginput(1);
    PoblationIndex = sub2ind(size(Board),round(PointX-0.5), round(PointY-0.5));
    Board(PoblationIndex) = 1;
    drawBoard(Board, NX, NY);
end
 pause   
% Comienza el algoritmo
%El algoritmo seguirá indefinidamente hasta que toda la matriz sea de ceros
%si estabiliza o se quiere parar hay que pulsar ctrl + C
%Las condiciones de vida son:
%Si esta vivo y tiene 2 o 3 vecinos sigue con vida
%Si está mmuerto y tiene 3 vecinos, vive

%De momento el algoritmo recorre toda la matriz y es ineficiente. Habria
%que coger solo los puntos donde se vive y los alrededores. Ahorraria
%muchos pasos.
%Quizá se podria hacer una funcion para que diese los inidces de los
%alrededores y de esa forma optimizar. Esta hecho, en esta version pero
%sigue sin ir especialmente rapido....
while sum(sum(Board)) > 0
    newBoard = zeros(NX, NY);
    Vivos = find(Board ==1);
  tic
    for i =1: length(Vivos)
        surroundings = SurroundingsIndex(Board, Vivos(i));
        for j = 1:9
        [CordX, CordY] =ind2sub(size(Board), surroundings(j));
        Partners = Nneigh(Board, CordX, CordY);
        if Board(surroundings(j)) >=1

            if Partners ==2 || Partners ==3 
             
                newBoard(surroundings(j)) =1;
            end
            if Partners ==3
                 newBoard(surroundings(j)) =2;
            end
            if Partners >4
                 newBoard(surroundings(j)) =3;
            end
%             if Partners ==5
%                  newBoard(surroundings(j)) =4;
%             end
%             if Partners >5
%                  newBoard(surroundings(j)) =5;
%             end
        else 
            if Partners == 3
               
                newBoard(surroundings(j)) =1;
            end
        end
        end
    end
    toc
    
    tic
    Board = newBoard;
   cla
    drawBoard(Board, NX, NY);
    toc
    pause(0.01)
            
        
    
end



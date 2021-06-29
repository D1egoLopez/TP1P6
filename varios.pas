unit Varios;

{$mode objfpc}{$H+}

interface
 procedure Intercambio(var x,y: real);             //v
 Procedure OrdenaTres (Var A,B,C:real);            //v
 Function Capicua(N:longint):boolean;              //v
 Function Distancia(X1, Y1, X2, Y2: real): real;   //v
 Function Cuadrante(X,Y : real): byte;             //v


implementation

              procedure Intercambio(var x,y: real);
              var
                aux : real;
                begin

                     aux := x;
                     x := y;
                     y := aux;

                end;
              procedure OrdenaTres (Var A,B,C:real);

              begin
                   if (A>B) then
                      Intercambio(A, B);
                   if  (B>C) then
                       begin
                            Intercambio(B, C);
                            if A>B then
                            Intercambio(A, B);
                       end;
              end;
              function capicua(n:longint):boolean;
              var
              aux,antn:longint;
              begin
                aux:=0; antn:=n;
                while n<>0 do
                  begin
                  aux:=n mod 10 + aux*10;
                  n:=n div 10
                  end;
                capicua:= antn = aux;
              end;
              Function Distancia(X1, Y1, X2, Y2: real): real;

                 begin
                      distancia := sqrt( sqr(x2-x1) + sqr(y2-y1) )
                 end;
              Function Cuadrante(X,Y : real): byte;

              begin
                   if (x > 0) and (y > 0) then
                      cuadrante := 1;
                   if (x < 0) and (y > 0) then
                      cuadrante := 2;
                   if (x < 0) and (y < 0) then
                      cuadrante := 3;
                   if (x > 0) and (y < 0) then
                      cuadrante := 4;

              end;

end.

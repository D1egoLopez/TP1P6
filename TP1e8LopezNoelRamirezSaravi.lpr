program TP1e8LopezNoelRamirezSaravi;

uses varios, crt;
var
  txt1, txts : text;
  C1, C2, C3 : real;
  CS : integer;
  Num : longint;
begin
  clrscr;
  Assign(txt1, 'Datos8LopezNoelRamirezSaravi.txt');
  reset(txt1);
  Assign(txts, 'Resultados8LopezNoelRamirezSaravi.txt');
  rewrite(txts);
  cs := 0;
  writeln('debuggin');
      while not EoF(txt1) do
        begin
             Read(txt1, Num);
             if num <> 0 then
             begin
             if (Capicua(Num)) then
                Cs := cs + 1 ;
             writeln(num);  // debuggin
                  if cs = 1 then
                     begin
                          C1 :=num;
                          cs :=cs+1
                     end
                     else if cs = 3 then
                        begin
                             C2 :=num;
                             cs :=cs+1
                        end
                        else if cs = 5 then
                           begin
                                C3 := num;
                                cs :=cs+1
                           end;
                  writeln(c1:0:0,'    ',c2:0:0,'    ',c3:0:0,'    ',cs);  // debuggin
                  if cs = 6 then
                     break;

             end;
        end;
      Case cs of
       0 : Write(txts, 'el archivo ingresado no posee numeros del tipo capicua.');
       2 : Write(txts, 'Solo se encontro un numero del tipo capicua: ', c1:0:0);
       4 : begin
                Write(txts, 'Solo se encontraron dos numeros del tipo capicua: ');
                OrdenaTres(C1, C2, C3);
                Write(txts, c2:0:0,'  ',c3:0:0);
           end;
       6 : begin
                Write(txts, 'Se encontraron tres numeros del tipo capicua: ');
                OrdenaTres(C1, C2, C3);
                Write(txts, c1:0:0,' ',c2:0:0,'  ',c3:0:0);
           end;

            end;

  close(txt1);
  close(txts);
  readln();

end.


PROGRAM ConjuntoIFBA;

VAR
  frase: STRING;
  letrasFrase: SET OF Char;
  i: Integer;
  temX: Boolean;

BEGIN
  frase := 'O IFBA E NOTA 5 NO MEC';
  letrasFrase := [];

  FOR i := 1 TO Length(frase) DO
  BEGIN
    Include(letrasFrase, UpCase(frase[i]));
  END;

  temX := 'X' IN letrasFrase;

  IF temX THEN
    Writeln('A letra X está presente na frase.')
  ELSE
    Writeln('A letra X não está presente na frase.');

  Write('Conjunto de letras da frase: [');
  FOR i := Ord('A') TO Ord('Z') DO
  BEGIN
    IF Chr(i) IN letrasFrase THEN
      Write(Chr(i), ',');
  END;
  FOR i := Ord('0') TO Ord('9') DO
  BEGIN
    IF Chr(i) IN letrasFrase THEN
      Write(Chr(i), ',');
  END;
  IF ' ' IN letrasFrase THEN
    Write(' ,');
  IF 'E' IN letrasFrase THEN // Agora verificamos 'E' (maiúsculo)
    Write('E,');
  Write(']');
  Writeln;

  Readln;
END.
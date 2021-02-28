 PROGRAM SarahRevere(INPUT, OUTPUT);
{Печать соответствующего сообщения, зависящего от величины
 на входе:  '...by land'  для 1;  '...by sea'  для 2;
 иначе печать сообщения об ошибке}
USES 
  gpc;
VAR
  Str: STRING;
BEGIN 
  Str := GetEnv('QUERY_STRING');
  WRITELN('Content-Type: text/plain');
  WRITELN;
  IF Pos('name=', Str) <> 1
  THEN
    WRITELN('Hello Anonymous!')
  ELSE
    BEGIN
      WRITE('Hello dear, ');
      IF Pos('&', Str) = 0
      THEN
        WRITELN(Copy(Str, Pos('=', Str) + 1, Length(Str)), '!')
      ELSE
        WRITELN(Copy(Str, Pos('=', Str) + 1, Pos('&', Str) - Pos('=', Str) - 1), '!')
    END
END. 

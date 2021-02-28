PROGRAM SarahRevere(INPUT, OUTPUT);
{Печать соответствующего сообщения, зависящего от величины
 на входе:  '...by land'  для 1;  '...by sea'  для 2;
 иначе печать сообщения об ошибке}
USES 
  gpc;
VAR
  Lanterns: STRING;
BEGIN 
  Lanterns := GetEnv('QUERY_STRING');
  WRITELN('Content-Type: text/plain');
  WRITELN;
    IF (Lanterns = 'lanterns=1') OR (Lanterns = 'lanterns=2')
    THEN
      WRITE('The British are coming by ');
    IF Lanterns = 'lanterns=1'
    THEN
      WRITELN('land.')
    ELSE
      IF Lanterns = 'lanterns=2'
      THEN
        WRITELN('sea.')
      ELSE
        WRITELN('Sarah didn''t say.')
END. 

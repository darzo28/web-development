 PROGRAM SarahRevere(INPUT, OUTPUT);
{������ ���������������� ���������, ���������� �� ��������
 �� �����:  '...by land'  ��� 1;  '...by sea'  ��� 2;
 ����� ������ ��������� �� ������}
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

PROGRAM SarahRevere(INPUT, OUTPUT);
{������ ���������������� ���������, ���������� �� ��������
 �� �����:  '...by land'  ��� 1;  '...by sea'  ��� 2;
 ����� ������ ��������� �� ������}
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

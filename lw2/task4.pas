PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  gpc;
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  Str: STRING;
BEGIN
  Str := GetEnv('QUERY_STRING');
  IF (Pos(Key, Str) <> 0) AND ((Pos(Key, Str) = 1) OR (Str[Pos(Key, Str) - 1] = '&')) AND (Str[Pos(Key, Str) + Length(Key)] = '=')
  THEN
    BEGIN
      Str := Copy(Str, Pos(Key, Str) + Length(Key) + 1, Length(Str));
      IF Pos('&', Str) = 0
      THEN 
        GetQueryStringParameter := Copy(Str, 1, Length(Str))
      ELSE
        GetQueryStringParameter := Copy(Str, 1, Pos('&', Str) - 1) 
    END                                  
  ELSE
    GetQueryStringParameter := 'Not Found'  
END;
BEGIN {WorkWithQueryString} 
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. {WorkWithQueryString}

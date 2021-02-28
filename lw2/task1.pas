PROGRAM PrintEnv(INPUT, OUTPUT);
USES 
  gpc;
BEGIN
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN('Request Metod: ', GetEnv('REQUEST_METHOD'));
  WRITELN('Query String: ', GetEnv('QUERY_STRING'));
  WRITELN('Content Length: ', GetEnv('CONTENT_LENGTH'));
  WRITELN('HTTP User Agent: ', GetEnv('HTTP_USER_AGENT'));
  WRITELN('HTTP Host: ', GetEnv('HTTP_HOST'))
END.

<?php
header("Content-Type: text/plain");

$param = "email";
$text = getGETParameter($param);	

if ($text === null)
{
	echo "Parameter \"$param\" isn't found";
    return;
}

if (($text === "") || !isEmail($text))
{
	echo "Enter valid email";
}
else
{
	getSurveyInfo($text);
}

function getGETParameter(string $name): ?string
{
	return isset($_GET[$name]) ? (string)$_GET[$name] : null;
}

function isEmail(string $str) : bool
{
	$patternEmail = "/^\w+\@\w+\.\w+$/";

	return preg_match($patternEmail, $str);
}

function getSurveyInfo(string $email): void
{
	$filename = "D:/Curses/Web/web-development/lw3/data/$email.txt";

	if (file_exists($filename)) 
	{
		echo file_get_contents($filename); 	
	}
	else
	{
		echo "The file \"".$email.".txt\" couldn't be opened.".PHP_EOL;
	}
}

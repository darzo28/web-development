<?php
function getGETParameter(string $name): ?string
{
	return isset($_GET[$name]) ? (string)$_GET[$name] : null;
}

function isEmail(string $str) : bool
{
	$pattern_email = "/^\w+\@\w+\.\w+$/";

	return preg_match($pattern_email, $str);
}

function printSurveyInfo(array $fields) : void
{
	echo "First Name: ".$fields[0].PHP_EOL;
	echo "Last Name: ".$fields[1].PHP_EOL;
	echo "Email: ".$fields[2].PHP_EOL;
	echo "Age: ".$fields[3];	
}

function getSurveyInfo(string $email) : void
{
	$filename = "D:/Curses/Web/web-development/lw3/data/".$email.".txt";

	if (($fp = fopen($filename, "r")) !== false) 
	{
		$form = fgetcsv($fp, ",");
		printSurveyInfo($form);
		fclose($fp); 	
	}
	else
	{
		echo "The file \"".$email.".txt\" couldn't be opened.".PHP_EOL;
	}
}

$param = "email";
$text = getGETParameter($param);	

header("Content-Type: text/plain");

if ($text === null)
{
	echo "Parameter \"$param\" isn't found";
}
elseif (($text === "") || !isEmail($text))
{
	echo "Enter valid email";
}
else
{
	getSurveyInfo($text);
}
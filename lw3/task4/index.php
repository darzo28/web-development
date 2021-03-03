<?php
header("Content-Type: text/plain");

$params = ["first_name", "last_name", "email", "age"];
foreach ($params as $name)
{
	$form[$name] = getGETParameter($name);	
}

if ($form["email"] === null)
{
	echo "Parameter \"email\" isn't found";
    return;
}

if (($form["email"] === "") || !isEmail($form["email"]))
{
	echo "Enter valid email";
    return;
}

if (($form["age"] !== "") && !is_null($form["age"]))
{
	if (!isAge($form["age"]))
	{
		echo "Enter valid age";
	}
	else
	{
		saveSurvey($form);
	}
}

function getGETParameter(string $name): ?string
{
	return isset($_GET[$name]) ? (string)$_GET[$name] : null;
}

function isEmail(string $str): bool
{
	$patternEmail = "/^\w+\@\w+\.\w+$/";

	return preg_match($patternEmail, $str);
}

function isAge(string $str): bool
{
	$patternAge = "/^(\d)*$/";

	return preg_match($patternAge, $str);
}

function saveSurvey(array $fields): void
{
	if (!file_exists("D:/Curses/Web/web-development/lw3/data")) 
	{
    	mkdir("D:/Curses/Web/web-development/lw3/data");
	}

	$filename = "D:/Curses/Web/web-development/lw3/data/".$fields["email"].".txt";

	if ($fp = fopen($filename, 'w'))
	{
    	fwrite($fp, "First Name: ".$fields["first_name"].PHP_EOL);
		fwrite($fp, "Last Name: ".$fields["last_name"].PHP_EOL);
		fwrite($fp, "Email: ".$fields["email"].PHP_EOL);
		fwrite($fp, "Age: ".$fields["age"]);
		fclose($fp);
    
		echo "The file \"".$fields["email"].".txt\" is written.";
	}
	else
	{
		echo "Failed to create file.";
	}	
}

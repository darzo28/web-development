<?php
function getGETParameter(string $name) : ?string
{
	return isset($_GET[$name]) ? (string)$_GET[$name] : null;
}

function isEmail(string $str) : bool
{
	$pattern_email = "/^\w+\@\w+\.\w+$/";

	return preg_match($pattern_email, $str);
}

function isAge(string $str) : bool
{
	$pattern_age = "/^(\d)*$/";

	return preg_match($pattern_age, $str);
}

function saveSurvey(array $fields) : void
{
	if (!file_exists("D:/Curses/Web/web-development/lw3/data")) 
	{
    	mkdir("D:/Curses/Web/web-development/lw3/data");
	}

	$filename = "D:/Curses/Web/web-development/lw3/data/".$fields["email"].".txt";

	if ($fp = fopen($filename, 'w'))
	{
    	fputcsv($fp, $fields, ",");
		fclose($fp);
    
		echo "The file \"".$fields["email"].".txt\" is written.";
	}
	else
	{
		echo "Failed to create file.";
	}	
}

header("Content-Type: text/plain");

$params = ["first_name", "last_name", "email", "age"];
foreach ($params as $name)
{
	$form[$name] = getGETParameter($name);	
}

if ($form["email"] === null)
{
	echo "Parameter \"email\" isn't found";
}
elseif (($form["email"] === "") || !isEmail($form["email"]))
{
	echo "Enter valid email";
}
elseif (($form["age"] !== "") && !is_null($form["age"]))
{
	if (!isAge($form["age"]))
	{
		echo "Enter valid age";
	}
}
else
{
	foreach ($form as $field => $value)
	{
		$form[$field] = (is_null($value) || ($value === "")) ? " " : $value;
	}
	saveSurvey($form);
}
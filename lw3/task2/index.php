<?php
header("Content-Type: text/plain");

$param = "identifier";
$text = getGETParameter($param);

if ($text === null)
{
	echo "Parameter \"$param\" isn't found";
	return;
}

if ($text === "")
{
	echo "Enter text";
}
else
{
	echo checkIdentifier($text);
}

function getGETParameter(string $name) : ?string
{
	return isset($_GET[$name]) ? (string)$_GET[$name] : null;
}

function checkIdentifier(string $str) : string
{
	$digitFirst = preg_match("/[0-9]/", $str[0], $matches);
	$nonWordChar = preg_match("/\W|\_/", $str, $matches);
	if ($digitFirst)
	{
		$message = "Identifier couldn't begin with digit. ";
	}
	if ($nonWordChar)
	{
		$message .= "Identifier can contain latin letters and numbers only.";	
	}
	$result = isset($message) ? "no".PHP_EOL.$message : "yes";
	return $result;
}

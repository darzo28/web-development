<?php
function getGETParameter(string $name) : ?string
{
	return isset($_GET[$name]) ? (string)$_GET[$name] : null;
}

function checkIdentifier(string $str) : string
{
	$digit_first = preg_match("/[0-9]/", $str[0], $matches);
	$non_word_char = preg_match("/\W|\_/", $str, $matches);
	if ($digit_first)
	{
		$message = "Identifier couldn't begin with digit. ";
	}
	if ($non_word_char)
	{
		$message .= "Identifier can contain latin letters and numbers only.";	
	}
	$result = isset($message) ? "no".PHP_EOL.$message : "yes";
	return $result;
}

header("Content-Type: text/plain");

$param = "identifier";
$text = getGETParameter($param);

if ($text === null)
{
	echo "Parameter \"$param\" isn't found";
}
elseif ($text === "")
{
	echo "Enter text";
}
else
{
	echo checkIdentifier($text);
}
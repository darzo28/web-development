<?php
function getGETParameter(string $name): ?string
{
	return isset($_GET[$name]) ? (string)$_GET[$name] : null;
}

function removeExtraBlanks(string $str) : string
{
	$substrings = preg_split("/ /", $str, -1, PREG_SPLIT_NO_EMPTY);
	$result = implode(" ", $substrings);
	return $result;
}

$param = "text";
$text = getGETParameter($param);

header("Content-Type: text/plain");

if ($text !== null)
{
	$trimmed = removeExtraBlanks($text);
	if ($trimmed !== "")
	{ 
		echo $trimmed;
	}
	else
	{
		echo "Enter text";
	}
}
else
{
	echo "Parameter \"$param\" isn't found";
}
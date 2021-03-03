<?php

function getGETParameter(string $name) : ?string
{
	return isset($_GET[$name]) ? (string)$_GET[$name] : null;
}

function isPassword(string $str) : bool
{
	$non_word_char = preg_match("/\W|\_/", $str, $matches);

	return $non_word_char ? false : true;
}

function checkPasswordStrength(string $str) : int
{
	$len = strlen($str);
	foreach (count_chars($str, 1) as $i => $val) 
	{   
		if (($i >= 48) && ($i <= 57))
		{
			$digits += $val;
		}
		elseif (($i >= 65) && ($i <= 90))
		{
			$uppercase += $val;
		}
		elseif (($i >= 97) && ($i <= 122))
		{
			$lowercase += $val;
		}
		$repeats += ($val > 1) ? $val : 0;
   		
	}
	$strength = ($uppercase) ? 2 * ($len - $uppercase) : 0;
	$strength += ($lowercase) ? 2 * ($len - $lowercase) : 0;
	$strength += (($digits > 0) ^ (($uppercase + $lowercase) > 0)) ? -$len : 0;
	$strength += 4 * $len + 4 * $digits - $repeats;

	return $strength;
}

header("Content-Type: text/plain");

$param = "password";
$text = getGETParameter($param);

if ($text === null)
{
	echo "Parameter \"$param\" isn't found";
}
elseif (($text === "") || !isPassword($text))
{
	echo "Enter valid password";
}
else
{
	echo checkPasswordStrength($text);
}
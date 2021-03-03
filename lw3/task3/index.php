<?php

header("Content-Type: text/plain");

$param = "password";
$text = getGETParameter($param);

if ($text === null)
{
	echo "Parameter {$param} isn't found";
	return;
}

if (($text === "") || !isPassword($text))
{
	echo "Enter valid password";
}
else
{
	echo checkPasswordStrength($text);
}

function getGETParameter(string $name): ?string
{
	return isset($_GET[$name]) ? (string)$_GET[$name] : null;
}

function isPassword(string $str): bool
{
	$nonWordChar = preg_match("/\W|\_/", $str, $matches);

	return $nonWordChar ? false : true;
}

function countStrength(int $length, int $upper, int $lower, int $digits, int $repeats): int
{
	$strengthUpper = countFormulaUppercase($length, $upper);
	$strengthLower = countFormulaLowercase($length, $lower);
	$strengthDigitsOrLetters = countFormulaDigitOrLetters($length, $upper, $lower, $digits);
	$strength = $strengthUpper + $strengthLower + $strengthDigitsOrLetters + 4 * $length + 4 * $digits - $repeats;

	return $strength;
	
}

function countFormulaUppercase(int $length, int $upper): int
{
	return 2 * ($length - $upper); 	
}

function countFormulaLowercase(int $length, int $lower): int
{
	return 2 * ($length - $lower);	
}

function countFormulaDigitOrLetters(int $length, int $upper, int $lower, int $digits): int
{
	if (($digits > 0) ^ (($upper + $lower) > 0))
	{
		return -$length;
	}
	else
	{
		return 0;
	}
}

function checkPasswordStrength(string $str): int
{
	$len = strlen($str);
	$digitCount = 0;
	$uppercaseCount = 0;
	$lowercaseCount = 0;
	$repeatCount = 0;
	
	foreach (count_chars($str, 1) as $i => $val) 
	{   
		if (($i >= 48) && ($i <= 57))
		{
			$digitCount += $val;
		}
		elseif (($i >= 65) && ($i <= 90))
		{
			$uppercaseCount += $val;
		}
		elseif (($i >= 97) && ($i <= 122))
		{
			$lowercaseCount += $val;
		}
		$repeatCount += ($val > 1) ? $val : 0;
   		
	}

	$strength = countStrength($len, $uppercaseCount, $lowercaseCount, $digitCount, $repeatCount);

	return $strength;
}

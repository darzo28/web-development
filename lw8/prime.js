function isPrimeNum(num) {
  let isPrime = true;
  if (num) { 
      for (let j = 2; j < num; j++) {
          if (num % j == 0) {
              isPrime = false; 
              break;
          }
      }
  } else {
    isPrime = false;
  }
  if (isPrime) {
    console.log(num, ' is prime number');
  } else {
    console.log(num, ' is not prime number');
  }
}

function isPrimeNumber(numbers) {
  if(typeof(numbers) == 'number') {
    isPrimeNum(numbers);
  } else if (typeof(numbers) == 'object' && numbers.length) {  
    for (let i = 0; i < numbers.length; i++) {
      if (typeof(numbers[i]) == 'number') {
        isPrimeNum(numbers[i]);
      } else {
        console.log(numbers[i], ' is not number');
      }      
    }
  } else {
    console.log('Expected number or array of numbers');
  }
}
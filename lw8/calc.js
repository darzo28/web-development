function calc(str) {
  let stack = [];
  let n = 0;
  let temp = str.replace(/\s+/g, '');
  str = temp.split('').reverse();

  for (let char of str) {
    if (char in operators) {
      stack.push(operators[char](stack.pop(), stack.pop()));
    } else if (char in brackets) {
      n = brackets[char](n);
    } else if (isNaN(parseInt(char))) {
      stack.push(parseInt(char));
      console.log(`Invalid expression: '${char}' not expected`);
      break;
    } else {
      stack.push(parseInt(char));
    }
  }

  if (n != 0) {
    if (n > 0) {
      console.log(`Invalid expression: '(' expected`);
    } else {
      console.log(`Invalid expression: ')' expected`);
    }
  } else if (stack.length == 1){
    console.log(...stack);
  }
}

const operators = {
  '+': (a, b) => a + b,
  '-': (a, b) => a - b,
  '*': (a, b) => a * b,
  '/': (a, b) => a / b
};

const brackets = {
  ')': (i) => ++i,
  '(': (i) => --i
}
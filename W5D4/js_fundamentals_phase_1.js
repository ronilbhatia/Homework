function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}



function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString)
}

function fizzBuzz(array) {
  fizzBuzzArr = [];
  for(let i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 && array[i] % 5 === 0) {
      continue;
    } else if (array[i] % 3 === 0){
      fizzBuzzArr.push(array[i])
    } else if (array[i] % 5 === 0) {
      fizzBuzzArr.push(array[i])
    }
  }

  return fizzBuzzArr;
}

function isPrime(num) {
  if (num <= 0) {
    return false
  } else if (num === 1) {
    return false;
  } else if (num === 2) {
    return true;
  } else {
    for(i = 2; i < num; i++) {
      if (num % i === 0) {
        return false;
      }
    }
  }

  return true;
}

function sumOfNPrimes(n) {
  let num_primes = 0
  let sum_primes = 0
  let i = 2

  while (num_primes < n) {
    if (isPrime(i)) {
      num_primes ++;
      sum_primes += i;
    }

    i += 1;
  }

  return sum_primes;
}

console.log(fizzBuzz([1,2,3,4,5,6,7,9,12,15,18,20,21]));

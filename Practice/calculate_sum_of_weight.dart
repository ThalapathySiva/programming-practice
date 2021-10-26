// 2. Given a set of numbers like <10, 36, 54,89,12> we want to find sum of weights based on the following conditions
//     1. 5 if a perfect square
//     2. 4 if multiple of 4 and divisible by 6
//     3. 3 if even number

// And sort the numbers based on the weight and print it as follows

// <10,its_weight>,<36,its weight><89,its weight>
//

import 'dart:collection';
import 'dart:math';

void main() {
  sumOfWeight([10, 36, 54, 89, 12]);
}

sumOfWeight(List<int> input) {
  Map finalMap = {};
  for (int i = 0; i < input.length; i++) {
    finalMap[input[i]] = caluculateWeight(input[i]);
  }
  final sorted = SplayTreeMap.from(
      finalMap, (key1, key2) => finalMap[key1].compareTo(finalMap[key2]));
  print(sorted);
}

int caluculateWeight(int number) {
  int count = 0;

  if (isEvenNumber(number)) {
    count += 3;
  }

  if (isMultipleOfFourAndSix(number)) {
    count += 4;
  }

  if (isPerfectSquare(number)) {
    count += 5;
  }

  return count;
}

bool isPerfectSquare(int number) {
  return sqrt(number) * sqrt(number) == number;
}
// /{10: 3, 36: 12, 54: 8, 89: 0, 12: 7}

bool isMultipleOfFourAndSix(int number) {
  return number % 4 == 0 && number % 6 == 0;
}

bool isEvenNumber(int number) {
  return number % 2 == 0;
}

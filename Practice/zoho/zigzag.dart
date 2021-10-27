//3. Write a program to print the following output for the given input. You can assume the string is of odd length

// Eg 1: Input: 12345
//        Output:
// 1       5
//   2   4
//     3
//   2  4
// 1      5
// Eg 2: Input: geeksforgeeks
//          Output:
// g                         s
//   e                     k
//     e                 e
//       k             e
//         s         g
//           f      r
//              o
//           f     r
//         s         g
//       k             e
//     e                 e
//   e                      k
// g                          s

void main() {
  zigzag("12345");
}

void zigzag(String input) {
  for (int i = 0; i < input.length; i++) {
    int totalLength = input.length * 2 - 3;
    int reverseIndex = input.length - (i + 1);
    if (i > reverseIndex) {
      print(
          "${" " * reverseIndex * 2}${input[reverseIndex]}${" " * (totalLength - (reverseIndex * 4))}${input[i]} ");
    } else if (i == reverseIndex) {
      print("${" " * reverseIndex * 2}${input[reverseIndex]}");
    } else {
      print(
          "${" " * i * 2}${input[i]}${" " * (totalLength - (i * 4))}${input[reverseIndex]} ");
    }
  }
}

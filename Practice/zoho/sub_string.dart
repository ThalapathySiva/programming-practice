//4. Find if a String2 is substring of String1. If it is, return the index of the first occurrence. else return -1.

// Eg 1:Input:
//         String 1: test123string
//          String 2: 123
//         Output: 4
// Eg 2: Input:
//         String 1: testing12
//         String 2: 1234
//         Output: -1

void main() {
  print(checkSubString("test123", "123").toString());
}

int checkSubString(String string, String subString) {
  return string.indexOf(subString);
}

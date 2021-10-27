//1. Write a program to give the following output for the given input

// Eg 1: Input: a1b10
//        Output: abbbbbbbbbb
// Eg: 2: Input: b3c6d15
//           Output: bbbccccccddddddddddddddd

void main() {
  String alphaNumeric(String str) {
    String finalString = "";
    String tempString = "";
    int? tempInt;
    int? currentInt;

    for (int i = 0; i < str.length; i++) {
      tempInt = int.tryParse(str[i]);
      if (tempInt != null) {
        if (currentInt != null) {
          currentInt = int.parse(currentInt.toString() + str[i]);
        } else {
          currentInt = tempInt;
        }
      }
      if (currentInt != null && int.tryParse(str[i]) == null) {
        finalString += tempString * currentInt;
        currentInt = null;
        tempString = '';
      }
      if (tempInt == null) tempString = str[i];
    }
    return finalString + (tempString * currentInt!);
  }

  print(alphaNumeric("a3b11h6"));
}

// 6. Using Recursion reverse the string such as

// Eg 1: Input: one two three
//       Output: three two one
// Eg 2: Input: I love india
//       Output: india love I
//

void main() {
  stringRecursiveMethod2("I love india");
}

stringRecursiveMethod1(String str) {
  print(str.split(' ').reversed.join(" "));
}

stringRecursiveMethod2(String str) {
  List<String> strList = [];
  String tempString = "";
  String finalString = "";
  for (int i = 0; i < str.length; i++) {
    if (str[i] != " ") {
      tempString += str[i];
    } else {
      strList.add(tempString);
      tempString = "";
    }
  }
  strList..add(tempString);
  for (int i = strList.length - 1; i >= 0; i--) {
    finalString += strList[i] + " ";
  }

  print(finalString);
}

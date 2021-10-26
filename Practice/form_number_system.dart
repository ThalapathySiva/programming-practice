// 3) Form a number system with only 3 and 4. Find the nth number of the number system.
// Eg.) The numbers are: 3, 4, 33, 34, 43, 44, 333, 334, 343, 344, 433, 434, 443, 444, 3333, 3334, 3343, 3344, 3433, 3434, 3443, 3444 ….
void main() {
  formNumber(10000);
}

void formNumber(int n) {
  List<int> tempList = [];
  for (int i = 1; i <= n; i++) {
    tempList.add(i);
  }
  tempList.removeWhere(
      (element) => !element.toString().contains(RegExp("^[3,4]+\$")));
  print(tempList);
}

// 1) Alternate sorting: Given an array of integers, rearrange the array in such a way that the first element is first maximum and second element is first minimum.

//     Eg.) Input  : {1, 2, 3, 4, 5, 6, 7}
//          Output : {7, 1, 6, 2, 5, 3, 4}
//

void main() {
  alternateSort([1, 2, 3, 4, 5, 6, 7]);
}

void alternateSort(List<int> input) {
  final List<int> finalList = [];
  final List<int> tempList = [];
  tempList.addAll(input);
  tempList.sort((a, b) => b - a);
  for (int i = 0; i < input.length; i++) {
    finalList.add(tempList[i]);
    finalList.add(input[i]);
  }
  print(finalList.toSet().toList());
}

// 5. Given two sorted arrays, merge them such that the elements are not repeated

// Eg 1: Input:
//         Array 1: 2,4,5,6,7,9,10,13
//         Array 2: 2,3,4,5,6,7,8,9,11,15
//        Output:
//        Merged array: 2,3,4,5,6,7,8,9,10,11,13,15
//

void main() {
  removeDuplicates(
      [2, 4, 5, 6, 7, 9, 10, 13], [2, 3, 4, 5, 6, 7, 8, 9, 11, 15]);
}

removeDuplicates(List<int> list1, List<int> list2) {
  final finalList = [...list1, ...list2].toSet().toList();
  finalList.sort();
  print(finalList);
}

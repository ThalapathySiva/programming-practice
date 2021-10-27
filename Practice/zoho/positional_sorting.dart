//2. Write a program to sort the elements in odd positions in descending order and elements in ascending order

// Eg 1: Input: 13,2 4,15,12,10,5
//         Output: 13,2,12,10,5,15,4
// Eg 2: Input: 1,2,3,4,5,6,7,8,9
//         Output: 9,2,7,4,5,6,3,8,1

void main() {
  print(positionalSort([13, 2, 4, 15, 12, 10, 5]));
}

List<int> positionalSort(List<int> inputList) {
  final List<int> finalList = [];
  final List<int> evenList = [];
  final List<int> oddList = [];

  for (int i = 0; i < inputList.length; i++) {
    if ((i + 1) % 2 == 0) {
      evenList.add(inputList[i]);
    } else {
      oddList.add(inputList[i]);
    }
  }
  oddList.sort((a, b) => b - a);
  evenList.sort();

  for (int i = 0; i < oddList.length; i++) {
    finalList.add(oddList[i]);
    if (i < evenList.length) finalList.add(evenList[i]);
  }

  return finalList;
}

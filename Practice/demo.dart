void main() {
  List<String> inputString = [
    "apple",
    "orange",
    "banana",
    "APPle",
    "applE",
    "OranGe"
  ];
  print(inputString.removeDuplicateString);
}

extension RemoveDuplicateString on List<String> {
  List<String> get removeDuplicateString {
    final List<String> loweredList = [...map((e) => e.toLowerCase())];
    return [
      ...{...loweredList}
    ];
  }
}

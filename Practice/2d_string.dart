// 3. Save the string “WELCOMETOZOHOCORPORATION” in a two dimensional array and search for substring like “too” in the two dimensional string both from left to right and from top to bottom.

// w	e	L	C	O
// M	E	T	O	Z
// O	H	O	C	O
// R	P	O	R	A
// T	I	O	n
// And print the start and ending index as

// Start index : <1,2>

// End index: <3, 2>
//
//
void main() {
  twoDString("WELCOMETOZOHOCORPORATION", 5, "too");
}

twoDString(String str, int dimension, String compare) {
  int k = 0;
  final List<List<String>> x = List.generate(dimension,
      (i) => List.generate(dimension, (j) => k >= str.length ? "" : str[k++]));

  for (int i = 0; i < dimension; i++) {
    String tempHorizontalString = "";
    String tempVerticalString = "";
    for (int j = 0; j < dimension; j++) {
      tempHorizontalString += x[i][j];
      tempVerticalString += x[j][i];
      if (tempHorizontalString.toLowerCase().contains(compare)) {
        print("$i , ${tempHorizontalString.toLowerCase().indexOf(compare)}");
        print("$i , ${j}");
        tempHorizontalString = "";
        return;
      }
      if (tempVerticalString.toLowerCase().contains(compare)) {
        print(tempVerticalString);
        print("${tempHorizontalString.toLowerCase().indexOf(compare)}, $i");
        print("$j , $i");
        tempVerticalString = "";
        return;
      }
    }
  }
}

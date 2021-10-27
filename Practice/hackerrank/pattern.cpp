#include <iostream>

using namespace std;

int main()
{
int n = 5;
  int hash = 1;
  int space = n - 1;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < space; j++) {
      cout<<" ";
    }
    for (int j = 0; j < hash; j++) {
     cout<<"#";
    }
    space--;
    hash++;
    cout<<endl;
  }

    return 0;
}

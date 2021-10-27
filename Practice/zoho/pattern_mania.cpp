
#include <iostream>

using namespace std;

int main()
{
    int n=5;
    int spaces=2 * n-2;
    for(int i=1;i<=n;i++) {
        for(int j=0;j<i;j++)
            cout<<i;
        for(int j=0;j<spaces;j++) 
            cout<<" ";
        for(int j=0;j<i;j++)
            cout <<i;
        cout<<endl;
        spaces = spaces -2 ;
    }
}

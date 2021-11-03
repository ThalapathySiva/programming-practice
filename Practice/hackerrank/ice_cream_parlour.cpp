#include <bits/stdc++.h>

using namespace std;

void iceCreamParlout(int m,int n,int arr[]) {
    for(int i=0;i<n;i++) {
        int temp = m -arr[i];
        for(int j=0;j<n;j++) {
            if(i==j) {
                continue;
            }
            if(arr[j] == temp) {
                cout<<i+1<<" "<<j+1<<endl;
                return;
            }
        }
    }
}



int main() {
    int t;
    cin>>t;
    for(int i=0;i<t;i++) {
        int m;
        cin>>m;
        int n;
        cin>>n;
        int arr[n];
        for(int i=0;i<n;i++) {
            cin>>arr[i];
        }
    iceCreamParlout(m,n,arr);
    }
}
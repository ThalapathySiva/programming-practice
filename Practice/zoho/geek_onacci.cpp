#include <bits/stdc++.h>
using namespace std;

int nextSum(int a,int b,int c,int N) {
    int count=3;
    int sum=0;
    while(count<N) {
        sum = a+b+c;
        a=b;
        b=c;
        c=sum;
        count++;
    }
    
    return c;
}

int main()
{
    int n;
    cin>>n;
    int a,b,c,N;
    for(int i=0;i<n;i++) {
        cin>>a>>b>>c>>N;
        cout<<nextSum(a,b,c,N)<<endl;
    }
    return 0;
}
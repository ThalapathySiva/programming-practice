
/// Binary Search Tree
/// The Given Array should be in sorted 

#include <iostream>

using namespace std;

int binarSearch(int arr[],int k,int n) {
    int left=0;
    int right = n-1;
    while(left<=right) {
        int mid = (left+right)/2;
        
        if(arr[mid] == k) {
            return mid;
        }
        else if(arr[mid] <k) {
            left = mid+1;
        }
        else {
            right = mid -1;
        }
    }
    
    return -1;
}

int main()
{
    int n;
    int arr[100];
    int k;
    int foundInIndex;
    cout<<"Enter the length of the array";
    std::cin >> n;
    cout<<"Enter the elements";
    for(int i=0;i<n;i++) {
        cin>>arr[i];
    }
    cout<<"Enter the number that you want to search in the array";
    cin>>k;
    foundInIndex =binarSearch(arr,k,n);
    if(foundInIndex==-1) {
        cout<<"The searched number is not presented in the given array";
    }
    else {
    cout<<"The searched number presented in the index of "<<foundInIndex;
    }
    return 0;
}

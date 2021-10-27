// The API isBadVersion is defined for you.
// bool isBadVersion(int version);

class Solution {
public:
    int firstBadVersion(int n) {
       
        long right =n;
        long left = 1;
        long badValue=1;
        while(left<=right) {
            long mid = (left+right) /2;
            bool isBad = isBadVersion(mid);
            
            if(isBad) {
                badValue=mid;
                right=mid-1;
            }
            else {
                left = mid +1;
            }    
        }
        return badValue;
    }
};
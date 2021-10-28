class Solution {
public:
    vector<int> sortedSquares(vector<int>& nums) {
        long left=0;
        long right=nums.size() -1;
        vector<int> output;
        
        while(left<=right) {
            if(abs(nums[left]) > abs(nums[right])) {
                output.push_back(nums[left]*nums[left]);
                left+=1;
            }
            else  {
                output.push_back(nums[right] * nums[right]);
                right-=1;
            }
        }
               
        reverse(output.begin(),output.end());
        
        return output;
    }
};
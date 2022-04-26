import Foundation
 

extension Solution {
    func sortColors(_ nums: inout [Int]) {
        
        var start = 0
        var mid = 0
        var end = nums.count - 1
        
        while mid < nums.count  {
            let val = nums[mid]
            
            if val == 0 {
                nums.swapAt(start, mid)
                start += 1
                mid += 1
            } else if val == 1 {
                mid += 1
            } else {
                nums.swapAt(mid, end)
                end -= 1
            }
        }
    }
}

var arr = [2,0,2,1,1,0]
print(Solution().sortColors(&arr))
print(arr)

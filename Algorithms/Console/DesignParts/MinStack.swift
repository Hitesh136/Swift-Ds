 
//https://leetcode.com/problems/min-stack/
class MinStack {
    
//    class
    var trackingStack = [Int]()
    var stack = [Int]()
    
    init() {
        
    }
    
    func push(_ val: Int) {
        stack.append(val)
        
        var minValue = val
        if !trackingStack.isEmpty {
            minValue = min(val, getMin())
        }
        trackingStack.append(minValue)
    }
    
    func pop() {
        if !stack.isEmpty {
            stack.removeLast()
        }
        
        if !trackingStack.isEmpty {
            trackingStack.removeLast()
        }
    }
    
    func top() -> Int {
        stack.last ?? -111
    }
    
    func getMin() -> Int {
        trackingStack.last ?? -11
    }
}


/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

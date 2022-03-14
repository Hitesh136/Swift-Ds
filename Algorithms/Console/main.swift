 import Foundation
 
print(countPrimeSetBits(842, 888))
func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
    
    func isPrime(_ num: Int) -> Bool {
        
        guard num >= 2 else { return false}
        var i = 2
        while i * i <= num {
            if num % i == 0 {
                return false
            }
            i += 1
        }
        return true
    }
    
    var primesCount = 0
    var num = left
    while num < right {
        var count = 0
        var x = num
        while x > 0 {
            let lastSetBit = x & 1
            if lastSetBit == 1 {
                count += 1
            }
            x = x >> 1
        }
        
        if isPrime(count) {
            primesCount += 1
        }
        num += 1
    }
    
    return primesCount
}

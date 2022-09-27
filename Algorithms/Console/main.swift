import Foundation
  

var lfu = LFUCache(3)
lfu.put(2, 2)
lfu.put(1, 1)
print(lfu.get(2)) // 2
print(lfu.get(1)) // 1
print(lfu.get(2)) // 2
lfu.put(3, 3)
lfu.put(4, 4)
print(lfu.get(3)) // -1
print(lfu.get(2)) // 2
print(lfu.get(1)) // 1
print(lfu.get(4)) // 4


 

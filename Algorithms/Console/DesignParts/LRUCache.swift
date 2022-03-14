
class LRUCache {
//https://leetcode.com/problems/lru-cache/submissions/
    var capacity: Int
    var map = [Int: DLNode]()
    var head = DLNode(key: Int.min, value: Int.min, next: nil, prev: nil)
    var tail = DLNode(key: Int.max, value: Int.max, next: nil, prev: nil)
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
       
    func get(_ key: Int) -> Int {
        if let node = map[key] {
            removeNode(node)
            addNode(node)
            return node.value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let oldNode = map[key] {
            removeNode(oldNode)
            map[key] = nil
        } else if map.count == capacity {
            if let lastNode = tail.prev {
                removeNode(lastNode)
                map[lastNode.key] = nil
            }
        }
        
        let newNode = DLNode(key: key, value: value, next: nil, prev: nil)
        map[key] = newNode
        addNode(newNode)
    }
    
    func addNode(_ newNode: DLNode) {
        let next = head.next
        newNode.next = next
        next?.prev = newNode
        
        head.next = newNode
        newNode.prev = head
    }
    
    func removeNode(_ removedNode: DLNode) {
        let lNode = removedNode.prev
        let rNode = removedNode.next
        lNode?.next = rNode
        rNode?.prev = lNode
    }
}

class DLNode {
    var value: Int
    var key: Int
    var next: DLNode?
    var prev: DLNode?
    
    init(key: Int, value: Int, next: DLNode?, prev: DLNode?) {
        self.key = key
        self.value = value
        self.next = next
        self.prev = prev
    }
}


/* Driver Code

var lRUCache = LRUCache(2);
lRUCache.put(1, 1); // cache is {1=1}
lRUCache.put(2, 2); // cache is {1=1, 2=2}
print(lRUCache.get(1));    // return 1
lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
print(lRUCache.get(2));    // returns -1 (not found)
lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
print(lRUCache.get(1));    // return -1 (not found)
print(lRUCache.get(3));    // return 3
print(lRUCache.get(4));    // return 4
 
 */

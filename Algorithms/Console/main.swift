 import Foundation
//
//class LinkedListNode {
//    var value: Int
//    var next: LinkedListNode?
//
//    init(value: Int, next: LinkedListNode?) {
//        self.value = value
//        self.next = next
//    }
//}
//
//var n9 = LinkedListNode(value: 9, next: nil)
//var n2 = LinkedListNode(value: 2, next: n9)
//var n3 = LinkedListNode(value: 3, next: n2)
//var n5 = LinkedListNode(value: 5, next: n3)
//var n7 = LinkedListNode(value: 7, next: n5)
//var n8 = LinkedListNode(value: 8, next: n7)
//var n6 = LinkedListNode(value: 6, next: n8)
//var n4 = LinkedListNode(value: 4, next: n6)
//
//func insertionSort(head: LinkedListNode?) -> LinkedListNode? {
//
//    var sortedHead: LinkedListNode? = head
//
//    var unsortedListHead = head?.next
//    while let currentUnsortedListHead = unsortedListHead {
//
//        var sorted_IndexNode = sortedHead
//        while sorted_IndexNode != nil {
//            if let nextValue = sorted_IndexNode?.next?.value {
//                let current_UnsortedValue = currentUnsortedListHead.value
//                if current_UnsortedValue < nextValue {
//                    let sorted_tempNext = sorted_IndexNode!.next
//                    sorted_IndexNode?.next = LinkedListNode(value: current_UnsortedValue, next: sorted_tempNext)
//                    break
//                }
//            }
//            sorted_IndexNode = sorted_IndexNode?.next
//        }
//    }
//
//
//    return sortedHead
//}

//let sortedValue = insertionSort(head: n4)
//print(sortedValue)


//var ss = "16.1000009090"
//let numberFormatter = NumberFormatter()
//numberFormatter.maximumFractionDigits = 1
//print(numberFormatter.number(from: ss)!)
 

var arr = [7, 8, 5, 2, 4, 6, 3]
//arr.insertionSort()
//arr.selectionSort()
//arr.countingSort()
//arr.bubbleSort()
//arr.quickSort()
arr.mergeSort()
//print(arr)

//var res = [Int]()
//res.append(contentsOf: arr[2...5])
print(arr)

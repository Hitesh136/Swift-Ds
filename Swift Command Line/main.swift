

import Foundation


//let rootNode = BinaryNode(value: 80)
//rootNode.leftChild = BinaryNode(value: 50)
//rootNode.rightChild = BinaryNode(value: 90)
//rootNode.leftChild?.leftChild = BinaryNode(value: 10)
//rootNode.leftChild?.rightChild = BinaryNode(value: 60)
//
//rootNode.rightChild?.leftChild = BinaryNode(value: 40)
//rootNode.rightChild?.rightChild = BinaryNode(value: 20)


var numbers = [1, 2, 2]
var rootNode = BinaryNode(value: "")
numbers.getPossibleStringsFromNumber(0, rootNode)
print(rootNode.asString)
print("Resluts: \(rootNode.getLeafValues())")



import Foundation
 
 

 
func counter() -> (Int) -> String {
    var total = 5
    func add(_ x: Int) -> String {
        total += x + 1
        return "\(total)"
    }
    return add
 }
 let f = counter()
 f(3)
 let g = counter()
 g(2)
 let r = f(4)
 print(r)
//Options: -
//    1. 10
//    2. 14
//    3. 17
//    4. Compile time error. Memory Access error.
//ANS: 14
//
//30. func test10(completion: @escaping (()-> Void)){
//        print("01")
//        DispatchQueue.main.async {
//              print("02")
//              completion()
//        }
//        print("03")
//        completion()
//        print("04")
//   }
//func runTest(){
//        print("00")
//        test10 {
//          print("05")
//        }
//        print("06")
//  }
//DispatchQueue.main.async {
//      runTest()
//    }
//    1. 00 01 03 05 04 06 02 05
//    2. 00 01 02 05 03 05 04 06
//    3. 00 01 02 03 04 05 06
//    4. 00 01 02 05 06 03 05 06 04
//    5. 00 01 03 05 06 02
//Answer : 00 01 03 05 04 06 02 05
//
//
//
//
//31.
//class System {
//   var os = "Mac" {
//     willSet {
//       self.os = "Android"
//     }
//    didSet {
//        self.os = "iOS"
//      }
//    }
//    init() {
//      self.os = "Linux"
//    }
//}
//let mySystem = System()
//print(mySystem.os)
//Options:
//    1. Mac
//    2. Android
//    3. iOS
//    4. Linux
//ANS: Linux
//
//
//32. var x: Int? = nil
//    x? = 10
//    var y: Int? = 10
//    y? = 5
//    var z: Int? = nil
//    z = 12
//
//    print(x)
//
//    1. Optional(10)
//    2. 5
//    3. nil
//    4. 10
//    5. Compile time error
//Answer : nil
//
//33.
//  func swapTwoIntegers(a: inout Int, b: inout Int) {
//        let tempA = a
//        a = b
//        b = tempA
//    }
//
//    var a = 20
//    var b = 10
//    swapTwoIntegers(a: a, b: b)
//    print(a)
//    print(b)
//
//    1. A = 20, b = 10
//    2. A = 10, b = 20
//    3. Compile Time error. If it’s fix then swapping works
//    4. Compile Time error. Swapping won’t work If it’s fixed.
//
//Ans: - 3. Compile Time error. If it’s fix then swapping works
//
//
//
//    34. class Foo {
//    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
//        var runningTotal = 0
//        let incrementer: () -> Int = { [unowned self] in
////            guard let self = self else { return 0}
//            runningTotal += amount
//            return runningTotal
//        }
////        func incrementer() -> Int {
////        }
//        return incrementer
//    }
//}
//var fooObject: Foo? = Foo()
//let incrementer = fooObject!.makeIncrementer(forIncrement: 1)
//fooObject = nil
//incrementer()
//incrementer()
//incrementer()
//incrementer()
//
//
//
//
//35.
//final class Person {
//   var firstName: String = ""
//   var lastName: String = ""
//
//   func fullName() -> String {
//       return firstName + lastName  // Static Dispatch
//   }
//}
//
//
//
//36.
//
//private class Person {
//   var firstName: String = ""
//   var lastName: String = ""
//
//   func fullName() -> String {
//       return firstName + lastName // Table
//   }
//}
//private class Male: Person {
//
//    override func fullName() -> String {
//        return "Male \(firstName) \(lastName)" // Table
//    }
//
//}
//
//
//37.
//
//class ParentClass {
//    @objc dynamic func method1() {} // Message
//    dynamic func method11() {} // Table
//    @objc dynamic func method2() {} // Message
//    dynamic func method21() {} // Table
//}
//class ChildClass: ParentClass {
//    override func method2() {} // Message
//    @objc dynamic func method3() {} // Message
//    override func method21() {} // Table
//}
//
//
//38
//
//protocol Animal {
//    func isCute() -> Bool  // Table
//}
//extension Animal {
//    func canGetAngry() -> Bool { return true } // Static
//}
//
//class Dog2 {
//    func doSomething() {} // Table Dispatch
//}
//
//class Dog: Animal {
//    func isCute() -> Bool { return true } // Table
//    @objc dynamic func hoursSleep() -> Int { return 1 } // Message
//}
//extension Dog {
//    func canBite() -> Bool { return true } // Static
//    @objc func goWild() { } // Message
//}
//
//39.
//
//final class Employee {
//    func canCode() -> Bool { return true } // Static
//}
//
//
//40.
//protocol MyProtocol {
//    func extensionMethod()
////    {
////        print("In Struct")
////    }
//}
//struct MyStruct: MyProtocol {
////}
////extension MyStruct {
//    func extensionMethod() {
////        print("In Struct")
//    }
//}
//extension MyProtocol {
//    func extensionMethod() {
////        print("In Protocol")
//    }
//}
//
//let myStruct = MyStruct()
//let proto: MyProtocol = myStruct
//
////myStruct.extensionMethod() // -> “In Struct”
////proto.extensionMethod()
//
//41.
//protocol TestProtocol {
//    func requiredMethod() -> String // table
//}
//
//extension TestProtocol {
//    func requiredMethod() -> String { // Static
//        return "Protocol requiredMethod"
//    }
//
//    func notRequiredMethod() -> String { // Static
//        return "Protocol notRequiredMethod"
//    }
//}
//
//struct Test: TestProtocol {
//    func requiredMethod() -> String { // Static
//        return "Test requiredMethod"
//    }
//
//    func notRequiredMethod() -> String { // Static Dispatch
//        return "Test notRequiredMethod"
//    }
//}
//
////var panda = Animal()
////panda.walk()
////panda.crawl()
////
////var dog: Movable = panda
////dog.walk()
////dog.crawl()
//
//42.
//protocol TestProtocol {
//    func requiredMethod() -> String
//    func notRequiredMethod() -> String
//}
//
//extension TestProtocol {
//    func requiredMethod() -> String {
//        return "Protocol requiredMethod"
//    }
//
//    func notRequiredMethod() -> String {
//        return "Protocol notRequiredMethod"
//    }
//}
//
//struct Test: TestProtocol {
//    func requiredMethod() -> String {
//        return "Test requiredMethod"
//    }
//
//    func notRequiredMethod() -> String {
//        return "Test notRequiredMethod"
//    }
//}
//
//let testConcrete: Test = Test()
//let testProtocol: TestProtocol = Test()
//
//testConcrete.requiredMethod()
//testProtocol.requiredMethod()
//
//testConcrete.notRequiredMethod()
//testProtocol.notRequiredMethod()
//
//
//
//
//

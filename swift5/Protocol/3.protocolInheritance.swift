/*
 1. 프로토콜은 상속 가능하고, 다중으로 상속받을 수도 있다.
 - A, B -> C 상속? C는 A와 B의 요구사항을 모두 갖고 있다.
 - https://swiftdoc.org/v3.0/type/int/hierarchy/
 - 여러 프로토콜이 모이고 모여서 Int를 구성하고 있다.
 - 프로토콜의 상속은 이 구조를 이해하기 위해서 익혀야 함
 */

protocol Remote {
    func turnOn()
    func turnOff()
}

protocol TempRemote {
    func Up()
    func Down()
}

protocol SuperRemote: Remote, TempRemote {
    // func turnOn()
    // func turnOff()
    // func Up()
    // func Down()

    func doSth()
}

class A: SuperRemote {
    // 전부 구현 필요
    // func turnOn()
    // func turnOff()
    // func Up()
    // func Down()
    // func doSth()
}

// AnyObject는 프로토콜이다.
// AnyObject를 활용해서 다운캐스팅이 가능했던 이유도 이것이 프로토콜이었기 때문
protocol ProtocolForClass: AnyObject {
    // 이제 클래스전용 프로토콜이 되었다.
    func doSth()
}

class A1: ProtocolForClass {
    func doSth() {
        print("OK")
    }
}

// error returns
// struct B1: ProtocolForClass {
//     func doSth() {
//         print("no")
//     }
// }

// 프로토콜 합성
protocol Name {
    var name: String { get }
}

protocol Age {
    var age: Int { get }
}

struct Person: Name, Age {
    var name: String
    var age: Int
}

// 파라미터 a는 Name과 Age 프로토콜을 갖고 있어야 함
// 앰퍼샌드로 연결해서 사용
func doSth(_ a: Name & Age) {
    print("hi, \(a.name). you are \(a.age) years old")
}

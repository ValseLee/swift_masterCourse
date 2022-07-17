/*
 Equatable 프로토콜은 동일성 비교를 가능하게 하는 프로토콜이다.
 그 아래로 Comparable(크기 비교, 크기 비교에 기반한 정렬), Hashable(딕셔너리의 키, Set의 요소) 프로토콜이 있다.

 Int 타입은.. 위와 같은 프로토콜을 포함해서 굉장히 많은 프로토콜을 갖고 있다.
 [Int](https://swiftdoc.org/v3.0/type/int/hierarchy/)

 Equatable 프로토콜 덕분에 특정 피연산자가 동일한지 여부를 파악할 수 있다.
 요구사항은 static func == (lhs: Self, ths: Self) -> Bool 메소드를 구현하는 것
 이를 채택하는 Int 타입은 public static func == (lhs: Int, rhs: Int) -> Bool 을 당연히 구현했다.
 ==, !=

 그러나 Equatable 프로토콜이 없어도 동일성 비교가 가능한 경우가 있다.
 한편, 클래스는 인스턴스 비교를 하는 항등연산자(===)를 갖고 있다. 원칙적으로 클래스는 동일성 비교가 안된다.
 열거형의 케이스가 연관값이 없는 상황이 그렇다.

 열거형 케이스가 연관값이 있고, 해당 연관값들이 Equatable 프로토콜을 채택한 타입이라면, 개발자가 func == 를 다시 정의할 필요 없다.
 */

enum Direction {
    case east, west, south, north
}

print(Direction.north == Direction.east) // false

enum Com: Equatable {
    case cpu(core: Int, ghz: Double)
    case ram(Int)
    case hardDisk(gb: Int)
}

print(Com.cpu(core: 8, ghz: 3.5) == Com.cpu(core: 8, ghz: 3.3)) // false
print(Com.cpu(core: 8, ghz: 3.5) == Com.cpu(core: 8, ghz: 3.5)) // true

//
struct Dog {
    var name: String
    var age: Int
}

// 마찬가지로, 구조체의 저장속성이 모두 Equatable을 채택하고 있기 때문에 내부 구현이 불필요
// 애초에 구조체는 값 타입이기 때문에 각 저장 속성을 인스턴스 자체가 담고 있다는 점을 잊지 말자구.
extension Dog: Equatable {}

let dog1 = Dog(name: "ho", age: 10)
let dog2 = Dog(name: "how", age: 10)
print(dog1 == dog2) // false
print(dog1 != dog2) // true

/*
 ✨클래스의 경우!
 Equatable을 채택하고 직접 구현까지 해야한다.
 */

class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}

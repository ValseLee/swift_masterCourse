/*
 커스텀 타입에서도 메소드 형태로 연산자를 구현할 수 있다.
 연산자 자체도 '타입 메소드'이다.

 static func + (lhs: String, rhs: String) -> String
 static func += (lhs: inout String, rhs: String)

 원래대로라면.. String.(lhs: "Hello", rhs:"!") 이렇게 실행해야 되지 않나?
 중위 연산자로 정의되어 있기 때문에 메소드가 자동으로 호출되는 것
 infix operator +:

 */
import Foundation

struct Vector2D {
    var x = 0.0
    var y = 0.0
}

extension Vector2D {
    // infix 키워드는 생략한다.
    static func + (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        return Vector2D(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}

let vectorA = Vector2D(x: 3.0, y: 1.0)
let vectorB = Vector2D(x: 4.0, y: 5.0)

// infix 연산자인 + 를 따로 커스텀하지 않아서 이렇게 호출 가능
// 서로 다른 인스턴스에 대한 연산을 구현하기 위해 이를 타입 메소드로 정의하는 것
let plus = vectorA + vectorB
print(plus) // Vector2D(x: 7.0, y: 6.0)

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
print(negative) // Vector2D(x: -3.0, y: -4.0)
let negative2 = -negative
print(negative2) // Vector2D(x: 3.0, y: 4.0)

// 위에서 더하기 연산을 구현했기 때문에 복합할당도 구현할 수 있다
extension Vector2D {
    static func += (lhs: inout Vector2D, rhs: Vector2D) -> Vector2D {
        lhs = lhs + rhs
        return lhs
    }
}

/*
 비교 연산자의 구현
 구조체에서도 인스턴스간의 값을 비교하고 싶다면 Equatable 프로토콜을 채택하고 구현해야 한다.

 [Equatable 프로토콜은 동일성 비교를 구현하도록 한다]
 static func == (lhs: String, rhs: String) -> Bool
 static func != (lhs: String, rhs: String) -> Bool

 [Equatable 프로토콜 채택만으로 메소드가 구현되는 경우]
 1. 구조체가 서로 같은 기본 타입(== Equatable을 채택하는 타입)인 저장속성만 갖고 있다면 직접 구현하지 않아도 컴파일러가 동일성 비교를 구현해줌
 2. 열거형은 연간괎을 갖고 있고 모든 연관값이 Equatable 프로토콜을 준수한다면 메소드가 자동으로 구현된다.
 추가로, 열거형은 연간괎이 없다면 원칙적으로도 동일성 비교가 된다(Equatable 프로토콜 채택하지 않아도!).

 [Comparable 프로토콜은 크기와 순서 비교에 관한 프로토콜이며 Equatble 프로토콜을 상속한다.]
 static func < (lhs: String, rhs: String) -> Bool
 static func <= (lhs: String, rhs: String) -> Bool
 static func > (lhs: String, rhs: String) -> Bool
 static func >= (lhs: String, rhs: String) -> Bool
 */

// 여기서의 예시에서는 Equatable 만 채택해주면 된다.
extension Vector2D: Equatable {
    // 직접 구현
    static func == (lhs: Vector2D, rhs: Vector2D) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    // == 만 구현하면 != 는 자동 구현됨
    static func != (lhs: Vector2D, rhs: Vector2D) -> Bool {
        return lhs.x != rhs.x || lhs.y != rhs.y
    }

    // < 만 구현하면 나머지가 전부 자동 구현됨
    static func < (lhs: Vector2D, rhs: Vector2D) -> Bool {
        return lhs.x < rhs.x || lhs.y < rhs.y
    }
}

print(vectorA == vectorB) // false
print(vectorA != vectorB) // true

enum Week: Equatable {
    case mon(String)
    case tue(String)
}

print(Week.mon("?") == Week.tue("?")) // false
print(Week.tue("?") == Week.tue("?")) // true
print(Week.tue("?") == Week.tue("!")) // false

/*
 문자열 내에서 상수, 변수, 리터럴, 표현식 값을 \()로 표현할 수 있다.
 이 보간법의 작동 원리는?
 그리고 이 작동 원리는 어떻게 응용이 될까?
 \() 소괄호 안의 값은 description 변수를 읽는 것
 */
import Foundation

var name = "Vetiver"
print("\(name)")

let multipiler = 3
print("\(multipiler) times 2.5 is \(Double(multipiler) * 2.5)")

struct Dog {
    var name: String
    var weight: Double
}

let dog = Dog(name: "뀨", weight: 15.0)

// 2개의 출력문이 동일하다.
print(dog)
print("\(dog)")

// dump 로 출력하면 다르다.
dump(dog) // 메모리 구조에 기록되어 있는 구조체로 출력한다.
dump("\(dog)") // 문자열로 인식해서 출력한다.

/*
 swift 4 이전까지는 보간법을 이렇게 정의했다.
 Apple의 프로토콜을 채택하면 스트링 보간법을 직접 구현할 수도 있다.

 protocol CustomStringConvertible {
   var description { get }
 }

 extension Dog: CustomStringConvertible {
   var description: String {
    	return "이름은 \(name)이고 무게는 \(weight)이다."
    }
 }
 print("\(dog)") // "이름은 뀨이고 무게는 15.0이다."
 */

// swift 5.0 이후 문자열 보간법은 계산 속성이 아니라 메소드로 정의한다.
// 덕분에 스타일 커스텀까지 가능해졌다.
// StringInterpolation 은 DefaultStringInterpolation 타입을 갖는 타입 앨리어스
struct Point {
    var x: Int
    var y: Int
}

let p = Point(x: 5, y: 7)

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Point) {
        appendInterpolation("x 좌표는 \(value.x), y 좌표는 \(value.y)")
    }

    mutating func appendInterpolation(_ value: Dog) {
        appendInterpolation("이름은 \(value.name)이고 무게는 \(value.weight)이다.")
    }

    mutating func appendInterpolation(_ value: Point, style: NumberFormatter.Style) {
        let formatter = NumberFormatter()
        formatter.numberStyle = style

        if let x = formatter.string(for: value.x), let y = formatter.string(for: value.y) {
            appendInterpolation("X 좌표는 \(x), y 좌표는 \(y)")
        } else {
            appendInterpolation("\(value.x), \(value.y)")
        }
    }
}

print(p) // Point(x: 5, y: 7)
print("\(p)") // x 좌표는 5, y 좌표는 7
print("\(p, style: .spellOut)") // X 좌표는 오, y 좌표는 칠
print("\(p, style: .percent)") // X 좌표는 500%, y 좌표는 700%
print("\(p, style: .scientific)") // X 좌표는 5E0, y 좌표는 7E0
print("\(p, style: .currency)") // X 좌표는 ₩5, y 좌표는 ₩7
print("\(dog)") // 이름은 뀨이고 무게는 15.0이다.

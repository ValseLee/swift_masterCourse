/*
 정수와 실수를 지정된 형식의 문자열로 변환하기
 1. format specifiers
 : String(format: String, arguments: CVarArg...)
 	- "%.nf" : n의 자리수까지 반올림 : 실수
 	- "%d" : 정수 표현
 	- "%nd" : 정수를 n의 자리로 표현
 	- "%0nd" : 정수를 n의 자리로 표현하되, 빈 자리에 0 삽입
 	- "%@" : 아규먼트로 받을 문자열을 넣을 자리를 표시
 	- "n$" : n 번째 아규먼트를 받겠다는 파라미터 표시

 2. numberformatter
 : CustomStringConvertible Protocol
 	- .roundingMode : 반올림모드
 	- .maximumSignificantDigits : 최대자리수
 	- .minimumSignificantDigits : 최소자리수
 	- .numberStyle : 숫자 스타일

 */

import Foundation

var pi = 3.141592
print(pi)

var string = ""
string = "원하는 숫자 : " + String(format: "%.3f", pi)
print(string) // 원하는 숫자 : 3.142
string = String(format: "파이는 %.3f", pi)
print(string) // 파이는 3.142
string = String(format: "%07.3f", pi)
print(string) // 003.142
string = String(format: "Hello, %@", "HOHO")
print(string) // Hello, HOHO

//

struct Point: Codable {
    var x: Double
    var y: Double
}

extension Point: CustomStringConvertible {
    var description: String {
        let formatted = String(format: "Point : x - %1$.2f , y - %2$.2f", x, y)
        return "\(formatted)"
    }
}

let p = Point(x: 3.1415926, y: 2.5963756)
print("\(p)") // Point : x - 3.14 , y - 2.60

var firstName = "Gildong"
var lastName = "Hong"

var korean = "사용자 이름 : %2$@ %1$@"
var english = "user name : %1$@ %2$@"
string = String(format: korean, firstName, lastName)
print(string) // 사용자 이름 : Hong Gildong
string = String(format: english, firstName, lastName)
print(string) // user name : Gildong Hong

/*

 */

let numberFormatter = NumberFormatter()
// 숫자에 쉼표를 찍어준다!
numberFormatter.numberStyle = .decimal
let price = 100_000
let result = numberFormatter.string(for: price)!
print(result) // 100,000

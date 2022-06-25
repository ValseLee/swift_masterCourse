/*
 1. 클로저와 1급 객체.
 - 클로저 : 이름 없는 익명 함수. 함수와 동일한 기능을 수행하는데 형태가 다름
 파이썬의 람다, C의 블록과 동일
 함수는 이름으로 묶여 있는 코드를 이름() 의 형태로 호출한다.
 클로저는 이름이 없다. 이름 없어도 호출할 수 있다!

 - 일급객체 : 함수도 타입으로 취급하는 swift. 그 의미는 다음과 같다.
 함수를 변수에 할당할 수 있고
 함수를 호출할 때, 함수(클로저)를 파라미터로도 전달할 수 있으며
 함수가 함수를 다시 반환할 수도 있다. <- 재귀함수도 가능

 */

let a: (String) -> String // 파라미터 문자열, 문자형 리턴
let b: (String) -> Void // 파라미터 정수, 리턴 없음
let c: (String) -> Void // 파라미터 문자열, 리턴 없음

func myFunc(str: String) -> String { // 평범한 함수
    return "Hello, \(str)"
}

// 위의 함수와 완전히 동일한 기능을 수행하는 클로저
// 중괄호는 '특정하게 연속되는 코드를 실행하는 영역'이라는 걸 이해
let close = { (str: String) -> String in "Hello, \(str)" } // in 키워드는 큰 의미 없음
print(close("Vetiver")) // Hello, Vetiver

let noReturn = { print("hi") } // () -> () 가 생략된 형태
noReturn() // hi

@discardableResult
func function1(_ str: String) -> String {
    return str + "!!!"
}

@discardableResult
func function2(name: String) -> String {
    return name + "???"
}

var func1Pointer: (String) -> String = function1
// 변수에 함수를 할당하면, 아큐먼트레이블을 써줄 필요 없음
print(func1Pointer("wow")) // wow!!!

// 동일한 인풋 타입과 아웃풋 타입을 가진 함수를 새로 할당
func1Pointer = function2
print(func1Pointer("What")) // What???

// 클로저 적용
let closureType = { (param: String) -> String in
    "\(param), Hihi"
}

print(closureType("Steve")) // Steve, Hihi

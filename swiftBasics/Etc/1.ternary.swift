// 예시로 바로 보자
// 선택지가 2개일 때 사용한다.
// 대체로 결과를 대입할 때 사용
var a: Int = 10
a > 0
    ? print("true") // run when the condition is true
    : print("false") // run when the condition is false

var name: String = a > 0
    ? "스티브"
    : "팀쿡"
print(name) // 스티브

let result = score >= 80
    ? "Pass"
    : "Fail"
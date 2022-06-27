/*
 1. 문맥 내 파라미터와 리턴 밸류 타입 추론 가능 (Type Inference)
 2. 한 줄로 코드가 작성될 경우, 리턴 생략 (Implicit Return)
 3. 아규먼트 레이블 축약 -> $0, $1
 4. 트레리링 클로저(후행 클로저) : 함수 마지막 전달 인자로 클로저를 전달할 경우 소괄호 생략
 */

func closureFunc(closure: () -> Void) {
    print("Start")
    closure()
}

// 1. 후행 클로저
closureFunc {
    print("end - trailing closure")
} // Start, end - trailing closure

closureFunc(closure:) {
    print("end - brace move")
} // Start, end - brace move

func closureUsage(a: Int, b: Int, closure: (Int) -> Void) {
    let c = a + b
    closure(c)
}

closureUsage(a: 3, b: 4) { c in
    print(c)
} // c

// 2. 파라미터 간소화
func performClosure(param: (String) -> Int) {
    print(param("Swift"))
}

performClosure(param: { (str: String) -> Int in
    str.count
}) // 5

performClosure(param: { str in
    str.count
})

// 아규먼트 레이블 축약
performClosure(param: {
    $0.count // $0 == 1번 파라미터 ,  $n == n번 파라미터
})

// 완전 간소화
performClosure { $0.count }

let closureUsage2: (Int, Int) -> Int = { $0 * $1 }

/*
 기본적인 논리 연산자 : !, &&, ||

 논리 연산자는 &&를 평가하고 ||를 평가하는 우선순위가 있다.

 CPU가 가장 빠르게 값을 확인하기 위해 최소한의 코드만 실행한다.
 이를 논리 연산자의 단락평가라 한다.

 false && true 면, false만 평가하고 true까지 확인하지 않는다.
 어차피 false니까.
 반대로 true || false 면, true만 평가하고 false까지 확인하지 않는다.
 어차피 true니까.
 */

var num = 0
func check() -> Bool {
    print(#function)
    // num 변수의 값이 함수에 따라 변화 == 사이드이펙트
    num += 1
    return true
}

if check() || check() {} // check() 한 번만 출력됨
print(num) // 1
num = 0

if check(), check() {} // check() 두 번 출력됨
print(num) // 2

//

var doorCheck = 0
var passwordCheck = 0

func door() -> Bool {
    doorCheck += 1
    print(#function)
    return true
}

func password() -> Bool {
    passwordCheck += 1
    print(#function)
    return true
}

if door() && password() && false || true && door() && password() {}
// door 2번, password 2번 출력
print(doorCheck, passwordCheck) // 2, 2
doorCheck = 0
passwordCheck = 0

if door() || password() && door() || false && door() {}
// door 1번

/*
 단락 평가로 인한 사이드이펙트를 줄이고 싶다면, 함수 결과를 변수에 바인딩해서 쓰는 습관을 쓰자.
 단락 평가로 인한 실행횟수의 차이가 사라지고 의도치 않은 결과 또한 피할 수 있다.
 통제할 수 없는 사이드이펙트는 최소화하자.
 */

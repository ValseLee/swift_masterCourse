// switch 2
// if는 조건 2개, 중첩, 범위가 넓다
// switch는 가독성이 높고 분기 처리가 편리하다

var 변수: String = "변수야 변수";
switch 변수 {
    case "변수야 변수":
    print("와 변수!");
    default:
    break;
}

// 바인딩 : 기존 변수를 새로운 변수/상수에 식별자로 할당하는 것
var a: Int = 7;
let c: Int = a;
// a를 c에 재할당이 가능하다. 새로운 메모리 공간이 만들어지고 값이 복사된다.

var num: Int = 6;

switch num {
    case let a:Int // num을 a에 재할당
    print("숫자 : \(a)");
    default:
    break;
}

// 바인딩을 하는 이유?
switch num {
    case let x where x % 2 == 0:
    // num은 정수고 모든 케이스는 불 대수를 요구한다.
    // 그래서 case num % 2 == 0: 으로 쓸 수 없다.
    // 그래서 정수와 케이스 비교가 불가능(타입 불일치).
    // num을 새로운 상수에 담고 조건으로 재작성해야 함
    print("\(x)는 짝수");
    case let x where x % 2 == 1:
    print("\(x)는 홀수");
    default:
    break;
}

switch num {
    case let n where n <= 7:
    // var 로 선언할 수도 있다.
    // 그러면 n을 가공할 수 있겟지 근데 대체로 let 으로 선언
    print("\(n)은 7 이하")
    default:
    break;
}

// where 은 조건절을 의미
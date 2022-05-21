// 표현식과 변수를 매칭하여 분기처리하는 조건문
// 모든 경우의 수가 반드시 다루어져야 한다(exhaustive)
// 각 케이스 별로 최소 하나 이상의 문이 필요
var choice: String = "가위"

switch choice {
    case "가위":
        print("가위입니다");
    case "바위":
        print("바위입니다");
    case "보":
        print("보입니다");
    default:
        print("어이, 조건이 잘못되었다");
        break;
}

switch choice {
    case "가위", "보":
    print("Wow");
}

var isTrue: Bool = true
switch isTrue {
    case true:
    print("true")
    case false:
    print("false")
} // 모든 경우가 명시되는 조건문이라면 디폴트 없어도 된다

// fallthrough

var num1: Int = 9
switch num1 {
    case ..<10:
    print("1");
    case 10:
    print("10?");
    fallthrough; // 이러면 바로 하단의 케이스를 실행
    default:
    print("오잉쓰");
}

// 범위연산자(...), 
var num2: Int = 30;
// 패턴매칭연산자 : 피연산자가 좌항에 속하는가? 반환값타입 = bool
29...500 ~= num2; // true
51...100 ~= num2; // false

// switch에서의 활용
switch temp {
    case temp < 0:
    print("음수");
} // 이렇게 쓰면 안돼
 
switch num2 {
    case ..<0:
    print("음수일 경우")
    case 0...30:
    print(true);
    case 31...100:
    print(false);
    case 19...:
    print("over 19(include)");
    default:
    print("num2 is too big");
}

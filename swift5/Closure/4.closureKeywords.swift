import Foundation

// 일반 형태의 클로져 (non-escaping Type)
// 함수가 끝나면 클로저도 사라진다.
// 클로저를 굳이 힙에 저장할 필요가 없고 함수 내에서 클로저를 실행할 때 사용한다.
func perform(closure: () -> Void) {
    print("시작")
    closure()
}

perform {
    print("종료")
}

// @escaping 키워드가 필요한 경우?
/*
 일급객체로서의 클로저 활용이라 할 수 있다.
 원칙적으로 함수 실행이 종료되면 파라마티로 쓰이는 클로저도 제거된다.
 @escaping 키워드를 활용해서 클로저를 제거하지 않고 함수에서 탈출시킬 수 있다.
 ===> 클로저가 함수의 실행흐름과 스택프레임을 벗어나도록 함
 함수 내부의 클로저를 외부 변수에 저장하거나, 비동기 코드(GCD)를 사용해야 할 때 사용한다.
 클로저의 주소가 담긴 외부 변수가 main()으로 전달되고
 클로저 자신은 힙에 저장되기 때문에, 메모리 관리도 필요하다.
 */
var aSavedFunction: () -> Void = { print("HI") }
aSavedFunction()

// 클로져를 변수에 할당하는 역할의 함수
// 클로저를 실행하지 않는다.
func perform2(closure: @escaping () -> Void) {
    aSavedFunction = closure
}

perform2 {
    print("재할당")
}

aSavedFunction()

// GCD 예제
// 나중에 제대로 공부하게 될 것...
func perform3(closure: @escaping (String) -> Void) {
    var name = "Hong"

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        closure(name)
    }
}

perform3 { name in
    print("이름 출력: \(name)")
}

// @autoclosure 키워드
/*
 함수 파라미터 중 클로저 타입에 @autoclosure가 붙는 경우가 있다.
 클로저의 인풋 파라미터가 없을 때만 사용할 수 있다.
 실제 코드의 명확한 해석이 어려워질 수 있어서 가능하면 사용하지 않는다.
 기본적으로 non-escaping 클로저이다.
 */

// 파라미터로 '함수 타입' 을 명시했는데
func some(closure: @autoclosure () -> Bool) {
    if closure() {
        print("true")
    } else {
        print("false")
    }
}

// 실행부에서는 클로저 파라미터로 '불 타입'을 요구하고 있다.
// 해당 파라미터로 전달되는 표현식을 자동으로 클로저로 만들어주고 있기 때문
some(closure: Bool)
var num = 1
some(closure: num == 2) // false

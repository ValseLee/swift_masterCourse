/*
 1. 서버통신에 활용되는 URLSession
 2. 시간차 반복 코드 Timer.scheduledTime
 3. ✨뷰컨 관리
 4. 콜백함수(함수 실행하며 파라미터로 전달하는 함수) -> 함수실행 결과를 콜백함수로 받아 처리함
 5. multiple Trailing Closure (after swift 5.3)
 */

URLSession(configuration: .default)
    .dataTask(with: URL, completionHandler: (Data?, URLResponse?, Error?) -> Void)

URLSession(configuration: .default)
    .dataTask(with: URL) { data, response, error in
        print(data, response, error)
    }

// 출력에 시간을 두고 반복
Timer.scheduledTime(withTimeInterval: 1, repeats: true, block: (Timer) -> Void)
Timer.scheduledTime(withTimeInterval: 1, repeats: true) { timer in
    print("1초 텀, \(timer)")
}

// ViewCon
// completion이라는 이름이 포함된 파라미터는 동작이 완료된 후 실행할 함수의 파라미터를 의미함
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoadw()
    }
}

let vc = ViewController()
vc.dismiss(animated: Bool) { completion in
    print("화면 전환 완료", completion)
}

func multi(first: () -> Void, second: () -> Void, third: () -> Void) {
    first()
    second()
    third()
}

multi {
    // code for first
} second: {
    // code for second
} third: {
    // code for third
}

// 다중 클로저의 아규먼트 레이블 생략 예시
func multi2(first: () -> Void, _ second: () -> Void, third: () -> Void) {
    first()
    second()
    third()
}

multi2 {
    // code for first
} _: {
    // code for second
} third: {
    // code for third
}

UIView.animate(withDuration: Timeinverval, animation: () -> Void, completion: ((Bool) -> Void)?)

UIView.animate(withDuration: 2) {
    // code for animation
} completion: { Bool in
    print(Bool)
}

/*
 1. 요구사항에 대한 선택적 구현
 - 어트리뷰트 키워드
 	- @available, @objc, @escaping, @IBOutlet ...
 - 어트리뷰트는 2가지 종류가 있다.
 	1. 선언에 대한 추가 정보 제공
 	2. 타입에 대한 추가 정보 제공
 */

// iOS 10.0 이상에서만 class 가 인식된다는 표현
@available(iOS 10.0, macOS 10.12, *)
class SomeType {}

// 함수타입에 대한 정보 제공
func doSth(param _: @escaping () -> Void) {}

// 요구사항을 선택적으로 하고 싶다면?
// 1. 프로토콜 앞에 @objc
// 	objc는 요구사항이 선택사항이었고 구조체와 열거형은 프로토콜을 채택할 수 없었다
// 2. 선택적 속성이나 메소드 앞에 @objc optional
// 다만 @objc 로 선택사항을 갖고 있는 프로토콜을 쓴다면 '구조체와 열거형' 에서는
// 채택할 수 없다

@objc protocol Remote {
    @objc optional var isOn: Bool { get set }
    func turnOn()
    func turnOff()
    @objc optional func netflix()
}

class TV: Remote {
    func turnOn() {
        print("on")
    }

    func turnOff() {
        print("off")
    }
}

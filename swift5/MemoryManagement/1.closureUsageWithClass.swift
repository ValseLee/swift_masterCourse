/*
 객체 내에서의 클로저 사용이 아주 일반적인 편
 클로저 내에서 객체 속성 및 메소드에 접근할 땐 당연히 반드시 self를 써주자
 Swift 5.3 부터는 구조체의 클로저에서 self를 안 써도 대

 클래스 내에서 클로저가 선언되었더라도, 클로저 자체는 인스턴스 '외부'의 힙에 존재한다는 점을 유의해라
 그래서 강한 참조 하면 RC가 2개가 된다. 변수에 할당된 인스턴스가 하나를 더하고 클로저가 하나를 더하기 때문

 만약 강한 참조 싸이클로 인해 메모리 누수가 예상된다면 weak이나 unowned를 잘 사용해주도록 하자
 */

import Foundation

class Dog {
    var name = "초코"

    func doSth() {
        // DispatchQueue : 특정 작업을 수행시킬 때, 쓰레드를 이동시킨다
        // 그러면 async 다음에 오는 클로저는 작업 중 사라지면 곤란하겠지?
        // 이 클로저는 비동기 실행된다!
        // Dog 클래스의 이름에 접근하기 위해 self를 써주자
        // 왜? RC를 1로 만들고 2번 쓰레드에서 작업하는 동안 클로저를 유지하기 위해서!
        DispatchQueue.global().async {
            print("self가 꼭 필요한 클로저", "\(self.name)!!")
        }
    }

    func doSthMore() {
        // 아니면 self 를 캡쳐리스트에 넣어도 좋다. <- swift 5.3 이후
        // 그런데.. 옵셔널이면서 언래핑을 안하면 곤란하겟지?
        DispatchQueue.global().async { [weak self] in
            print("self가 꼭 필요한 클로저", "\(self?.name)!!!!!")
        }
    }

    func doAnother() {
        DispatchQueue.global().async { [weak self] in
            /*
             그렇다면 약한 참조를 쓸 때는 이렇게 weak self를 언래핑 해봅시다.
             if let 을 쓰면 nil을 넣으면 print 없이 클로저를 '종료'한다.
             guard let을 쓰면 nil일 때, 클로저 자체를 '종료' 시킨다.
             */
            guard let weakSelf = self else { return }
            print("guard let 언래핑 : \(weakSelf.name)")
        }
    }

    func doThis() {
        DispatchQueue.global().async { [weak self] in
            if let weakSelf = self {
                print("if let : \(weakSelf.name)")
            }
        }
    }

    func walk() {
        print("self가 없는 일반 메소드", name)
    }
}

var choco = Dog()
choco.doSth()
choco.doSthMore()
choco.doAnother()
choco.walk()
choco.doThis()

/*
 Stack은 쓰레드를 의미한다.
 여러 Stack을 쓰고 싶을 때 쓰레드를 늘릴 수 있다.
 Cpu가 4개면 스택도 당연히 4개겠지?
 코드 영역에 대해 각 쓰레드가 필요한 작업을 수행해야 한다.
 코드와 데이터, 힙 영역은 메모리를 공유하고 있다.
 각 스택은 코드 ,데이터, 힙 영역을 다 공유할 수 있지만 스택만큼은 서로를 공유할 수 없다.

 위 코드를 다시 보면, main()이 있는 메인 쓰레드에서 doSth()을 실행하고, 그 결과로 클로져를 힙에 생성한다.
 그런데 클로저 자체는 DispatchQueue에 의해 2번 쓰레드에서 실행된다.
 2번 쓰레드에는 closure()와 print() 스택 프레임이 쌓이겠지

 이 클로저는 따로 변수에 저장되어 있진 않고, 2번 쓰레드의 작업이 해당 클로저를 참조하고 있기 때문에 RC 는 1이다.
 따라서 클로저가 2번 쓰레드에서 종료되면 힙에서 내려온다.
 */

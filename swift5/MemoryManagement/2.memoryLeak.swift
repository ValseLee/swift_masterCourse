import Foundation

class Dog {
    var name = "크림"
    var run: (() -> Void)?

    func walk() {
        print("\(name) : 걸어요")
    }

    func saveClosure() {
        // 클로저를 인스턴스 변수에 저장
        run = {
            print("\(self.name) : 뛰어요")
        }
    }

    deinit {
        print("\(self.name) : 메모리 해제")
    }
}

func doSth() {
    let cream: Dog? = Dog()
    cream?.saveClosure()
}

/*
 cream 변수에 이제 Dog() 인스턴스의 주소를 갖게 되겠지?
 main() 위에 doSth()이 실행되고, doSth() 이 끝나면 cream은 사라질 거야
 그런데 saveClosure()가 실행되면 run에 클로저가 할당되겠지?
 클로저도 인스턴스를 가리키고, cream도 인스턴스를 가리키고 있다.
 cream 인스턴스가 doSth() 함수가 끝나서 RC가 1이 줄어도 사라지지 않는다.
 바로 강한 참조 사이클 때문

 클로저가 가리키는 참조와 run이 가리키는 참조 때문에 메모리 해제가 되지 않는 거야!
 run은 클로저를 가리키고 있다. 서로 강한 참조 사이클을 일으키고 있다.
 클로저가 self.name을 강한 참조를 하고 있기 때문
 이게 바로 메모리 누수!!!
 그렇다면 이렇게 약한 참조를 해주면 되겠다.
 */

/*
 func saveClosure() {
     var run = () -> Void?
     run = { [weak self] in
         guard let weakSelf = self else { return }
     }
 }

 */

doSth()

// 실제로는 이렇게 쓰인다
// 첫번째 예시는 강한 캡쳐를 통해 "뷰컨"이 출력되는 과정을 담고 있다.
// 강한 참조 사이클이 일어나는 예시는 아니야!

class ViewController: UIViewController {
    var name: String = "뷰컨"

    func doSth() {
        DispatchQueue.global().async {
            // sleep 메소드는 파라미터(초) 만큼 쓰레드가 작동을 멈춘다
            sleep(3)
            print("글로벌큐에서 출력 : \(self.name)")
        }
    }

    deinit {
        print("\(name) : 메모리 해제")
    }
}

func localScope() {
    let vc = ViewController()
    vc.doSth()
}

localScope()

/*
 이번에는 약한 참조로 해보자
 뷰컨의 메모리가 먼저 사라지게 되고, 뷰컨의 메모리가 사라지면서 name도 사라지기 때문에 nil을 출력한다.
 변수 vc가 주소값을 할당받으면서 힙 인스턴스의 RC가 1이 된다.
 이번엔 약한 참조가 일어나기 때문에 힙 인스턴스 RC가 1에서 늘어나지 않는다.
 그런데 localScope1가 종료되면서 그 안에 있던 변수 vc도 사라지고 RC가 0이 된다.
 vc.doSth()이 실행되어야 하는데, 그 내부의 클로저가 참조하는 name이 담겨 잇던 인스턴스가 사라졌기 때문에
 nil이 출력된다

 그래서... 만약에 작업이 오래 걸릴 일이 있으면 힙 인스턴스가 유지되도록 하는 게 좋다.
 의도적인 강한 참조가 필요할 때가 있다는 점
 */

class ViewController1: UIViewController {
    var name: String = "뷰컨"

    func doSth() {
        DispatchQueue.global().async { [weak self] in
            // guard let weakSelf = self else { return }
            sleep(3)
            print("글로벌큐에서 출력 : \(self.name)")
        }
    }

    deinit {
        print("\(name) : 메모리 해제")
    }
}

func localScope1() {
    let vc = ViewController()
    vc.doSth()
}

// 흥미롭게도 뷰컨이 메모리에서 해제된 다음에!!! 다른 쓰레드의 print가 실행된다.
// 만약 가드렛을 하지 않으면 self.name 은 nil이 될 거야
localScope1()

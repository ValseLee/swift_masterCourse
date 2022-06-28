/*
 - 프로토콜로 생성자를 요구하는 일은 사실 드물다는 점!

  1. 클래스는 상속을 고려해야 하기 때문에 프로토콜의 생성자를 채택하고
  클래스에서 사용할 때 required 키워드가 필요
  1.1. 구조체는 상속이 없기 때문에 구조체 내에서 required 키워드 불필요
  2. final로 클래스 상속 자체를 막아버리면 required 키워드 불필요
  3. 클래스 내에서는 지정생성자로 구현할 필요는 없음
  */

protocol AProtocol {
    init(num: Int)
}

class A: AProtocol {
    var num: Int
    required init(num: Int) {
        self.num = num
    }
}

class B: A {
    var num2: Int

    required init(num: Int) {
        num2 = 0
        super.init(num: num)
    }
}

// 실패 가능 생성자를 갖는 프로토콜은 타입 내에서 실패불가능한 생성자로 확대구현 가능
protocol Bproto {
    init?(num: Int)
}

class C: Bproto {
    var num: Int
    // Bproto의 실패가능 생성자가 실패 불가능으로 확장된 모습
    required init(num: Int) {
        self.num = num
    }
}

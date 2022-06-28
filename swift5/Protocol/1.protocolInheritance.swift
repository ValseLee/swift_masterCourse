/*
 수백 수천의 메소드와 기능을 새로 정의할 수 없다는 걸 보여주기 위한 예시
 재정의는 실무에서 거의 불가능하다.
 상속 구조는 '실무'에서 매우 불편을 야기할 수 있다.
 */

class Bird {
    var isFemale = true
    func layEgg() {
        if isFemale {
            print("Lay")
        }
    }

    func fly() {
        print("fly!")
    }
}

class Eagle: Bird {
    func soar() {
        print("Soaring Eagle!")
    }
}

class Penguin: Bird {
    func swim() {
        print("Swim~")
    }
    // 상속 구조 때문에 fly 기능도 갖게 된다.
    // 의도치 않은 기능이 Penguin 클래스로 포함된 상황
}

// 비행도 fly 하니까.. 기능 때문에 억지로 상속한 경우
class Airplane: Bird {
    override func fly() {
        print("plane~")
    }
    // 그런데.. 비행도 하고.. 알도 낳는.. 비행기...??
}

struct FlyingMuseum {
    func flyingDemo(flyingObj: Bird) {
        flyingObj.fly()
    }
}

let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()
myEagle.soar()

let myPlane = Airplane()

let museum = FlyingMuseum() // Bird 클래스만 struct의 파라미터 타입으로 정해져 있다.
museum.flyingDemo(flyingObj: myEagle)
museum.flyingDemo(flyingObj: myPlane) // Bird 라는 클래스의, 비행기를 박물관에 전시?...

// 이렇게 가독성이 왕창 꼬인 코드가 완성될 수 있다...

// 문제 해결을 위해 프로토콜을 정의해보자.
protocol CanFly {
    // 프로토콜 내부에는 코드의 구현부가 없다.
    func fly()
}

// 이번엔 fly 메소드가 없는 클래스를 선언해보자
class Bird1 {
    var isFemale = true
    func layEgg() {
        if isFemale {
            print("Lay")
        }
    }
}

// Bird1을 상속하고, CanFly 프로토콜을 함께 채택한다.
class Eagle1: Bird1, CanFly {
    // CanFly에 구현된 fly() 메소드를 여기서 구체화할 수 있다.
    func fly() {
        print("Flies")
    }

    func soar() {
        print("Soaring Eagle!")
    }
}

struct FlyingMuseum1 {
    // 프로토콜은 타입이다!!
    func flyingDemo(flyingObj: CanFly) {
        flyingObj.fly()
    }
}

// Subscript
protocol Sub {
    subscript(_: Int) -> Int { get }
}

struct Data: Sub {
    subscript(_: Int) -> {
        return 0
    }
}

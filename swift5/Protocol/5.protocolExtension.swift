/*
 1. 매번 프로토콜을 채택할 때마다 구체화하는 것은 매우 번거로움
 2. 이 번거로움을 막기 위해 디폴트 구현을 지원함
 */

protocol Remote {
    func turnOn()
    func turnOff()
}

class TV: Remote {
    func turnOn() {}
    func turnOff() {}
}

struct Radio: Remote {
    func turnOn() {}
    func turnOff() {}
}

// 프로토콜 확장
// 요구사항 우선순위가 있기 때문에, 클래스 내에서 실제로 요구사항이 구현된다면
// 당연히 클래스의 구현 내용을 따른다.
// 프로토콜의 기본 요구사항을 통해 프로토콜 메서드 테이블이 생성된다. == Witness Table
// 이 요구사항이 담긴 프로토콜 메서드 테이블은 '불변'한다.
// Witness Table 은 개발자가 직접 구현하는지, 아니면 확장 프로토콜의 기본 메소드를 사용하는지, 그리고 어떤 타입을 채택하여 인스턴스를 만드는지에 따라
// 사후적으로 생성된다.
extension Remote {
    func turnOn() {
        print("On")
    }

    func turnOff() {
        print("Off")
    }

    // 그러나 요구사항이 아니었던 것이 추가된다면?
    // 우선순위가 아니라 '타입'에 따라 실행되는 메소드가 변경된다.
    // 만약 인스턴스를 클래스의 타입이 아닌 프로토콜의 타입으로 생성한다면? (캐스팅)
    // 클래스 내에서 구현된 notInProtocol 메소드가 아니라 확장 프로토콜 내의 notInProtocol 메소드를 실행한다.
    // == Direct Dispatch
    func notInProtocol() {
        print("이건 기존 요구사항이 아닌데?")
        print("Remote 타입으로 생성하면 '클래스나 구조체 내에 이게 구현되어 있더라도' 이게 실행된다.")
    }
}

class TV1: Remote {
    // 프로토콜의 요구사항 생략 가능
    func turnOff() {
        print("OFF??")
    }

    func notInProtocol() { // 요구사항이 아닌 추가 선언 메소드는 메모리 주소를 따로 삽입한다.
        print("만약 TV1 클래스 타입으로 생성하면 이게 실행된다")
    }
}

// Remote 프로토콜 타입의 tv1을 TV1.init()으로 생성
let tv1: Remote = TV1()
tv1.notInProtocol() // 이건 기존 요구사항이 아닌데?, Remote 타입으로 생성하면 '클래스 내에 이게 구현되어 있더라도' 이게 실행된다.
// 확장 프로토콜에서 추가로 선언된 '요구사항이 아닌' 메소드는 메모리 주소를 직접 삽입한다.

struct Phone: Remote {
    func turnOn() {
        print("Phone On")
    }

    func notInProtocol() {
        print("Whoa")
    }
}

let phone: Remote = Phone()
phone.turnOn() // Phone On <- on Struct
phone.turnOff() // Off <- From Witness Table
phone.notInProtocol()

// 구조체는 클래스와 달리 가상의 메소드 테이블(메소드 배열)이 없다.
// 프로토콜에서는 요구사항이 담긴 Witness Table이 있다.
// 그래서 본래 타입으로 인스턴스를 생성하면 Direct Dispatch로 메소드 주소가 구조체에 직접 삽입된다.
// 만약 프로토콜 타입으로 인스턴스를 생성하면?
// 구조체 내에 구현되어 있다면, 그 내용에 따라 Witness Table의 요구사항을 실행하고
// 요구사항이 아니었던 확장 프로토콜의 메소드는 그 자신의 구현 내용을 실행한다.

// 프로토콜의 스트링 메모리가 큰 인스턴스는 구조체더라도 'Heap'에 저장된다.
// 그 크기가 작으면 Stack에 저장된다.

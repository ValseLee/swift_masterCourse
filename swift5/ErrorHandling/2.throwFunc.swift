/*
 https://bbiguduk.gitbook.io/swift/language-guide-1/error-handling
 참고
 */

enum Checking: Error {
    case aError
}

func throwFunc() throws {
    throw Checking.aError
}

// 함수가 에러를 처리하도록 정의
func handleError() {
    do {
        try throwFunc()
    } catch {
        print(error)
    }
}

handleError()

// 함수 내에서 에러를 처리하지 못하는 경우가 있다.
// 이 때는 에러를 다시 던져주는 throwing 함수를 써주자

// 에러를 처리 하지 않고 밖으로 내보내버린다.
// 투수와 포수를 나누는 거지
// catch랑 함께 쓰지 않으면 do 는 생략 가능
func handleError1() throws {
    try throwFunc()
}

// try는 do에서만 가능하니까 이렇게 호출한다.
do {
    handleError1()
} catch {
    print(error)
}

// rethrows 로 에러를 다시 던질 수 있다
// 파라미터로 throwing 함수를 받았는데 정상 처리가 안 될 때
func doSth(callback: () throws -> Void) rethrows {
    try callback()
}

func doSth1(callback: () throws -> Void) rethrows {
    enum Checking2: Error {
        case cError
    }

    do {
        try callback()
    } catch {
        throw Checking2.cError
    }
}

do {
    try doSth1(callback: handleError1())
} catch {
    print(error)
}

// 메서드와 생성자도 런타임 오류가 있을 수 있다.
// 마찬가지로 throw가 가능!

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11),
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        // guard 문을 통해 에러가 함수에 개입하지 않도록 할 수 있다.
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}

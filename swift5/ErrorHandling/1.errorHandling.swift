/*
 옵셔널 트라이, forced 트라이, 에러 핸들링
 */

enum Checking: Error {
    case aError
    case bError
    case cError
}

func checkError(a: Int) throws -> Bool {
    // 에러가 발생될 때 처리해야 한다면 throw 사용
    if a < 0 {
        throw Checking.aError
    }

    if a >= 7 {
        return true
    } else {
        return false
    }
}

// 기본적인 형태들

let isChecked1: Bool? = try? checkError(a: 3) // 언래핑 필요
if let result = isChecked1 {
    print("참 혹은 거짓")
}

// 이 경우는 에러가 없다는 확신이 찰 때 쓴다.
let isChecked2 = try! checkError(a: 3) // nil이 들어오면 런타임 에러

// catch의 구체적인 처리
// 그리고 catch에 구체적인 처리 방법이 구체화되면 모든 에러분기를 처리해야 한다.
do {
    let isChecked = try checkError(a: 3)

    if isChecked {
        print("참")
    } else {
        print("불가")
    }
} catch Checking.aError {
    print("a 에러가 발생")
} catch Checking.bError {
    print("b 에러가 발생")
} catch {
    print("그 외의 에러가 발생")
}

// ✨catch 문에서는 error 상수를 쓸 수 있다.

do {
    let result = try checkError(a: -3)
} catch {
    // error 상수를 다운캐스팅
    // 에러를 내가 정의했던 열거형으로 다운캐스팅해서 스위치 분기 처리가 가능하다
    // 이 상수 에러는 애플의 에러 프로토콜 타입이었다.
    if let error = error as? Checking {
        switch error {
        case .aError:
            print("a 에러 발생")
        case .bError:
            print("b 에러 발생")
        case .cError:
            print("그 외 에러 발생")
        }
    }
}

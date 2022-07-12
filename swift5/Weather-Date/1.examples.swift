import Foundation

// 날짜와 시간의 요소를 다룰 수 있는 DateComponents 구조체
// 내가 원하는 날짜 인스턴스를 만들어낼 수 있다.
var components = DateComponents()
components.year = 2021
components.month = 1
components.day = 1
components.hour = 12
components.minute = 10
components.second = 1

let oneday = Calendar.current.date(from: components)!
print(oneday) // 2021-01-01 03:10:01 +0000

extension Date {
    // Date 구조체를 확장하며 실패가능 생성자를 정의
    init?(y year: Int, m month: Int, d day: Int) {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day

        guard let date = Calendar.current.date(from: components) else { return nil }
        // 구조체 자신을 대체하는 인스턴스로 할당할 수 있다.
        self = date
    }
}

let someDate = Date(y: 2021, m: 10, d: 1)
print(someDate!) // 2021-09-30 15:00:00 +0000

/*
 fliter = 배열의 각 아이템을 조건에 따라 확인 후, 참을 만족하는 아이템을 배열로 만들어 새로 리턴
 */

let names = ["Apple", "Black", "Circle", "Dream", "Blue"]

var newArr = names.filter { names in
    names.contains("B")
}

let arr = [1, 2, 3, 4, 5]

var evenNum = arr.filter { $0 % 2 == 0 }
print(newArr, evenNum)

// 함수로 전달할 수도 있다.
// 짝수판별함수를 먼저 정의해보자.
func isEven(_ i: Int) -> Bool {
    return i % 2 == 0
}

// filter의 파라미터로 클로저 대신 함수를 전달해도 된다!
let evens = arr.filter(isEven)
print(evens)

// 다중필터링
// 리턴이 배열이기 때문에, 그 배열에 또 필터할 수 있는 거야
var over3 = arr.filter { $0 % 2 == 0 }.filter { $0 > 3 }

// 짝수이면서 3보다 큰 요소만 담긴 배열
print(over3)

/*
 기존 배열의 각 아이템을 클로저가 제공하는 방식으로 '결합'
 초기값을 reduce의 첫번째 파라미터로 전달해야 하고, 클로저를 후행으로 전달한다.
 클로저는 reduce에 전달한 초기값과 각 배열 요소 2개의 파라미터를 갖는다.
 마지막 결과값만 리턴함
 */

var num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 형태
// num.reduce(initialResult: Result, nextPartialResult: (Result, Int) throws -> Result)

var aa = num.reduce(0) { a, b in
    // initialResult는 말 그대로 시작점이다.
    // 이 시작점이 클로저로 배열의 정수와 함께 전달된다.
    // 클로저의 리턴 값은 자기 자신의 Result 로 전달된다.
    // 약간 재귀느낌이다.
    a + b
}

var aaa = num.reduce("0") { result, item in
    result + String(item)
}

// $0 == result, $1 == 배열요소
// 100 - 1 == 99, result = 99, 99 - 2 == 97, result = 97 ....
var minusFrom100 = num.reduce(100) { $0 - $1 }

print(aa, aaa, minusFrom100) // 55, 012345678910, 45

var char = ["안", "녕", "하", "세", "요"]

var name = "길동 "
var hi = char.reduce(name) { a, b in
    a + b
}

print(hi) // 길동 안녕하세요

// 홀수만 뽑아서 걔네들을 다 제곱하고 그 숫자를 다 더해라
var wow = num.filter { $0 % 2 != 0 }
    .map { $0 * $0 }
    .reduce(0) { $0 + $1 }
print(wow) // 165

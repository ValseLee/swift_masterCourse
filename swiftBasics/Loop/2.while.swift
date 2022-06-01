// while loop
var sum: Int = 0
var num: Int = 1

while num <= 50 {
    print(num)
    num += 1
}

while num <= 50 {
    sum += num
    num += 1
}

// repeat loop
// 무조건 한 번을 실행한다

var i = 1

repeat {
    print("\(3) * \(i) = \(3 * i)")
    i += 1
} while i <= 9

// ---

var number: Int = 5
var sum2: Int = 0

while number < 5 {
    sum2 += number
    number += 1
} // -> 5, 0

repeat {
    sum2 += number
    number += 1
} while number < 5
// -> 6, 5

// for, While, repeat-While

for a in 2 ... 10 {
    print(a)
}

// index == repeat constant(반복 상수)
for index in 1 ... 4 {
    print("\(index) : \(index * 5)")
}

var number: Int = 20

for i in 1 ... number {
    print(i)
}

// wildcard pattern == Underbar means simply repeat without repeat constant
for _ in 0 ... 10 {
    print("hello")
}

// you can use it like this meaning 'this str is just tmp'
_ = "str"

for i in (1 ... 10).reversed() {
    print(i)
}

// of course it can be used for Collection(=list)

let list = ["Swift", "Programming", "Language"]
for str in list {
    print(str)
}

for chr in "Hello" {
    print(chr)
}

// apply
for number in (1 ... 5).reversed() {
    print(number)
}

// stride
// stride(from: 1, to: 10, by: 2)
// 홀수만 프린트
for number in stride(from: 1, to: 15, by: 2) {
    print(number)
}


// 99 Dayuum

for i in 1 ... 9 {
    for j in 1 ... 9 {
        print("\(i) x \(j) : ", i * j)
    }
}

// 3 의 배수

for i in 1 ... 100 {
    if i % 3 == 0 {
        print("\(i) 는 3의 배수")
    }
}

// 반복문과 조건문 활용

for i in 1 ... 5 {
    for _ in 1 ... i {
        print("*", terminator: "")
    }
    print()
}

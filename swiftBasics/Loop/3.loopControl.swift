// continue, break
// Memory의 code를 제어하는 제어전송문
// 하나씩 프로세싱하는 CPU를 다음 작업으로 전송하는 명령어

for num in 1 ... 20 {
    if num % 2 == 0 {
        continue // if this condition is true, that period of code would stop and the next period will begin
    }
    print(num) // Odd number Printer
}

for num in 1 ... 20 {
    if num % 2 == 0 {
        break // if this condition is true, the nearest loop would stop
    }
    // print("Hi")
}

// for i in 0 ... 3 {
//     print("Outer \(i)")
//     for j in 0 ... 3 {
//         if i > 1 {
//             print(" j :", j)
//             continue
//         }
//         print(" Inner \(j)")
//     }
// }

// labeled is also possible

OUTER: for i in 0 ... 3 {
    print("OUTER : \(i)")
    for j in 0 ... 3 {
        if i > 1 {
            print(" j:", j)
            // continue OUTER // you can label specific loop statement
            // and also move to there
            break OUTER
        }
        print("  INNER \(j)")
    }
}

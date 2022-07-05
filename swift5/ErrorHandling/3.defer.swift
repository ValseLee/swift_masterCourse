/*
 코드 실행을 스코프 종료 시점으로 연기시키는 표현문
 동작의 마무리 작업을 해주는 표현문으로 자주 쓴다.
 */

func deferFunc() {
    defer {
        print("나중에하자")
    }
    print("이거부터해")
}

deferFunc()

func deferFunc2() {
    if true {
        print("defer가기 전에 return 되니까 이거만 출력 돼")
        return
    }
    defer {
        print("조건문 위로 올리면 실행됨!")
    }
}

deferFunc2()

// defer문은 역순으로 실행된다.
// 이렇게 여러 defer문을 쓰진 않는다.
func deferFunc3() {
    defer {
        print("1")
    }
    defer {
        print("2")
    }
    defer {
        print("3")
    }
}

deferFunc3() // 3, 2, 1

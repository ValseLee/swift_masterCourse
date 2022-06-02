// what does the curly brace mean?
// it differs the 'scope level'
// 1. if you dont initialize your variable, you cant access
// 2. inner brace can access to outer brace's variable (the nearest one first)
// 3. but the opposite case, you cant
// 4. in the same scope level, you can't use the same variable name agian
// 5. but outside that scope, you can use that variable name again

func greeting1() {
    print("hello")

    let myName = "hoho" // 선언 == 메모리 공간 만들어서 변수 넣기

    print(myName)
    print(name)

    if true {
        print(myName)
        print(name)
    }
}

greeting1() // you cant find the name variable in greeting1 scope

var name = "?" // in this case, this name is Global variable == it saves in memory 'data area'
// and,.. this is just study.swift..,. so it doesnt return error 🤷🏻‍♂️

func sayGreeting1() {
    print("Hello")

    func sayGreeting2() {
        print("Hey")
    }
    sayGreeting2()
}

sayGreeting1()
sayGreeting2() // nono you cant

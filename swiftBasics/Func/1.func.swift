// func basic codes

func doSth(name: String) {
    print("안녕하세요, \(name)")
}

doSth(name: "hoho")

// if func has return
// arrow 를 통해 Output의 타입을 정해준다.
// 그리고 return 이 강제된다. == 표현식(결과가 나오는 것)
// argument = 함수 호출에 사용되는 실제 값
func outputSth() -> String {
    let hello = "hi"
    return hello
}

var name: String = outputSth()
print(name)

// if func has both input and output
// output should have only one type

func plusFunc(a: Int, b: Int) -> Int {
    let sum = a + b
    return sum
}

print(plusFunc(a: 4, b: 2))

// what is void Type?
// func without return
// func name() -> ()  === func name() -> Void
// swift formatter automatically remove that.
func sayHello() {
    print("?")
}

// so what is the diff between void 'type' func and return func
// you can consider return func as that specific 'return'
//

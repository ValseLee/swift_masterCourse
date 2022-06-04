// when you have any returns from func
// there will be a temp memory space
// => CPU control and return are move together

// attribute keyword(속성 키워드) -> '@'
// gives additional information to compiler
// 1. 선언에 추가 정보 제공 (ex: @available)
// 2. 타입에 추가 정보 제공 (ex: @excaping)

// @discardableResult

func doSomething() {
    print("안녕하세요")
} // no return, Void Func

func sayHello() -> String {
    print("hi")
    return "안녕"
} // return func. but.. you dont use of it.
// it will gives you a warn message(not in playground)

_ = sayHello() // you should use that return func when you dont use that's return result
// ... so far

// but after swift 5.2 @discardableResult has developed

@discardableResult
func sayHelloString() -> String {
    print("오")
    return "hi"
}

sayHelloString() // no more warn message -> that return result is not necessary

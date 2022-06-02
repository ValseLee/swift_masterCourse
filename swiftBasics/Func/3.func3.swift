// carefully do use func
// 1. parameter
func addCalcul(_ a: Int) -> Int {
    // a += 10 // parameter is not variable.. so you cant do this
    let b = a
    return a - b
}

// 2. inner scope
func minusCalcul(_: Int) -> Int {
    let sum = 0
    return sum
}

// print(sum) // its scope level is not accurate

// 3. understanding the 'return'

func doSth(_ num1: Int, _ num2: Int) -> Int {
    let result = num1 + num2
    return result
} // basic layout

// but this func is not return type func...
// in this case, return means 'stop that func'
func dodoSth(_ num: Int) {
    if num >= 5 {
        print("5 이상")
        return
    }
    print("5 미만")
}

func whoa(_ num: Int) -> Int {
    if num >= 5 {
        return num
    }
    return 0
}

// 4. call func
func nameString() -> String {
    return "jobs"
}

var yourName: String = nameString()
if nameString() == "jobs" {
    print("same name")
}

// 5. nested Func
// you cant call inner func outside(scope)

func func1(_ backward: Bool, _ value: Int) -> Int {
    func goForward(input: Int) -> Int {
        return input + 1
    }

    func goBack(input: Int) -> Int {
        return input - 1
    }

    if backward {
        return goBack(input: value)
    } else {
        return goForward(input: value)
    }
}

print(func1(true, 8))

// function has type
func numberPrint(n: Int) {
    print(n)
}

// when it is void
var function1: (Int) -> Void = numberPrint(n:)
function1(5)

// how to assign a func to new value
// 1. lots of parameters
// write all parameters and colon without comma
func func1(backward: Bool, value: Int) -> Int {
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

var ohoh = func1(backward:value:)
print(ohoh(true, 5))

// 2. func has argument label + parameter
// in this case, this func name is func name + argument label
func add(n num: Int) {
    print(num + num)
}

var oh = add(n:)
print(oh(5))

// if argument label has skiped, do the same when point that func
func doSth(_ n: Int) {
    print(n)
}

var ohho = doSth(_:)
print(ohho(4))

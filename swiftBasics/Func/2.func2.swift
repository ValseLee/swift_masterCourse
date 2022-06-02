// argument Label : it exposes its name
func printName1(first n: String) {
    print(n)
}

printName1(first: "오잉")
// you can deliever more information
// so.. argument label is placeholder
// of course you can skip this
// and in this way, you can call function without any additional type

func addPrint(_ firstNum: Int, _ secondNum: Int) {
    let sum = firstNum + secondNum
    print(sum)
}

addPrint(2, 4) // so comfy✨

// 2. variadic parameter
// multi data(when you don't know its toll length) into one parameter
// in this case, all arguments will packed in 'array'
// variadic parameter can only be declared 'once'
// and variadic parameter has no basic data
// => variadic parameter(...) is list(parameter) ?

func calcul(_ numbers: Double...) -> Double { // that dot is variadic parameter
    var total = 0.0
    for number in numbers {
        total += number
    }
    return total
}

print(calcul(1.4, 2, 5, 6))

// parameter default set
func numFunc(_ num1: Int, _ num2: Int = 5) -> Int {
    let result = num1 + num2
    return result
}

print(numFunc(2, 7))
print(numFunc(2)) // like this, you can skip second arg.

// in case of print() ...
// print(items: Any..., separator: String, terminator: String)
print("hi", "Yeah", separator: " ", terminator: "\n")
// seperator, terminator has default value "" and "\n"

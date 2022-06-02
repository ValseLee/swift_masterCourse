// Overloading

func doSomething(value: Int) {
    print(value)
}

func doSomething(value: Double) {
    print(value)
}

func doSomething(value: String) {
    print(value)
}

// can reuse same function name

doSomething(value: "hi")
doSomething(value: 1)
doSomething(value: 1.2)
// example : print() .. it has so many other kinds
// and the compiler can diff all that by 'func name', 'type', 'number of parameters', 'return type'

// explain with code
var total: Int = 0

func square(_ i: Int) -> Int {
    return i * i
}

func squareOfSum(_ x: Int, _ y: Int) -> Int {
    let z = square(x + y)
    return z
}

func start() {
    let a = 4
    let b = b
    total = sqaureOfSum(a, b)
}

start()

/*
 0. main() start -> start() call
 	- global var total defined at memory_data area (co-'da'-heap-stack)
 1. start() -> squareOfSum() call
 	- scope var 'a', 'b' defined at memory_stack area (co-da-heap-'stack')
 2. squareOfSum() -> square() call
 	- do i * i and return result
 3. square() return -> squareOfSum() return -> start() end
 */

// ---

var k = 1
var j = 1

func addOneMore2() -> Int {
    j += 1
    return 5
}

func addOneMore1() {
    var num = 0
    k += 1
    num += addOneMore2()
    print(num)
}

addOneMore1()

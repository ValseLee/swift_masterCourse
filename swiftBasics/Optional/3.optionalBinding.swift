// practice

var number: Int? = 7
var hello: String? = "HI"
var name: String? = "hong"
var newNum: Double? = 5.5
var isTrue: Bool? = true

if let num = number {
    print(num)
}

if let isFalse = isTrue {
    print(isFalse)
}

func test(_ name: String?) {
    guard let n = name else {
        return
    }
    print("Ok")
}

test("ho")

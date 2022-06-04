// Optional Chaining
// not fully studied yet

class Dog {
    var name: String?
    var weight: Int?

    func sit() {
        print("sitdown")
    }
}

var choco: Dog? = Dog()
choco?.name = "초코"
bori?.sit()

// IUO Type
// not fully studied yet

var name: String! = "hong"

// func and Optional
// when you define a func, you can use Optional
// but it is highly recommended to use default nil
// preventing missing argument error

func doSth(with _: String, name _: String? = nil) {
    print("\(label): \(name)")
}

doSth(with: "label", name: "Hong")

let a: Int? = 1

// 1. Enum Optional
switch a {
case let .some(z):
    print(z)
case .none:
    print("Nil")
}

// 2. Optional Pattern
switch a {
case let z?: // let z? = Optional.some(a) => let z? = .some(a)
    print(z)
case nil:
    print("nil")
}

// 3. case handling
if case let .some(x) = a {
    print(x)
}

// Optional Pattern
if case let x? = a {
    print(x)
}

let arr: [Int?] = [nil, 2, 3, nil, 5]

for case let .some(num) in arr {
    print("\(num)")
}

for case let num? in arr {
    print("\(num)")
}

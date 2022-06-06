// dic comparison
let a = ["A": "Apple", "B": "Banana", "C": "City"]
let b = ["A": "Apple", "B": "Banana", "C": "City"]

print(a == b)

// dic utilize
var dict1 = [String: [String]]()
dict1["arr1"] = ["A", "B", "C"]
dict1["arr2"] = ["D", "E", "F"]
print(dict1)

var dict2 = [String: [String: Int]]()
dict2["dic1"] = ["name": 1, "age": 2]
dict2["dic2"] = ["name": 2, "age": 4]
print(dict2["dic1"]!)

// loop✨
// dict doesnt have any order.
// so when you do sth with dic, its processing order is not the same
let dict = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, value) in dict { // dict 은 열거하지 않아도 named tuple return is possible
    print("\(key) : \(value)")
}

for (_, value) in dict {
    print("Value :", value)
}

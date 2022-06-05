var nums = [1, 5, 3, 2, 5, 6]

// sorting
// nums.sort() // nums 자체를 sort (OOP를 생각해) // not return type func
// var a = nums.sorted() // nums 를 임시 sort하고 반환. // return type func
// nums.reverse()
// nums.reversed()
// nums.shuffle()
// nums.shuffled()

// nums.sorted().reversed()
// 배열을 새로 생성하지 않고, 메모리를 공유하면서 역순으로 열거하는 형식으로 리턴한다.

// // compare
let a = ["a", "b", "c"]
let b = ["A", "B", "C"]

print(a == b)

// array handling patterns
// remove specific elements
var puppy1 = ["p", "u", "p", "p", "y"]
if let lastIndexOfP = puppy1.lastIndex(of: "p") {
    puppy1.remove(at: lastIndexOfP)
}

// if the array is not empty...
if !nums.isEmpty {
    print("\(nums.count) elements")
} else {
    print("Empty")
}

// 2차원배열
var data = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print(data[0][1])

// Loop✨
for i in data {
    print(i)
}

// enumerated()✨
// 하나씩 나열하여 이름을 붙이고 tuple로 전달
// 시스템의 index를 element와 붙여서 활용한다

for tuple in nums.enumerated() {
    // print(tuple)
    // print("\(tuple.0) - \(tuple.1)")
    // print("\(tuple.offset) - \(tuple.element)")
}

for (index, word) in nums.enumerated() {
    // print("\(index) - \(word)")
}

for (index, word) in nums.reversed().enumerated() {
    print("\(index) - \(word)")
}

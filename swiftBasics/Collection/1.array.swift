// array Handling
var alphabet = ["a", "b", "c"]

// insert 메소드의 2가지 용법
// you cant do this by subscript
// alphabet.insert(newElement: String, at: Int) // at == index
// alphabet.insert(contentsOf: Collection, at: Int)

alphabet.insert("H", at: 3)
print(alphabet)
alphabet.insert(contentsOf: ["L,M", "K", "J"], at: 4)
print(alphabet)

// replace
// you can binding with subscript method
alphabet[0] = "A"
alphabet[0 ... 2] = ["x", "y", "z"] // range bind
alphabet[0 ... 1] = [] // range delete -> by this, index order is decrease
print(alphabet)

// replaceSubrange
alphabet.replaceSubrange(0 ... 2, with: ["a", "b", "c"])
print(alphabet)

// Append
alphabet += ["h"] // at endindex
print(alphabet)

alphabet.append("H")
alphabet.append(contentsOf: ["2", "1"])
print(alphabet)

// Remove
alphabet[0 ... 2] = []
alphabet.remove(at: 2) // it returns "ELEMENT" that removed
alphabet.removeSubrange(0 ... 2)
print(alphabet)

alphabet.append(contentsOf: ["3", "4", "5", "6"])

// be careful to not use on "EMPTY ARRAY"
alphabet.removeFirst() // it returns "STRING TYPE, REMOVED ELEMENT"
alphabet.removeFirst(2) // removes first two elements
alphabet.removeLast()
alphabet.removeLast(2) // removes last two elements

//
alphabet.removeAll() // removes elements and array
alphabet = ["1", "2"]
alphabet.removeAll(keepingCapacity: true) // whether you want to keep the memory space
// 메모리 공간까지 지워버리면... 성능차이가 날 수 있음*

// set
// you always clearify its type as Set
var set1: Set<Int> = [1, 2, 3, 2, 4]
print(set1.sorted())
var emptySet = Set<Int>()

// set has only unique values - hashable
// when you have to indexing very fast, you might use set
// 집합연산을 할 때 주로 사용하기도

// set doesnt have *subscript*
// only has UPDATE and REMOVE
set1.update(with: 1) // update has Optional return type
set1.update(with: 7) // when you successfully update, returns nil

// remove
var stringSet: Set<String> = ["apple", "Banana"]

stringSet.remove("apple")
stringSet.remove("ho?") // returns nil, no error

// set utilize
var a: Set<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var b: Set<Int> = [1, 3, 7, 5, 9]
var c: Set<Int> = [2, 4, 6, 8]

// b + c
var union = b.union(c) // 합집합
print(union.sorted()) // once you sort set, it becomes "Array type"

// a and b
var interSet = a.intersection(b) // 교집합
print(interSet.sorted())

// a - b
var subSet = a.subtracting(b)
print(subSet.sorted())

// a + b - a and b
var symmetricSet = a.symmetricDifference(b)

// Loop✨
let iteratingSet: Set = [1, 2, 3]
for num in iteratingSet { // not ordered
    print(num)
}

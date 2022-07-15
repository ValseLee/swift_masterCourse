/*
 문자열은 배열과 꽤 유사하기 때문에 문자열 다루기 전에 배열부터 잘 이해해야 한다.
 */
import Foundation

var str = "Swift"

// String ===> Array
var strArr = str.map { String($0) }
print(strArr) // ["S", "w", "i", "f", "t"]

var charArr = Array(str)
print(charArr) // ["S", "w", "i", "f", "t"]
var strArr2 = Array(arrayLiteral: str)
print(strArr2) // ["Swift"]

// Array ===> String
var str2 = strArr.joined()
print(str2) // Swift
var str3 = String(charArr)
print(str3) // Swift

// Randomize String
str.randomElement()
str.shuffled() // type == [character]
var newstr = String(str.shuffled())
print(newstr) // wiSft

// 문자열의 대소문자 변형
var lowStr = str.lowercased()
var uppStr = str.uppercased()
str.capitalized // 맨 앞글자만 대문자로
print(lowStr, uppStr) // swift SWIFT

// count, isEmpty
var emptyStr = " "
print(emptyStr.count) // 1
print(emptyStr.isEmpty) // false

var noStr = ""
print(noStr.count) // 0
print(noStr.isEmpty) // true

/* ✨String Index
 문자열도 Collection 프로토콜을 채택하지만 문자열의 인덱스는 정수가 아니다.
 스위프트는 문자열을 글자의 의미단위로 사용하기 때문에 서브스크립트를 정수로 사용할 수 없다.
 또한 문자열 서브스크립트는 get-only이다.
 메모리상의 일정하지 않은 간격으로 데이터가 존재하기 때문(유니코드)
 "HI👋🏻" 문자열은 각 문자를 하나의 비트에 저장하지 않는다!(비유)

 문자열 인덱스는 범위를 벗어나면 당연히 에러를 리턴한다
 endIndex는 끝나는 자리이기 때문에 1을 빼주거나 before: string.endIndex 꼴로 쓴다.

 [String.index]
 str.startIndex
 str.endIndex

 str.index(i: String.Index, offsetBy: String.IndexDistance)
 str.index(after: String.Index)
 str.index(before: String.Index)

 str.indices

 str.firstIndex(of: "Character")
 str.lastIndex(of: "Character")

 [String.index Range]
 str.range(of: String)
 str.range(of: String, options: )

 */

let greeting = "Guten Tag!"

print(greeting.startIndex) // Index(_rawBits: 1)
print(greeting[greeting.startIndex]) // G

var strIndex = greeting.index(greeting.startIndex, offsetBy: 2)
print(strIndex) // Index(_rawBits: 131329)
print(greeting[strIndex]) // t <=== (G u 't' e n ...)

var beforeEnd = greeting.index(before: greeting.endIndex)
var afterStart = greeting.index(after: greeting.startIndex)
print(greeting[beforeEnd], greeting[afterStart]) // ! u

var strG = greeting.firstIndex(of: "G")!
print(greeting[strG]) // G

for index in greeting.indices {
    print("\(greeting[index])", terminator: " ")
} // "G u t e n   T a g ! "

// 범위를 안전하게 지키며 문자열 문자 출력
strIndex = greeting.index(greeting.startIndex, offsetBy: 7)
if greeting.startIndex <= strIndex, strIndex < greeting.endIndex {
    print(greeting[strIndex]) // a
}

for i in greeting.indices {
    print(i)
} // stringIndex ...

// 범위 추출
let lower = greeting.index(greeting.startIndex, offsetBy: 2)
let upper = greeting.index(greeting.startIndex, offsetBy: 4)
print(greeting[lower ... upper]) // ten

// 이 방식을 더 많이 쓰게 될 것
var strRange = greeting.range(of: "Tag!")!
print(greeting[strRange]) // Tag!

// 대소문자 비교 안하는 옵션으로 범위 추출
strRange = greeting.range(of: "tag!", options: [.caseInsensitive])!
print(greeting[strRange]) // Tag!

// 정수처럼 거리 측정이 가능
var distance = greeting.distance(from: lower, to: upper)
print(distance) // 2

/*
 문자열 삽입과 교체, 삭제
 */

var welcome = "Hello"
print(welcome)
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))

if let range = welcome.range(of: " there") {
    welcome.replaceSubrange(range, with: " Swift")
}

print(welcome)

// 원본유지 교체
var newWelcome = welcome.replacingOccurrences(of: "Swift", with: "World")
print(welcome) // Hello Swift!
print(newWelcome) // Hello World!

newWelcome = welcome.replacingOccurrences(of: "swift", with: "new World", options: [.caseInsensitive], range: nil)
print(newWelcome) // Hello new World!

// append
welcome.append("!?")
print(welcome) // Hello Swift!!?

// remove
welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome) // Hello Swift!!
// 메모리를 유지할건지?
welcome.removeAll(keepingCapacity: true)

var string = "Hello world"
if let index = string.firstIndex(of: " ") {
    string.insert(contentsOf: " super", at: index)
}

print(string) // Hello super world

if let index = string.firstIndex(of: " ") {
    let range = index ... string.index(index, offsetBy: 5)
    string.removeSubrange(range)
}

print(string) // Hello world

if let range = string.range(of: " world") {
    string.removeSubrange(range)
}

print(string) // Hello

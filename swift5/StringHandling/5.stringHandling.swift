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

// 문자열 비교
print("swift" == "Swift") // false
print("swift" != "Swift") // true

// 대소비교는 유니코드순서를 비교한다.
print("swift" < "Swift") // false
print("swift" <= "Swift") // false
print("swift".lowercased() == "Swift".lowercased()) // true

/*
 대소문자를 무시하고 비교하는 메소드
 새로운 열거형 타입인 NSComparisonResult 리턴한다.
 .orderedSame : 동일한 순서
 .orderedAscending : 오름차순
 .orderedDescending : 내림차순

 단순 결과비교가 아니라 결과를 오름차, 내림차순으로 확인할 수 있다.
 이 오름차, 내림차를 나누는 기준은 '크기'이다.
 좌항이 더 크면 내림차, 우항이 더 크면 오름차
 두 항이 일치하면 순서가 동일하다고 나온다.
 */

var a = "swift"
var b = "Swift"
var result = a.caseInsensitiveCompare(b) // NSComparisonResult

switch result {
case .orderedSame:
    print("순서동일") // ✅
case .orderedDescending:
    print("내림차")
case .orderedAscending:
    print("오름차")
}

// 일치확인 메소드
var name = "Ko Ki"

var result2 = name.compare("Ko Ki Ko", options: [.caseInsensitive])
switch result2 {
case .orderedSame:
    print("순서동일")
case .orderedDescending:
    print("내림차") // ✅
case .orderedAscending:
    print("오름차")
}

/*
 문자열 비교 옵션의 종류
 [String.CompareOptions struct]

 .caseInsensitive // 대소문자 무시 ✨
 .diacriticInsensitive // 발음구별기호 무시
 .widthInsensitive // 글자 넓이 무시

 .forcedOrdering // 강제 오름차, 내림차
 .literal // 유니코드 자체 비교
 .numeric // 숫자 전체를 인식 비교

 .anchored // 접두어 고정한 후 비교
 .backwards // 문자 뒷자리부터

 .regularExpression // 정규표현식 검증 비교 ✨

 options 는 배열로 옵션을 전달하는데, ComapreOptions 구조체는 OptionSet 프로토콜을 채택한다.
 덕분에 위의 옵션을 여러 배열로 전달할 수 있다.
 */

// .diacriticInsensitive
"café".compare("cafe", options: [.diacriticInsensitive]) == .orderedSame

// .widthInsensitive : 일본어 문자에서 주로 사용됨
"ァ".compare("ｧ", options: [.widthInsensitive]) == .orderedSame

// .forcedOrdering
"Hello".compare("hello", options: [.forcedOrdering, .caseInsensitive]) == .orderedAscending

// .numeric : 숫자를 자릿수가 아니라 전체로 인식하여 비교
// 9보다 10이 크다. 10의 앞 자리 1 때문에 10이 뒤로 정렬되지 않도록.
"album_photo9.jpg".compare("album_photo10.jpg", options: [.numeric]) == .orderedAscending

// .literal : 유니코드 문자를 그대로 비교!!
"\u{D55C}".compare("\u{1112}\u{1161}\u{11AB}", options: [.literal]) == .orderedSame
// "한"(완성형)     "ㅎ+ㅏ+ㄴ"(조합형) // orderedSame == false✨

// .anchored : 접두어부터 비교
if let _ = "Hello, Swift".range(of: "Hello", options: [.anchored]) { // 범위리턴 ===> 접두어 기능
    print("접두어 일치")
}

// .anchored + .backwards == 접미어를 비교
if let _ = "Hello, Swift".range(of: "Swift", options: [.anchored, .backwards]) { // ===> 접미어 기능
    print("접미어 일치")
}

// 문자열 포함여부 확인
var string2 = "Hello, world"
string2.contains("Hello") // true
string2.lowercased().contains("hel") // true
string2.hasPrefix("Hello") // true
string2.hasSuffix("rld") // true
string2.prefix(2) // He
string2.suffix(2) // ld

// 공통 접두-접미어 리턴
string2.commonPrefix(with: "hello", options: [.caseInsensitive]) // Hello

// 앞에서 몇 글자를 지우고 리턴
print(string2.dropFirst(3)) // lo, world
print(string2.dropLast(8)) // Hell 😈

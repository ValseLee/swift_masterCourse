/*
 문자열은 배열과 꽤 유사하기 때문에 문자열 다루기 전에 배열부터 잘 이해해야 한다.
 */

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

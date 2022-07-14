/*
 substring?
 prefix() 등의 메소드로 문자열을 조작하여 리턴한 타입이 서브스트링일 수 있다.
 서브스트링은 이전 스트링의 일부에 의해 확정된 메모리를 공유하는 타입이다.
 "Hello, world" 라는 메모리 공간의 "Hello"만 빌려다가 그대로 쓰는 것.
 수정 등이 일어나기 전까지 메모리를 공유한다.
 */

var greeting = "Hello, world"

let index = greeting.firstIndex(of: ".") ?? greeting.endIndex
let index2 = greeting.firstIndex(of: ",") ?? greeting.endIndex
print(index) // Index(_rawBits: 786433)
print(type(of: index)) // String.Index

let beginning = greeting[..<index]
let beginning2 = greeting[..<index2]
print(beginning) // Hello, world
print(beginning2) // Hello
print(type(of: beginning)) // Substring

var word = greeting.prefix(5)
var endWord = greeting.suffix(5)
print(word) // Hello
print(endWord) // world

print(type(of: word)) // Substring

greeting = "Happy"
// 이미 beginning, word 에는 이전 greeting에서 떼온 문자열이 저장되어 있고, 이 문자열이 이제 새로운 메모리를 점유한다.
print(beginning, word) // Hello, world Hello
print(type(of: beginning), type(of: word)) // Substring Substring

let newStr = String(beginning)
print(newStr) // Hello, wolrd
print(type(of: newStr)) // String

class Person {
    var name = "성함"
}

struct Animal {
    var name = "이름"
}

// class
var p = Person(name: "Kane") // var keyword
let q = Person() // let keyword
q.name = "It changes"
print(q.name)
// because constant q has only memory address.
// you can change its property(name is defined by 'var')

var p2 = p // p2, p is point the same memory address
p.name = "John"
print(p.name) // John
print(p2.name) // John

// struct
// struct is more lighter than class because it doesnt use heap
var a = Animal(name: "Bola")
let b = Animal()
b.name = "It doesnt Change"
// print(b.name)
// because constant b has all value from struct
// and it occupying in stack frame

var a2 = a // a2, a is not the same. thus each instance can have different value
a.name = "Pigeon"
print(a.name) // Pigeon
print(a2.name) // 이름

/*
 string is struct, so you can String.count
 대문자() == 인스턴스 생
 */

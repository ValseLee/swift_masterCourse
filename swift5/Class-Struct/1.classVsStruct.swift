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

// class : Memory ARC로 관리해야함

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
 ✨✨아주 너무 중요✨✨
    strin is struct, so you can String.count
    대문자() == 인스턴스 생성

    struct는 멤버와이즈 이니셜라이저를 자동 제공하며 소멸자 없음. 또한 상속이 불가능!!
    class는 편의 생성자와 소멸자가 있다. 유일하게 상속이 가함

    ---

    값 형식(struct) vs 참조 형식(class)
    전자는 메모리의 값을 스택에 복사하여 전달
   값이 들어 있는 스택 스코프가 종료되면 메모리에서 자동으로 사라진다.
   스위프트의 기본 타입, 튜플, 열거형, 컬렉션은 구조체

    후자는 주소는 스택에 저장하고 이 메모리의 주소만을 전달하여 힙에 저장
  Reference Counting 을 통해 메모리를 관리, ARC 메모리 관리 필요
  클래스와 클로저가 참조 형식임
  */

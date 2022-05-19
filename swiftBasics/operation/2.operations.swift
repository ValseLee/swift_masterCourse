// 복합할당연산자(Compound Assignment Operators)
var value: Int = 0;
value = value + 10;
value += 10;

value = value - 10;
value -= 10;

value = value * 2;
value *= 2;

value = value / 2;
value /= 2;

value = value % 2;
value %= 2;

// value ++; 은 불가능

// 비교연산자(Comparison)
var a: Int = 456;
var b: Int = 123;

a == b; // false
a != b; // true
a > b // true
a >= b // true
a < b // false
a <= b // false

var c: (Bool) = (b == 123);
// b == 123 == true 
// c == true

// 10 <= n <= 100 : Dont do this
// (10 <= n) && (10 <= 100) : Do this

// Logical Operators
!true; // false
!false; // true
// and
true && true // true
true && false // false
false && true // false
false && false // false
// or
true || true // true
true || false // true
false || true // true
false || false // false

// 연산 우선순위
/*

* / %
+ -
비교연산
논리연산
삼항연산
할당연산(중요)
-> https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations
*/

// 접근연산자
Int.random(in: 1...3) // .random의 온점 = 하위 개념으로의 접근을 의미
var number: Int = Int.random(in: 1...5); // ... 은 1 부터 5 를 의미
var name: String = "Vetiver";
name.count; // 문자열의 개수는? 7
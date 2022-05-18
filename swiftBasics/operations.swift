/*
 a +(Operation) b(피연산자,Operand)

:> Operand의 개수에 따른 구별

1. 단항연산자(Unary)
    공백없이 꼭 붙여서 사용
    +a, -a, !a, a...

2. 이항 연산자(Binary)
    대체로 양쪽에 공백 1칸
    붙여도 상관은 없으나 비대칭적 사용 지양
    a + b, a >= b

3. Ternary
    바이너리와 동일
    a ? b : c
*/

// 기본 연산자
// 할당 연산자
let num2: Int = 10;
var num1: Int = 5;

// 산술 연산자
var a: Int = 4;
var b: Int = 5;

// 몫과 나머지는 Integer 타입으로 계산합시다.
print(a + b, a - b, a * b, a % b);
print(b / a); 
print(b % a); // modulo 연산

var streamingTime: Int = 70;
var hour: Int = streamingTime / 60 // 1
var minute: Int = streamingTime % 60 // 10
print("You watched Youtube for \(hour):\(minute) so far");

var num1 = 7;
var array: [String] = ["1", "2", "3"];
array[0]; // "1"
array[num % 3]; // "2"
// modulo 는 언제나 피연산자보다 작은 수가 리턴된다는 걸 유의!!!!

// 나누기는 항상 조심하기 -> 타입에 따라 값이 달라질 수 있다!!
a = 4;
b = 5;
var typeResult: Double;
typeResult = Double(a / b); // 0 : 두 개의 정수를 나누면 0이 나오고, 0은 실수 타입으로 그대로 출력
typeResult = Double(a) / Double(b); // 0.8 = 4.0 / 5.0 -> 실제 소수값 출력

// practice
let a1: Int = 6;
let b1: Int = 2;
var result: Int;

a1 + b1 // 8
a1 - b1 // 4
a1 * b1 // 12
a1 / b1 // 3
a1 % b1 // 0

// ---

/* Range Operator
 1...10 = 1부터 10
     1...
     ...10
     1..<10
     ..<10
 제한된 범위를 표기하는 연산자이며 이 자체가 타입이 되기도 함
 무조건 오름차순으로 표기해야하나, 결과를 내림차순으로 수정은 가능하다.
 Double 타입으로 쓸 수 있다. 1.1...10.5
 switch, for, 배열 서브스크립트 등등에서 주로 활용
*/

let numbers: ClosedRange<Int> = 1...10
// type을 잘 보자

let range1: PartialRangeFrom<Int> = 1...
let range2: PartialRangeThrough<Int> = ...10
let range3: Range<Int> = 1..<10
let range4: PartialRangeUpTo<Int> = ..<10

// switch 에서 활용

var num = 23
switch num {
    case 1...10:
    print("10이하")
    case 11...20:
    print("20이하")
    case 21...30:
    print("30이하")
    default:
    break;
}

let point = (1,2);

switch point {
case (0,0):
    print("원점");
case(-2...2, -2...2):
    print("원점의 주위에")
default:
    print("원점에서 멀리")
}

// pattern Matching Operator
// 범위에 속하는가?
var age: Int = 20
1...9 ~= age // false
10...19 ~= age // false
20...29 ~= age // true

let range5 = 1...10
print(range5 ~= 5) // true
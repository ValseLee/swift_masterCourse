// 여러 데이터를 연관지어 저장
// type strict 하게 명시하는 게 정석
typealias PersonalInfo = (String, Int, String)
var person1: PersonalInfo = ("홍길동", 20, "서울")

typealias NumberFormat = (Int, Int)
let twoNumbers: NumberFormat = (1, 2)

// 할당될 데이터가 정해져있는 타입 형태와 다르면 할당되지 않는다.
// so Type Strict

// index을 할 때 대괄호가 필요 없는 튜플
print(twoNumbers.0) // 1
print(person1.0) // 홍길동

// 튜플에는 이름도 붙일 수 있다.
// named Tuple
// named Tuple에 타입을 지정하려면 타입에도 키 밸류를 둘다 써주어야 해
typealias PersonalInfoDetails = (
    name: String,
    age: Int,
    address: String
)
var person2: PersonalInfoDetails = (
  name: "임꺽정",
  age: 22,
  address: "서울"
)

// 더 시맨틱하게 코드를 쓸 수 있다 이말이야
print(person2.name);

// Decomposition
// Decomposition 해서 변수를 할당할 때, 타입은 재할당되지 않는다.
// 이미 튜플에서 정해진 타입이 들어온다.
// 정 타입을 명시해주고 싶으면 피할당되는 튜플의 타입을 다시 명시해주자
let (first, second): NumberFormat = twoNumbers
// first, seconde, third에 각각 피연산자의 데이터를 할당할 수 있다. == Binding
// 튜플 데이터를 변수에 각각 할당이 가능!!

print(first)
print(second)


// 튜플의 비교(최대 7개 요소까지)
// 0번째 값을 비교하고 불대수 리턴, 0번째 값이 같으면 1번째 .. 
// 문자열은 알파벳 순으로 하는 것으로 보인다.
(1, "zebra") < (2, "apple") // true : 1이랑 2만 비교. 
(3, "apple") < (3, "bird") // true : a보다 b가 커
(true, false) < (3, "apple") // 에러 : 불 대수는 비교가 안 돼
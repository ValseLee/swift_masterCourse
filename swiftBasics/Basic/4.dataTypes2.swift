// Type Annotation 형태 선언

var number: Int; // 변수와 타입 선언 (= 1. 메모리 공간 생성)
number = 10; // 값 할당(초기화)(= 2. 데이터 저장)
print(number); // 값 호출

var value: Double = 5.345;
value = 12.45;


var value2: Double = value; // 할당하는 변수의 타입을 유지함

// Type Inference(타입추론)

var name = "홍길동"; // 할당되는 값에 따라 자동으로 타입을 정해주긴 한다.
var name2 = "홍"; // 한 글자만 써도 스트링으로 타입을 추론해줌

// Type Safety
// 타입이 명확하게 지정되기 때문에 코드 작성에 안정적.

let num5 = 1;
let num6: Double = num5 // 호환 불가(메모리 공간 크기가 다름!)
let d: Int = 3;
let num4: Double = 22.2;
d + num4; // 위와 같은 이유로 이 계산도 불가능 함
// 그런데 vscode에서는 따로 에러가 뜨지는 않는듯?

// Type Conversion
let str2: String = "123";
let number = Int(str2);
// 물론 문자열이 '숫자' 형태니까 가능한 변환된다.
// 문자열에 문자열이 할당되어 있으면 형변환 불가
// print(number) == "Optional(123)\n" 
type(of: number);

// 변형이 되지 않는 경우, 'nil'(=null) 콘솔 출력
// 데이터를 메모리에 어떻게, 어떤 형태로 저장할지 지정이 필요해서 타입을 지정한다.
// 데이터 변환이 되지 않거나 데이터 변환 중 데이터 유실이 일어날 수 있으니 주의해야 한다
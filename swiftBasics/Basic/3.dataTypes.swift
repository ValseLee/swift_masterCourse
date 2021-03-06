// 메모리 공간을 생성한 후 데이터 저장하는 하단의 방식
var a = 3;
var b: Int = 4;

// Datatypes? -> 데이터를 어느 정도의 크기, 어떤 형태로 저장하기 위해 약속하는 것
/*
모든 타입에 대문자 사용
정수, 실수(float, 최대 6자리까지), 실수(Double, 최대 15자리까지), Character(글자 한 개), String, Bool
*/

var i: Int = 3;
i = 3.4; // Int에는 소수점을 할당할 수 없다.
// 한 번 선언된 타입형은 수정할 수 없다.
// -> 디버깅 편리

/*
Int는 64비트 환경에서 8바이트 점유
*/

var k: String = "ㅎㅇ";
/*
float : 소수점 아래 6자리 정보, 4바이트 사용
Double : 전체 15자리 정보 저장, 8바이트 사용 <- 대체로 Double을 사용함
두 타입은 정밀도 차이가 있으며, 지수와 가수를 나누어서 복잡한 알고리즘으로 저장
*/

/*
Character 문자(단 한 글자) : " " <- 빈 문자열이 아니라 '공백 한 글자'인 것에 유의 
String 문자열 : "" <- 대체로 String 사용
쌍따옴표를 기본으로!
*/

/*
Boolean : 참과 거짓
*/
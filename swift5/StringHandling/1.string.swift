
// 이스케이프 캐릭터인 \ 를 통해 와일드카드나 응용 가능
let lineBreak = "These Are \nnot the same"
print(lineBreak)

// 쌍따옴표 3개로 그 내부에 줄갈이를 포함한 문자열 작성 가능
// 마지막 쌍따옴표는 들여쓰기의 기준이 된다.
let quote = """
	안녕, 클레오파트라
	세상에서 제일 가는
	포테이토칩
"""
print(quote)

/* 특수문자
 \0 : null
 \\ : backslash
 \t : tab
 \n : line break
 \r : 앞줄 이동
 \u{unicode}
 */

/* Raw String : 확장 구분자
 샵 내의 모든 문자열은 그대로 출력된다.
 샵 글자수는 마음대로 늘릴 수 있으나 양끝의 샵과 이스케이핑 시퀀스에서 쓰이는 샵의 숫자가 맞아야 한다
 */

var name = #"Steve"#
print(name) // 출력 == Steve

var line = #"hi \#(name)"#
print(line)

/*
 JSON 코드를 어떻게 가공해서 쓸까?
 어떻게 리퀘스트를 보낼까? 등등

 - 클라이언트
 1. URL : URL 주소를 먼저 만들어야 한다.
 2. URLSession : 객체 생성
 3. dataTask : url 입력
 4. resume : 시작

 - 서버
 JSON을 메세지 바디에 넣어서 전달

 - 다시 클라이언트
 class와 구조체로 새로 가공

 우선 여기서 해보자
 https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do

 http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json
 key=발급키&targetDt=20120101&multiMovieYn=N

 - 발급키 : 사용자 신원을 잘 확인하고 액세스 권한을 확인하기 위해 사용하는 키
 */
import Foundation

let movieURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json
 key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101&multiMovieYn=N"

// 1. url 구조체 생성!
// 그런데 url이 잘못되어 에러가 날 수도 있으니 옵셔널하거나, 강제로 언래핑한다.
let structURL = URL(string: movieURL)!

// 2. 서버 통신을 가능하게 해주는 URLSession 으로 세션 객체를 생성해주자.
let session = URLSession(configuration: .default)
// 세션은 싱글톤 객체로 만들 수 있다!!
// let session = URLSession.shared

// 3. 구조체로 만들어진 데이터를 이제 만져보자.
session.dataTask(with: structURL) { data, _, error in
    if error != nil {
        print(error.localizedDescription)
        return
    }

    // data의 옵셔널 언래핑
    if let safeData = data {
        // 그 데이터를 문자열 전환
        let str = String(decoding: safeData, as: UTF8.self)
        print(str)
    }
}

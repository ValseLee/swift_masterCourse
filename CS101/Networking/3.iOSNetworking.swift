/*
 JSON 코드를 어떻게 가공해서 쓸까?
 어떻게 리퀘스트를 보낼까? 등등

 - 클라이언트
 1. URL : URL 주소를 구조체로 만들어야 한다.
 2. URLSession : 세션을 생성
 	- 브라우저를 열어서 네트워크 준비를 한다.
 3. dataTask : 입력된 url로 통신
 	- 세션을 보내고, 데이터를 받아준다.
 	- 클로저 내에서 데이터를 정리하고 처리하는 로직에 개발자가 개입한다.
 4. resume : 실제로 네트워킹 시작

 - 세션?
 서버와 연결 상태를 유지하고 있는 것

 - 서버
 JSON을 메세지 바디에 넣어서 전달

 - 다시 클라이언트
 class와 구조체로 새로 가공

 우선 여기서 해보자
 https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do

 http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?
 key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101

 - 발급키 : 사용자 신원을 잘 확인하고 액세스 권한을 확인하기 위해 사용하는 키
 */
import Foundation

let movieURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json
 &targetDt=20120101&multiMovieYn=N&key="

let movieAPIKey = "f5eef3421c602c6cb7ea224104795888"

// 1. url 구조체 생성!
// 그런데 url이 잘못되어 에러가 날 수도 있으니 옵셔널하거나, 강제로 언래핑한다.
let structURL = URL(string: movieURL + movieAPIKey)!

// 2. 서버 통신을 가능하게 해주는 URLSession 으로 세션 객체를 생성해주자.
let session = URLSession(configuration: .default)
// 세션은 싱글톤 객체로 만들 수 있다!!
// let session = URLSession.shared

// 3. 구조체로 만들어진 데이터를 이제 만져보자.
let task = session.dataTask(with: structURL) { data, response, error in
    if error != nil {
        print(error.localizedDescription)
        return
    }

    // 응답이 HTTPURLResponse로 다운캐스팅이 되고, 그 상태 코드가 200에서 299 사이에 포함된다면 가드문 통과
    guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
        print("Error : request Failed")
        return
    }

    // 만약 data가 수신된다면 data를 옵셔널 언래핑
    if let safeData = data {
        // 그 데이터를 문자열 전환
        let str = String(decoding: safeData, as: UTF8.self)
        print(str)
    }

    // 아래에서 JSON 파싱 함수를 정의했다면?
    // parseJSON1 함수가 옵셔널을 반환하기 때문에 아래에서 언래핑한다.
    var movieArr = parseJSON1(safeData)
    // print를 하지 않고 dump로 출력하면 가독성이 좋아진다. "아주 많이".
    dump(movieArr!)
}

// 4. 데이터를 다 만졌다면, 시작
// 네트워킹은 비동기적으로 동작한다.
task.resume()

/*****
 내가 원하는 대로 네트워크 응답 데이터를 구조체나 클래스로 가공하기
 ✨JSON Parsing
 app.quicktype.io 를 써서 서버에서 보내는 데이터의 형태를 확인할 수 있다.
 서버가 주는 데이터를 swift로 바로 변환해준다.
 JSON 자체가 계층을 갖고 있기 때문에 해당 계층의 구조를 코드로 확인한 다음 어떻게 가공할지 정하자.

 Decodable = json 을 코드로
 Encodable = 코드를 json으로
 Codable = 양방향 모두 가능
 *****/

// let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - Welcome

struct Welcome: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult

struct BoxOfficeResult: Codable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList

struct DailyBoxOfficeList: Codable {
    let rnum, rank, rankInten: String
    let rankOldAndNew: RankOldAndNew
    let movieCD, movieNm, openDt, salesAmt: String
    let salesShare, salesInten, salesChange, salesAcc: String
    let audiCnt, audiInten, audiChange, audiAcc: String
    let scrnCnt, showCnt: String

    enum CodingKeys: String, CodingKey {
        case rnum, rank, rankInten, rankOldAndNew
        case movieCD = "movieCd"
        case movieNm, openDt, salesAmt, salesShare, salesInten, salesChange, salesAcc, audiCnt, audiInten, audiChange, audiAcc, scrnCnt, showCnt
    }
}

enum RankOldAndNew: String, Codable {
    case old = "OLD"
}

// 내가 원하는 구조체로 커스텀
struct movie {
    let name: String
    let openDate: String
}

// 서버에서 받아온 JSON 을 분석하는 코드(오래된 방식)
func parseJSONOld(_ movieData: Data) -> [DailyBoxOfficeList]? {
    do {
        var movieLists = [DailyBoxOfficeList]()

        // 딕셔너리 형태로 바꿀 수 있다면 옵셔널 바인딩
        if let json = try JSONSerializaition.jsonObject(with: movieData) as? [String: Any] {
            if let boxOfficeResult = json["boxOfficeResult"] as? [String: Any] {
                // code 이렇게 중첩해서 했다.
            }
        }
    }
}

// Swift 5.0 이후 매우 쉬워진 JSON 파싱
func parseJSON1(_ movieData: Data) -> [DailyBoxOfficeList]? {
    do {
        let decoder = JSONDecoder()
        let decodeData = try decoder.decode(MovieData.self, from: movieData)

        return decodeDataod.boxOfficeResult.dailyBoxOfficeList
    } catch {
        return nil
    }
}

// parseJSON1() 이 만들어졌으니, 이제 dataTask에서 실행해주자.

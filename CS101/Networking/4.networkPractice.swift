import UIKit

struct APIMusicData: Codable {
    let resultCount: Int
    let results: [APIResult]
}

struct APIResult: Codable {
    let artist: String?
    let albumTitle: String?
    let trackTitle: String?
    let previewUrl: String?
    let imageUrl: String?
    let releaseDate: String?

    // 서버의 응답 데이터를 내가 원하는 데이터로 구조체화하기 위해 채택
    // Codingkey를 채택할 경우, 구조체의 모든 저장 속성을 써주어야 함
    enum codingKeys: String, CodingKey {
        case artist = "artistName"
        case albumTitle = "collectionName"
        case trackTitle = "trackName"
        case previewUrl
        case imageUrl = "artworkUrl100"
        case releaseDate
    }
}

func getMethod() {
    guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=jazz") else { return }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    URLSession.shared.dataTask(with: request) { data, response, error in
        guard error == nil else { return }
        guard let safeData = data else { return }
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else { return }

        // data 가공
        do {
            let decoder = JSONDecoder()
            let musicArr = try decoder.decode(APIMusicData.self, from: safeData)
            print(musicArr)
        } catch {
            dump(error)
            print("??")
        }
    }.resume()
}

getMethod()

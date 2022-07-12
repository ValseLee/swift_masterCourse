
// 기존의 네트워크 처리 함수
enum NetworkError: Error {
    case someError
}

// 데이터 전달은 리턴으로 쓰는 게 아니라 콜백 클로저로 처리해야하는 걸 잊지 말자.
func performRequest(with url: String, completionHandler: @escaping (Data?, NetworkError?) -> Void) {
    guard let url = URL(string: url) else { return }

    URLSession.shared.dataTask(with: url) { data, _, error in
        // 에러가 있으면 멈추기
        if error != nil {
            print(error!)
            completionHandler(nil, .someError)
            return
        }

        guard let safeData = data else {
            completionHandler(nil, .someError)
            return
        }

        completionHandler(safeData, nil)
    }.resume()
}

performRequest(with: "url주소") { data, error in
    if error != nil {
        print(error!)
    }

    // 데이터 처리
    print(data)
}

// 리턴타입의 사용
func performRequest2(with url: String, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
    guard let url = URL(string: url) else { return }

    URLSession.shared.dataTask(with: url) { data, _, error in
        // 에러가 있으면 멈추기
        if error != nil {
            print(error!)
            completionHandler(Result.failure(NetworkError.someError))
            return
        }

        // 어차피 함수 파라미터의 타입에 명시가 되어있어서 이렇게 쓸 수도 있다.
        guard let safeData = data else {
            completionHandler(.failure(.someError))
            return
        }

        completionHandler(.success(safeData))
    }.resume()
}

performRequest2(with: "주소") { result in
    switch result {
    case let .failure(error):
        print(error)
    case let .success(data):
        print(data)
    }
}

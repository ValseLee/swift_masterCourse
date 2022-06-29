/*
 실제 앱에서 swift 파일을 따로 만들고, 실수하기 쉬운 문자열 모음을 미리 만들어두고
 사용가능
 */

enum K {
    static let appName = "MyApp"
    static let cellIdentifier = "Reusable"

    enum RootColors {
        static let black = "black"
        static let white = "white"
        static let blue = "cobalt"
    }

    enum FStore {
        static let collectionName = "messages"
    }
}

// 채팅앱의 구조를 이렇게 해본다면?
import Foundation
import UIKit

class Message {
    private enum Status {
        case sent, received, read
        case error
    }

    let sender: String, recipient: String, content: String?
    let timeStamp: Date

    private var status = Message.Status.sent

    init(sender: String, recipient: String, content: String?) {
        self.sender = sender
        self.recipient = recipient
        if let content = content {
            self.content = content
        } else {
            self.content = "내용없음"
        }
        // 현재 시간
        timeStamp = Date()
    }

    func getInfo() -> String {
        if let content = content {
            return "수신인:\(recipient), 발신인:\(sender), 내용:\(content),시간:\(timeStamp.description)"
        } else {
            return "수신인:\(recipient), 발신인:\(sender), 내용: \"\" ,시간:\(timeStamp.description)"
        }
    }

    func statusColor() -> UIColor {
        switch status {
        case .sent:
            return UIColor(red: 0.5, green: 0, blue: 0, alpha: 1)
        case .received:
            return UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        case .read:
            return UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        case .error:
            return UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        }
    }
}

let message = Message(sender: "hong", recipient: "kim", content: "Hi")
print(message.getInfo()) // 수신인:kim, 발신인:hong, 내용:Hi,시간:2022-06-29 06:26:13 +0000
let message2 = Message(sender: "hong", recipient: "kim", content: nil)
print(message2.getInfo()) // 수신인:kim, 발신인:hong, 내용:내용없음,시간:2022-06-29 06:26:13 +0000

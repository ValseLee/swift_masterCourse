/*
 1. 델리게이트 패턴을 한번 구현해보자.
 - 유저가 작용하는 객체와 그것을 통해 작동시킬 내부 논리 구조를 연결하는 것.
 */

import Foundation
import UIKit

protocol RemoteControlDelegate {
    func channelUp()
    func channelDown()
}

// 유저가 상호작용하는 리모콘
class RemoteController {
    var delegate: RemoteControlDelegate?

    func doSth() {
        print("리모콘 조작")
    }

    func channelUp() {
        delegate?.channelUp()
    }

    func channelDown() {
        delegate?.channelDown()
    }
}

// 그 리모콘으로 작동시킬 객체는 TV == 뷰컨
class TV: RemoteControlDelegate {
    func channelUp() {
        print("TV 채널 올리기")
    }

    func channelDown() {
        print("TV 채널 내리기")
    }
}

let usersRemote = RemoteController()
let samsungTV = TV()

// 사용자의 리모콘 대리자를 삼성TV로 설정
usersRemote.delegate = samsungTV
usersRemote.channelDown()
usersRemote.channelUp()

class SmartPhone: RemoteControlDelegate {
    init(usersRemote: RemoteController) {
        usersRemote.delegate = self // usersRemote.delegate = type(of: SmartPhone)
    }

    func channelUp() {
        print("스마트폰 채널 올리기")
    }

    func channelDown() {
        print("스마트폰 채널 내리기")
    }
}

// 사용자의 리모콘 대리자를 스마트폰으로 변경
let smartPhone = SmartPhone(usersRemote: usersRemote)
usersRemote.channelUp()
usersRemote.channelDown()

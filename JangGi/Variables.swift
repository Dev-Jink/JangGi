//
//  Variables.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/17.
//

import Foundation
import SpriteKit

struct Variables {
    static var scene = SKScene()
    //가로
    static let row = 9
    //세로
    static let col = 10
    //장기알 간격
    static let interval = Int(scene.view!.frame.width) / col
    //x 시작점
    static let startX = interval
    //y 시작점
    static let startY = -Int(scene.view!.frame.height / 2) + (interval * col / 2)
    //전체 장기알 배열
    static var allUnits = Array<Unit>()
    //가이드 배열
    static var guideUnits = Array<Unit>()
    //턴체인지 체크
    static var isGreenTurn = true;
    
    //현재 포지션의 값 가져오기
    static func getNum(place : [Unit] , point : CGPoint)->Int{
        var num = 0;
        for item in place {
            if item.point == point {
                num = item.num
                break
            }
        }
        return num
    }
    
    //현재 포지션의 이름 가져오기
    static func getName(place : [Unit] , point : CGPoint)->String{
        var name = "";
        for item in place {
            if item.point == point {
                name = item.name
                break
            }
        }
        return name
    }
}


struct Unit{
    var point = CGPoint()
    var name = String()
    var num = Int()
    var imageName = String()
}

//
//  Ma.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/19.
//

import Foundation
import SpriteKit

class Ma{
    
    let guide = GuideBlock()
    var _place = Array<Unit>()
    var currentNum = Int()
    var currentName = String()
    
    init(place : [Unit], unit :Unit) {
        //장기판 정보
        _place = place
        //현재 번호 가져오기
        currentNum = unit.num
        //현재 장기알 이름
        currentName = unit.name
        
        //현재 장기알의 x,y값
        let xValue = Int(unit.point.x)
        let yValue = Int(unit.point.y)
        
        //현재 위치에서 한칸 옆의 값을 가져오기
        let leftValue = Variables.getNum(place: place, point: CGPoint(x: xValue - 1, y: yValue))
        let rightValue = Variables.getNum(place: place, point: CGPoint(x: xValue + 1, y: yValue))
        let topValue = Variables.getNum(place: place, point: CGPoint(x: xValue, y: yValue - 1))
        let bottomValue = Variables.getNum(place: place, point: CGPoint(x: xValue, y: yValue + 1))
        
        //이동 가능한 포지션
        var points = Array<CGPoint>()
        
        //좌측 위
        points.append(CGPoint(x: xValue - 2, y: yValue - 1))
        //좌측 아래
        points.append(CGPoint(x: xValue - 2, y: yValue + 1))
        //우측 위
        points.append(CGPoint(x: xValue + 2, y: yValue - 1))
        //우측 아래
        points.append(CGPoint(x: xValue + 2, y: yValue + 1))
        //위 그리고 우측
        points.append(CGPoint(x: xValue + 1, y: yValue - 2))
        //위 그리고 좌측
        points.append(CGPoint(x: xValue - 1, y: yValue - 2))
        //아래 그리고 우측
        points.append(CGPoint(x: xValue + 1, y: yValue + 2))
        //아래 그리고 좌측
        points.append(CGPoint(x: xValue - 1, y: yValue + 2))
        
        for (i,item) in points.enumerated() {
            switch i {
            //좌측 위
            case 0:
                if xValue - 2 >= 0 && yValue - 1 >= 0 && leftValue == 0 {
                    showGuideUnit(point: item)
                }
                break
            //좌측 아래
            case 1:
                if xValue - 2 >= 0 && yValue + 1 <= 9 && leftValue == 0 {
                    showGuideUnit(point: item)
                }
                break
            //우측 위
            case 2:
                if xValue + 2 <= 8 && yValue - 1 >= 0 && rightValue == 0 {
                    showGuideUnit(point: item)
                }
                break
            //우측 아래
            case 3:
                if xValue + 2 <= 8 && yValue + 1 <= 9 && rightValue == 0 {
                    showGuideUnit(point: item)
                }
                break
            //위 그리고 우측
            case 4:
                if xValue + 1 <= 8 && yValue - 2 >= 0 && topValue == 0 {
                    showGuideUnit(point: item)
                }
                break
            //위 그리고 좌측
            case 5:
                if xValue - 1 >= 0 && yValue - 2 >= 0 && topValue == 0 {
                    showGuideUnit(point: item)
                }
                break
            //아래 그리고 우측
            case 6:
                if xValue + 1 <= 8 && yValue + 2 <= 9 && bottomValue == 0 {
                    showGuideUnit(point: item)
                }
                break
            //아래 그리고 좌측
            case 7:
                if xValue - 1 >= 0 && yValue + 2 <= 9 && bottomValue == 0 {
                    showGuideUnit(point: item)
                }
                break
            default:
                print("default")
            }
        }
    }
    
    func showGuideUnit(point : CGPoint){
        let n = Variables.getNum(place: _place, point: point)
        //이동 가능한 경우
        if n == 0 {
            guide.guideBlock(position: point, movable: true)
            Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
        }else if n != 0 && n != currentNum {
        //상대편의 장기알을 먹을 수 있음
            guide.guideBlock(position: point, movable: false)
            Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
        }
    }
}

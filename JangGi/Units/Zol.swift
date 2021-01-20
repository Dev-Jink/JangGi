//
//  Zol.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/19.
//

import Foundation
import SpriteKit

class Zol {
    let guide = GuideBlock()
    var _place = Array<Unit>()
    var currentNum = Int()
    var currentName = String()
    
    init(place : [Unit], unit : Unit){
        //장기판 정보
        _place = place
        //현재 번호 가져오기
        currentNum = unit.num
        //현재 장기알 이름
        currentName = unit.name
        
        //현재 장기알의 x,y값
        let xValue = Int(unit.point.x)
        let yValue = Int(unit.point.y)
        
        //이동가능한 위치
        var zolPoints = Array<CGPoint>()
        zolPoints.append(CGPoint(x: xValue - 1, y: yValue))
        zolPoints.append(CGPoint(x: xValue + 1, y: yValue))
        zolPoints.append(CGPoint(x: xValue, y: yValue - 1))
        zolPoints.append(CGPoint(x: xValue - 1, y: yValue - 1))
        zolPoints.append(CGPoint(x: xValue + 1, y: yValue - 1))
        
        var byungPoints = Array<CGPoint>()
        byungPoints.append(CGPoint(x: xValue - 1, y: yValue))
        byungPoints.append(CGPoint(x: xValue + 1, y: yValue))
        byungPoints.append(CGPoint(x: xValue, y: yValue + 1))
        byungPoints.append(CGPoint(x: xValue - 1, y: yValue + 1))
        byungPoints.append(CGPoint(x: xValue + 1, y: yValue + 1))
        
        if currentName.contains("zol"){
            for (i,item) in zolPoints.enumerated() {
                switch i {
                case 0:
                    if xValue - 1 >= 0 {
                        showGuideUnit(point: item)
                    }
                    break;
                case 1:
                    if xValue + 1 <= 8 {
                        showGuideUnit(point: item)
                    }
                    break;
                case 2:
                    if yValue - 1 >= 0 {
                        showGuideUnit(point: item)
                    }
                    break;
                case 3:
                    if xValue == 5 && yValue == 2 || xValue == 4 && yValue == 1 {
                        showGuideUnit(point: item)
                    }
                    break;
                case 4:
                    if xValue == 3 && yValue == 2 || xValue == 4 && yValue == 1 {
                        showGuideUnit(point: item)
                    }
                    break;
                default:
                    print("default")
                }
            }
        }
        
        if currentName.contains("byung"){
            for (i,item) in byungPoints.enumerated() {
                switch i {
                case 0:
                    if xValue - 1 >= 0 {
                        showGuideUnit(point: item)
                    }
                    break;
                case 1:
                    if xValue + 1 <= 8 {
                        showGuideUnit(point: item)
                    }
                    break;
                case 2:
                    if yValue + 1 <= 9 {
                        showGuideUnit(point: item)
                    }
                    break;
                case 3:
                    if xValue == 5 && yValue == 7 || xValue == 4 && yValue == 8 {
                        showGuideUnit(point: item)
                    }
                    break;
                case 4:
                    if xValue == 3 && yValue == 7 || xValue == 4 && yValue == 8 {
                        showGuideUnit(point: item)
                    }
                    break;
                default:
                    print("default")
                }
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

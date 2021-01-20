//
//  KingSa.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/19.
//

import Foundation
import SpriteKit

class KingSa{
    
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
        
        //이동 가능한 위치
        var points = Array<CGPoint>()
        //좌측
        points.append(CGPoint(x: xValue - 1, y: yValue))
        //좌측 대각선 상단
        points.append(CGPoint(x: xValue - 1, y: yValue - 1))
        //위
        points.append(CGPoint(x: xValue, y: yValue - 1))
        //위 그리고 대각선 우측
        points.append(CGPoint(x: xValue + 1, y: yValue - 1))
        //우측
        points.append(CGPoint(x: xValue + 1, y: yValue))
        //우측 그리고 대각선 아래
        points.append(CGPoint(x: xValue + 1, y: yValue + 1))
        //아래
        points.append(CGPoint(x: xValue, y: yValue + 1))
        //아래 그리고 대각선 아래
        points.append(CGPoint(x: xValue - 1, y: yValue + 1))
        
        for (i,item) in points.enumerated() {
            switch i {
            case 0:
                if xValue > 3  {
                    showGuideUnit(point: item)
                }
                break
            case 1:
                if xValue == 4 && yValue == 8 || xValue == 5 && yValue == 9 || xValue == 4 && yValue == 1 || xValue == 5 && yValue == 2{
                    showGuideUnit(point: item)
                }
                break
            case 2:
                if currentName.contains("_r"){
                    if yValue > 0 {
                        showGuideUnit(point: item)
                    }
                }else {
                    if yValue > 7 {
                        showGuideUnit(point: item)
                    }
                }
                
                break
            case 3:
                if xValue == 4 && yValue == 8 || xValue == 3 && yValue == 9 || xValue == 4 && yValue == 1 || xValue == 3 && yValue == 2{
                    showGuideUnit(point: item)
                }
                break
            case 4:
                if xValue < 5 {
                    showGuideUnit(point: item)
                }
                break
            case 5:
                if xValue == 4 && yValue == 8 || xValue == 3 && yValue == 7 || xValue == 4 && yValue == 1 || xValue == 3 && yValue == 0{
                    showGuideUnit(point: item)
                }
                break
            case 6:
                if currentName.contains("_r"){
                    if yValue < 2 {
                        showGuideUnit(point: item)
                    }
                    
                }else {
                    if yValue < 9 {
                        showGuideUnit(point: item)
                    }   
                }
                break
            case 7:
                if xValue == 4 && yValue == 8 || xValue == 5 && yValue == 7 || xValue == 4 && yValue == 1 || xValue == 5 && yValue == 0{
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

//
//  Po.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/20.
//

import Foundation
import SpriteKit

class Po{
    init(place : [Unit], unit : Unit){
        let guide = GuideBlock()
        //현재 번호 가져오기
        let currentNum = unit.num
        //현재 장기알 이름
        let currentName = unit.name
        //현재 장기알 x,y 값
        let xValue = Int(unit.point.x)
        let yValue = Int(unit.point.y)
        
        //좌측 체크
        for i in (0..<xValue).reversed(){
            let point = CGPoint(x: i, y: yValue)
            let num = Variables.getNum(place: place, point: point)
            let name = Variables.getName(place: place, point: point)
            
            if num == 0 {
                //건너 뛸 수 없음
                continue
            }else{
                if !name.contains("po"){
                    //건너 뛸 수 있음
                    for j in (0..<i).reversed() {
                        let point = CGPoint(x: j, y: yValue)
                        let num = Variables.getNum(place: place, point: point)
                        let name = Variables.getName(place: place, point: point)
                        //이동가능
                        if num == 0 {
                            guide.guideBlock(position: point, movable: true)
                            Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                        }else if num != 0 && num != currentNum {
                            if !name.contains("po"){
                                guide.guideBlock(position: point, movable: true)
                                Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                            }
                            break
                        }else if num != 0 && num == currentNum {
                            break
                        }
                    }
                }
                break
            }
        }
        
        //우측 체크
        for i in (xValue + 1)..<9 {
            let point = CGPoint(x: i, y: yValue)
            let num = Variables.getNum(place: place, point: point)
            let name = Variables.getName(place: place, point: point)
            
            if num == 0 {
                //건너 뛸 수 없음
                continue
            }else{
                if !name.contains("po"){
                    //건너 뛸 수 있음
                    for j in (i + 1)..<9 {
                        let point = CGPoint(x: j, y: yValue)
                        let num = Variables.getNum(place: place, point: point)
                        let name = Variables.getName(place: place, point: point)
                        //이동가능
                        if num == 0 {
                            guide.guideBlock(position: point, movable: true)
                            Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                        }else if num != 0 && num != currentNum {
                            if !name.contains("po"){
                                guide.guideBlock(position: point, movable: true)
                                Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                            }
                            break
                        }else if num != 0 && num == currentNum {
                            break
                        }
                    }
                }
                break
            }
        }
        
        //위쪽 체크
        for i in (0..<yValue).reversed(){
            let point = CGPoint(x: xValue, y: i)
            let num = Variables.getNum(place: place, point: point)
            let name = Variables.getName(place: place, point: point)
            
            if num == 0 {
                //건너 뛸 수 없음
                continue
            }else{
                if !name.contains("po"){
                    //건너 뛸 수 있음
                    for j in (0..<i).reversed() {
                        let point = CGPoint(x: xValue, y: j)
                        let num = Variables.getNum(place: place, point: point)
                        let name = Variables.getName(place: place, point: point)
                        //이동가능
                        if num == 0 {
                            guide.guideBlock(position: point, movable: true)
                            Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                        }else if num != 0 && num != currentNum {
                            if !name.contains("po"){
                                guide.guideBlock(position: point, movable: true)
                                Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                            }
                            break
                        }else if num != 0 && num == currentNum {
                            break
                        }
                    }
                }
                break
            }
        }
        
        //아래쪽 체크
        for i in (yValue + 1)..<10 {
            let point = CGPoint(x: xValue, y: i)
            let num = Variables.getNum(place: place, point: point)
            let name = Variables.getName(place: place, point: point)
            
            if num == 0 {
                //건너 뛸 수 없음
                continue
            }else{
                if !name.contains("po"){
                    //건너 뛸 수 있음
                    for j in (i + 1)..<10 {
                        let point = CGPoint(x: xValue, y: j)
                        let num = Variables.getNum(place: place, point: point)
                        let name = Variables.getName(place: place, point: point)
                        //이동가능
                        if num == 0 {
                            guide.guideBlock(position: point, movable: true)
                            Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                        }else if num != 0 && num != currentNum {
                            if !name.contains("po"){
                                guide.guideBlock(position: point, movable: true)
                                Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                            }
                            break
                        }else if num != 0 && num == currentNum {
                            break
                        }
                    }
                }
                break
            }
        }
        
        //좌측 아래에서 대각선 우측 위
        if xValue == 3 && yValue == 9 || xValue == 3 && yValue == 2 {
            let point = CGPoint(x: xValue + 1, y: yValue - 1)
            let num = Variables.getNum(place: place, point: point)
            let name = Variables.getName(place: place, point: point)
            
            if num != 0 && !name.contains("po"){
                //이동 가능
                let point = CGPoint(x: xValue + 2, y: yValue - 2)
                let num = Variables.getNum(place: place, point: point)
                let name = Variables.getName(place: place, point: point)
                
                if num == 0 {
                    if num == 0 {
                        guide.guideBlock(position: point, movable: true)
                        Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    }else if num != 0 && num != currentNum {
                        if !name.contains("po"){
                            guide.guideBlock(position: point, movable: true)
                            Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                        }
                    }
                }
            }
        }
        
        //우측 아래에서 대각선 좌측 위
        if xValue == 5 && yValue == 9 || xValue == 5 && yValue == 2 {
            let point = CGPoint(x: xValue - 1, y: yValue - 1)
            let num = Variables.getNum(place: place, point: point)
            let name = Variables.getName(place: place, point: point)
            
            if num != 0 && !name.contains("po"){
                //이동 가능
                let point = CGPoint(x: xValue - 2, y: yValue - 2)
                let num = Variables.getNum(place: place, point: point)
                let name = Variables.getName(place: place, point: point)
                
                if num == 0 {
                    if num == 0 {
                        guide.guideBlock(position: point, movable: true)
                        Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    }else if num != 0 && num != currentNum {
                        if !name.contains("po"){
                            guide.guideBlock(position: point, movable: true)
                            Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                        }
                    }
                }
            }
        }
        
        //좌측 위에서 대각선 우측 아래
        if xValue == 3 && yValue == 7 || xValue == 3 && yValue == 0 {
            let point = CGPoint(x: xValue + 1, y: yValue + 1)
            let num = Variables.getNum(place: place, point: point)
            let name = Variables.getName(place: place, point: point)
            
            if num != 0 && !name.contains("po"){
                //이동 가능
                let point = CGPoint(x: xValue + 2, y: yValue + 2)
                let num = Variables.getNum(place: place, point: point)
                let name = Variables.getName(place: place, point: point)
                
                if num == 0 {
                    if num == 0 {
                        guide.guideBlock(position: point, movable: true)
                        Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    }else if num != 0 && num != currentNum {
                        if !name.contains("po"){
                            guide.guideBlock(position: point, movable: true)
                            Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                        }
                    }
                }
            }
        }
        
        //우측 위에서 대각선 좌측 아래
        if xValue == 5 && yValue == 7 || xValue == 5 && yValue == 0 {
            let point = CGPoint(x: xValue - 1, y: yValue + 1)
            let num = Variables.getNum(place: place, point: point)
            let name = Variables.getName(place: place, point: point)
            
            if num != 0 && !name.contains("po"){
                //이동 가능
                let point = CGPoint(x: xValue - 2, y: yValue + 2)
                let num = Variables.getNum(place: place, point: point)
                let name = Variables.getName(place: place, point: point)
                
                if num == 0 {
                    if num == 0 {
                        guide.guideBlock(position: point, movable: true)
                        Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    }else if num != 0 && num != currentNum {
                        if !name.contains("po"){
                            guide.guideBlock(position: point, movable: true)
                            Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                        }
                    }
                }
            }
        }
        
        
    }
}

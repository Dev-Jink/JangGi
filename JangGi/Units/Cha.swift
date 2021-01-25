//
//  Cha.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/19.
//

import Foundation
import SpriteKit

class Cha {
    init(place : [Unit], unit : Unit) {
        let guide = GuideBlock()
        //현재 번호 가져오기
        let currentNum = unit.num
        //현재 장기알 이름
        let currentName = unit.name
        //현재 장기알 x,y 값
        let xValue = Int(unit.point.x)
        let yValue = Int(unit.point.y)
        
        //좌측 아래에서 대각선 우측 위
        let point1 = CGPoint(x: 3, y: 9)
        let point2 = CGPoint(x: 3, y: 2)
        //우측 아래에서 대각선 좌측 위
        let point3 = CGPoint(x: 5, y: 9)
        let point4 = CGPoint(x: 5, y: 2)
        //좌측 위에서 대각선 우측 아래
        let point5 = CGPoint(x: 3, y: 7)
        let point6 = CGPoint(x: 3, y: 0)
        //우측 위에서 대각선 좌측 아래
        let point7 = CGPoint(x: 5, y: 7)
        let point8 = CGPoint(x: 5, y: 0)
        
        //센터
        let point9 = CGPoint(x: 4, y: 1)
        let point10 = CGPoint(x: 4, y: 8)
        
        //왼쪽 방향 체크
        for i in (0..<xValue).reversed(){
            
            let point = CGPoint(x: i, y: yValue)
            let num = Variables.getNum(place: place, point: point)
            //이동 가능
            if num == 0 {
                guide.guideBlock(position: point, movable: true, unit: unit, number: 10)
                Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
            //상대편 장기알 먹을수 있음
            }else if num != 0 && num != currentNum {
                guide.guideBlock(position: point, movable: false, unit: unit, number: 10)
                Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                break
            //같은 편이어서 이동 불가
            }else if num != 0 &&  num == currentNum {
                break
            }
        }
        
        //오른쪽 방향 체크
        for i in (xValue+1)..<Variables.row {
            
            let point = CGPoint(x: i, y: yValue)
            let num = Variables.getNum(place: place, point: point)
            //이동 가능
            if num == 0 {
                guide.guideBlock(position: point, movable: true, unit: unit, number: 10)
                Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
            //상대편 장기알 먹을수 있음
            }else if num != 0 && num != currentNum {
                guide.guideBlock(position: point, movable: false, unit: unit, number: 10)
                Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                break
            //같은 편이어서 이동 불가
            }else if num != 0 &&  num == currentNum {
                break
            }
        }
        
        //위쪽 방향 체크
        for i in (0..<yValue).reversed(){
            
            let point = CGPoint(x: xValue, y: i)
            let num = Variables.getNum(place: place, point: point)
            //이동 가능
            if num == 0 {
                guide.guideBlock(position: point, movable: true, unit: unit, number: 10)
                Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
            //상대편 장기알 먹을수 있음
            }else if num != 0 && num != currentNum {
                guide.guideBlock(position: point, movable: false, unit: unit, number: 10)
                Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                break
            //같은 편이어서 이동 불가
            }else if num != 0 &&  num == currentNum {
                break
            }
        }
        
        //아래쪽 방향 체크
        for i in (yValue+1)..<Variables.col{
            
            let point = CGPoint(x: xValue, y: i)
            let num = Variables.getNum(place: place, point: point)
            //이동 가능
            if num == 0 {
                guide.guideBlock(position: point, movable: true, unit: unit, number: 10)
                Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
            //상대편 장기알 먹을수 있음
            }else if num != 0 && num != currentNum {
                guide.guideBlock(position: point, movable: false, unit: unit, number: 10)
                Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                break
            //같은 편이어서 이동 불가
            }else if num != 0 &&  num == currentNum {
                break
            }
        }
        
        //좌측 아래에서 대각선 우측 위
        if point1 == unit.point || point2 == unit.point {
            for i in 1..<3{
                let point = CGPoint(x: xValue + i, y: yValue - i)
                let num = Variables.getNum(place: place, point: point)
                
                //이동 가능
                if num == 0 {
                    guide.guideBlock(position: point, movable: true, unit: unit, number: 10)
                    Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                //상대편 장기알 먹을수 있음
                }else if num != 0 && num != currentNum {
                    guide.guideBlock(position: point, movable: false, unit: unit, number: 10)
                    Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    break
                //같은 편이어서 이동 불가
                }else if num != 0 &&  num == currentNum {
                    break
                }
            }
        }
        
        //우측 아래에서 대각선 좌측 위
        if point3 == unit.point || point4 == unit.point {
            for i in 1..<3{
                let point = CGPoint(x: xValue - i, y: yValue - i)
                let num = Variables.getNum(place: place, point: point)
                
                //이동 가능
                if num == 0 {
                    guide.guideBlock(position: point, movable: true, unit: unit, number: 10)
                    Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                //상대편 장기알 먹을수 있음
                }else if num != 0 && num != currentNum {
                    guide.guideBlock(position: point, movable: false, unit: unit, number: 10)
                    Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    break
                //같은 편이어서 이동 불가
                }else if num != 0 &&  num == currentNum {
                    break
                }
            }
        }
        
        //좌측 위에서 대각선 좌측 아래
        if point5 == unit.point || point6 == unit.point {
            for i in 1..<3{
                let point = CGPoint(x: xValue + i, y: yValue + i)
                let num = Variables.getNum(place: place, point: point)
                
                //이동 가능
                if num == 0 {
                    guide.guideBlock(position: point, movable: true, unit: unit, number: 10)
                    Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                //상대편 장기알 먹을수 있음
                }else if num != 0 && num != currentNum {
                    guide.guideBlock(position: point, movable: false, unit: unit, number: 10)
                    Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    break
                //같은 편이어서 이동 불가
                }else if num != 0 &&  num == currentNum {
                    break
                }
            }
        }
        
        //우측 위에서 대각선 좌측 아래
        if point7 == unit.point || point8 == unit.point {
            for i in 1..<3{
                let point = CGPoint(x: xValue - i, y: yValue + i)
                let num = Variables.getNum(place: place, point: point)
                
                //이동 가능
                if num == 0 {
                    guide.guideBlock(position: point, movable: true, unit: unit, number: 10)
                    Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                //상대편 장기알 먹을수 있음
                }else if num != 0 && num != currentNum {
                    guide.guideBlock(position: point, movable: false, unit: unit, number: 10)
                    Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    break
                //같은 편이어서 이동 불가
                }else if num != 0 &&  num == currentNum {
                    break
                }
            }
        }
        
        //센터
        if point9 == unit.point || point10 == unit.point {
            for i in 1...4 {
                switch i {
                case 1:
                    let point = CGPoint(x: xValue + 1, y: yValue - 1)
                    let num = Variables.getNum(place: place, point: point)
                    
                    //이동 가능
                    if num == 0 {
                        guide.guideBlock(position: point, movable: true, unit: unit, number: 10)
                        Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    //상대편 장기알 먹을수 있음
                    }else if num != 0 && num != currentNum {
                        guide.guideBlock(position: point, movable: false, unit: unit, number: 10)
                        Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    }
                    
                    break
                case 2:
                    let point = CGPoint(x: xValue - 1, y: yValue - 1)
                    let num = Variables.getNum(place: place, point: point)
                    
                    //이동 가능
                    if num == 0 {
                        guide.guideBlock(position: point, movable: true, unit: unit, number: 10)
                        Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    //상대편 장기알 먹을수 있음
                    }else if num != 0 && num != currentNum {
                        guide.guideBlock(position: point, movable: false, unit: unit, number: 10)
                        Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    }
                    
                    break
                case 3:
                    let point = CGPoint(x: xValue + 1, y: yValue + 1)
                    let num = Variables.getNum(place: place, point: point)
                    
                    //이동 가능
                    if num == 0 {
                        guide.guideBlock(position: point, movable: true, unit: unit, number: 10)
                        Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    //상대편 장기알 먹을수 있음
                    }else if num != 0 && num != currentNum {
                        guide.guideBlock(position: point, movable: false, unit: unit, number: 10)
                        Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    }
                    
                    break
                case 4:
                    let point = CGPoint(x: xValue - 1, y: yValue + 1)
                    let num = Variables.getNum(place: place, point: point)
                    
                    //이동 가능
                    if num == 0 {
                        guide.guideBlock(position: point, movable: true, unit: unit, number: 10)
                        Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    //상대편 장기알 먹을수 있음
                    }else if num != 0 && num != currentNum {
                        guide.guideBlock(position: point, movable: false, unit: unit, number: 10)
                        Variables.guideUnits.append(Unit(point: point, name: currentName, num: currentNum))
                    }
                    
                    break
                default:
                    print("default")
                }
            }
        }
    }
}

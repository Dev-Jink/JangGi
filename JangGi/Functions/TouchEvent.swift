//
//  TouchEvent.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/20.
//

import Foundation
import SpriteKit

class TouchEvent {
    let unitController = UnitController()
    var unit = Unit()
    var unitArray = Array<Unit>()
    
    func getSelectedNode(node : SKNode) {
        //장기알 분리
        settArray()
        
        switch node.name {
        case "background":
            removePath()
            //배경 터치시 경로 지우기
            break
        case "guideBlock":
            //경로 이동
            moveUnit(node: node)
            break
        default:
            //장기알 터치시 경로 보여주기
            getPath(node: node)
            break
        }
    }
    
    func getPath(node : SKNode){
        removePath()
        let units = unitArray.filter({$0.name == node.name})
        if !units.isEmpty {
            unit = units.first!
            unitController.movable(place: Variables.allUnits, unit: unit)
        }
    }
    func settArray(){
        unitArray.removeAll()
        if Variables.isGreenTurn {
            for item in Variables.allUnits {
                if item.name.contains("_g"){
                    unitArray.append(item)
                }
            }
        }else {
            for item in Variables.allUnits {
                if item.name.contains("_r"){
                    unitArray.append(item)
                }
            }
        }
    }
    
    func removePath() {
        for item in Variables.scene.children {
            if item.name == "guideBlock" {
                item.removeFromParent()
            }
        }
    }
    
    //장기알 이동
    func moveUnit(node : SKNode){
        //가이드 위치 정보 가져오기
        removePath()
        let xValue = Int(node.position.x)
        let yValue = Int(node.position.y)
        let x = (xValue - Variables.startX) / Variables.interval
        let y = (Variables.startY - yValue) / Variables.interval
        let moveTo = CGPoint(x: x, y: y)
        
        unitController.moveUnit(place: Variables.allUnits, unit: unit, moveTo: moveTo)
    }
}

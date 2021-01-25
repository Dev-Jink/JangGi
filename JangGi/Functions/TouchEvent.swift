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
        case "gameOver", "restart":
            restart()
        case "btn1":
            changePosition(item1: "ma_g1", item2: "seng_g1")
            break
        case "btn2":
            changePosition(item1: "ma_g2", item2: "seng_g2")
            break
        case "btn3":
            changePosition(item1: "ma_r1", item2: "seng_r1")
            break
        case "btn4":
            changePosition(item1: "ma_r2", item2: "seng_r2")
            break
        case "start":
            //게임 실행
            start()
            break
        default:
            //장기알 터치시 경로 보여주기
            getPath(node: node)
            break
        }
    }
    //게임 실행
    func start(){
        if let hideNode = Variables.scene.childNode(withName: "hideNode"){
            hideNode.run(SKAction.fadeOut(withDuration:0.5)){
                hideNode.removeFromParent()
                hideNode.removeAllChildren()
            }
        }
        //장기알 밑으로 내리기
        for item in Variables.scene.children {
            if item.name!.contains("ma") || item.name!.contains("seng"){
                item.zPosition = 0
            }
        }
        
        let image = Images()
        let img_size = image.img_size
        let greenPosition = image.greenPosition
        
        let positionImage = SKSpriteNode(imageNamed: "green_on")
        positionImage.size = img_size
        positionImage.position = greenPosition
        positionImage.zPosition = 50
        positionImage.name = "turnImage"
        
        Variables.scene.addChild(positionImage)
        
        //효과음
        positionImage.run(SKAction.playSoundFileNamed("sound-8.wav", waitForCompletion: false))
    }
    
    //장기알 위치 변경
    func changePosition(item1 : String, item2 : String) {
        let unit1 = Variables.scene.childNode(withName: item1)
        let unit2 = Variables.scene.childNode(withName: item2)
        
        unit1!.run(SKAction.move(to: unit2!.position, duration:0.5))
        unit2!.run(SKAction.move(to: unit1!.position, duration:0.5))
        
        for (i,item) in Variables.allUnits.enumerated() {
            if item.name == unit1!.name {
                let xValue = Int(unit2!.position.x)
                let yValue = Int(unit2!.position.y)
                let x = (xValue - Variables.startX) / Variables.interval
                let y = (Variables.startY - yValue) / Variables.interval
                Variables.allUnits[i].point = CGPoint(x:x, y:y)
                
            }
            if item.name == unit2!.name {
                let xValue = Int(unit1!.position.x)
                let yValue = Int(unit1!.position.y)
                let x = (xValue - Variables.startX) / Variables.interval
                let y = (Variables.startY - yValue) / Variables.interval
                Variables.allUnits[i].point = CGPoint(x:x, y:y)
            }
        }
        //효과음
        unit1?.run(SKAction.playSoundFileNamed("sound-7.wav", waitForCompletion: false))
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
    
    func restart(){
        Variables.allUnits.removeAll()
        Variables.scene.removeFromParent()
        
        let newScene = GameScene(size: Variables.scene.size)
        newScene.anchorPoint = CGPoint(x:0, y:1)
        newScene.scaleMode = .aspectFill
        newScene.name = "scene"
        let transition = SKTransition.flipVertical(withDuration: 1)
        Variables.isGreenTurn = true
        Variables.scene.view?.presentScene(newScene, transition: transition)
    }
}

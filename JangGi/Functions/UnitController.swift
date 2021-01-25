//
//  UnitController.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/20.
//

import Foundation
import SpriteKit

class UnitController {
    
    var isJang = false
    
    func movable(place: [Unit], unit: Unit) {
        
        if unit.name.contains("cha"){
            _ = Cha(place: place, unit: unit)
        }
        if unit.name.contains("ma"){
            _ = Ma(place: place, unit: unit)
        }
        if unit.name.contains("seng"){
            _ = Sang(place: place, unit: unit)
        }
        if unit.name.contains("zol") || unit.name.contains("byung") {
            _ = Zol(place: place, unit: unit)
        }
        if unit.name.contains("wang") || unit.name.contains("sa") {
            _ = KingSa(place: place, unit: unit)
        }
        if unit.name.contains("po"){
            _ = Po(place: place, unit: unit)
        }
    }
    
    //장기알 이동
    func moveUnit(place : [Unit], unit : Unit, moveTo : CGPoint){
        //포지션 값 변경
        let num = Variables.allUnits.firstIndex(where: {$0.name == unit.name})
        Variables.allUnits[num!].point = moveTo
        
        //이동할 장기알 위치 정보
        let n = Variables.getNum(place: place, point: moveTo)
        let deleteItem = Variables.getName(place: place, point: moveTo)
        
        //상대편 장기알 먹을 수 있음
        if n != 0 {
            //데이터를 삭제
            Variables.allUnits.removeAll(where: {$0.name == deleteItem})
            
            //이미지 삭제
            if let deleteNode = Variables.scene.childNode(withName: deleteItem){
                deleteNode.removeFromParent()
            }
        }
        
        //이동할 포지션 값 실제위치
        let xValue = Int(moveTo.x)
        let yValue = Int(moveTo.y)
        let point = CGPoint(x: Variables.startX + Variables.interval * xValue, y: Variables.startY - Variables.interval * yValue)
        //이동할 장기알 이름
        let name = unit.name
        let action = SKAction.move(to: point, duration: 0.1)
        //이동할 장기알 찾아서 이동
        if let node = Variables.scene.childNode(withName: name){
            node.run(action)
            //효과음
            node.run(SKAction.playSoundFileNamed("sound-1.wav", waitForCompletion: false))
            //턴 체인지 체크
            self.checkIsGreenTurn()
            //장군 & 멍군 체크
            self.checkJang(place: Variables.allUnits)
            
        }
    }
    
    //장군 & 멍군 체크
    func checkJang(place: [Unit]) {
        var jangPosition = CGPoint()
        var mungPosition = CGPoint()
        Variables.guideUnits.removeAll()
        
        //장군 체크
        if !isJang {
            if !Variables.isGreenTurn {
                for item in place {
                    if item.name.contains("_g") {
                        movable(place: place, unit: item)
                    }
                    if item.name.contains("wang_r"){
                        jangPosition = item.point
                    }
                }
            }else{
                for item in place {
                    if item.name.contains("_r") {
                        movable(place: place, unit: item)
                    }
                    if item.name.contains("wang_g"){
                        jangPosition = item.point
                    }
                }
            }
        }else {
        //멍군 체크
            if !Variables.isGreenTurn {
                for item in place {
                    if item.name.contains("_r") {
                        movable(place: place, unit: item)
                    }
                    if item.name.contains("wang_g"){
                        mungPosition = item.point
                    }
                }
            }else{
                for item in place {
                    if item.name.contains("_g") {
                        movable(place: place, unit: item)
                    }
                    if item.name.contains("wang_r"){
                        mungPosition = item.point
                    }
                }
            }
        }
        //가이드 블럭 지우기
        for item in Variables.scene.children {
            if item.name  == "guideBlock" {
                item.removeFromParent()
            }
        }
        
        //왕 위치
        let jang = Variables.guideUnits.filter({$0.point == jangPosition})
        let mung = Variables.guideUnits.filter({$0.point == mungPosition})
        
        if !isJang {
            if !jang.isEmpty {
                isJang = true
                effectJang(isJang: isJang)
                print("장")
            }
        }else {
            //게임오버 체크
            if !checkGameOver(place: Variables.allUnits){
                if mung.isEmpty {
                    isJang = false
                    effectJang(isJang: isJang)
                    print("멍")
                }
            }
        }
    }
    
    //장군&멍군 애니메이션
    func effectJang(isJang: Bool){
        var action = SKAction()
        let effect = SKSpriteNode()
        let texture = isJang ? "jang" : "mung"
        effect.position = CGPoint(x: Variables.scene.frame.width / 2, y: -Variables.scene.frame.height / 2)
        effect.size = CGSize(width: 300, height: 200)
        effect.name = "effect"
        effect.zPosition = 3
        effect.texture = SKTexture(imageNamed: texture)
        Variables.scene.addChild(effect)
        action = SKAction.scale(by: 1.2, duration: 1)
        effect.run(action){
            effect.run(SKAction.fadeOut(withDuration: 0.5)){
                effect.removeFromParent()
            }
        }
    }
    
    //턴 체인지 체크
    func checkIsGreenTurn(){
        if Variables.isGreenTurn {
            Variables.isGreenTurn = false
            turnPosition(isGreen: Variables.isGreenTurn)
        }else{
            Variables.isGreenTurn = true
            turnPosition(isGreen: Variables.isGreenTurn)
        }
    }
    
    //누구 차례인지 알려주기
    func turnPosition(isGreen : Bool){
        let image = Images()
        let img_size = image.img_size
        let greenPosition = image.greenPosition
        let redPosition = image.redPosition
        
        //이미지 지우기
        for item in Variables.scene.children {
            if item.name == "turnImage"{
                item.run(SKAction.fadeOut(withDuration: 0.2)){
                    item.removeFromParent()
                }
            }
        }
        
        var point = CGPoint()
        var texture = SKTexture()
        if isGreen {
            point = greenPosition
            texture = SKTexture(imageNamed: "green_on")
        }else{
            point = redPosition
            texture = SKTexture(imageNamed: "red_on")
        }
        
        let turnImage = SKSpriteNode()
        turnImage.size = img_size
        turnImage.position = point
        turnImage.texture = texture
        turnImage.zPosition = 50
        turnImage.name = "turnImage"
        turnImage.alpha = 0
        turnImage.run(SKAction.fadeIn(withDuration: 0.5))
        Variables.scene.addChild(turnImage)
        
        //파란색 장기알 불꺼진 이미지
        let greenOffImage = SKSpriteNode(imageNamed: "green_off")
        greenOffImage.size = img_size
        greenOffImage.position = greenPosition
        greenOffImage.zPosition = 49
        greenOffImage.name = "greenOffImage"
        Variables.scene.addChild(greenOffImage)

        //빨간색 장기알 불꺼진 이미지
        let redOffImage = SKSpriteNode(imageNamed: "red_off")
        redOffImage.size = img_size
        redOffImage.position = redPosition
        redOffImage.zPosition = 49
        redOffImage.name = "redOffImage"
        Variables.scene.addChild(redOffImage)

    }
    
    //게임 오버 체크
    func checkGameOver(place: [Unit]) -> Bool{
        let greenKing = place.filter({$0.name == "wang_g"})
        let redKing = place.filter({$0.name == "wang_r"})
        var result = false
        
        if greenKing.isEmpty{
            print("green GameOver")
            result = true
            gameOver(isGreen: false)
            
        }
        if redKing.isEmpty{
            print("red GameOver")
            result = true
            gameOver(isGreen: true)
        }
        
        return result
    }
    
    func gameOver(isGreen : Bool){
        
        let texture = isGreen ? "cho_win" : "han_win"

        for item in Variables.scene.children {
            if item.name == "turnImage"{
                item.removeFromParent()
            }
        }
        let bg = SKSpriteNode()
    
        bg.color = .black
        bg.alpha = 0.9
        bg.zPosition = 50
    
        bg.position = CGPoint(x: Variables.scene.frame.width / 2, y: -Variables.scene.frame.height / 2)
        bg.size = CGSize(width: Variables.scene.frame.width, height: Variables.scene.frame.height)
        bg.name = "gameOver"
        
        let image = SKSpriteNode()
        image.texture = SKTexture(imageNamed: texture)
        image.position = CGPoint(x: 0, y: 0)
        image.size = CGSize(width: 400, height: 300)
        image.zPosition = 1
        image.name = "restart"
        bg.addChild(image)
        Variables.scene.addChild(bg)
    }
    
    
}

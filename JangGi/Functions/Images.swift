//
//  Image.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/17.
//

import Foundation
import SpriteKit

class Images{
    
    var img_size = CGSize()
    var greenPosition = CGPoint()
    var redPosition = CGPoint()
    var btn_xValue = 0
    var btn_yValue = 0
    
    init(){
        switch UIDevice().name {
        case "iPhone 8":
            img_size = CGSize(width: 100, height: 100)
            greenPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -Variables.scene.frame.height + 100)
            redPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -50)
            btn_xValue = 225
            btn_yValue = 300
        case "iPhone 8 Plus":
            img_size = CGSize(width: 120, height: 120)
            greenPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -Variables.scene.frame.height + 100)
            redPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -50)
            btn_xValue = 260
            btn_yValue = 310
        case "iPhone 11":
            img_size = CGSize(width: 150, height: 150)
            greenPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -Variables.scene.frame.height + 150)
            redPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -120)
            btn_xValue = 260
            btn_yValue = 310
        default:
            img_size = CGSize(width: 100, height: 100)
            greenPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -Variables.scene.frame.height + 100)
            redPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -50)
            btn_xValue = 225
            btn_yValue = 300
        }
    }
    
    func setting(){
        bg()
        addToArray()
        changeUnitPostion()
    }
    
    func addToArray(){
        
        var j = 0
        //졸병 데이터 입력
        for i in 0..<10{
            if i & 1 == 0{
                j += 1
                Variables.allUnits.append(Unit(point: CGPoint(x: i, y: 6), name: "zol_g\(j)", num: 1, imageName: "Green_Zol"))
                Variables.allUnits.append(Unit(point: CGPoint(x: i, y: 3), name: "byung_r\(j)", num: 2, imageName: "Red_Byung"))
            }
        }
        
        //포 데이터 입력
        Variables.allUnits.append(Unit(point: CGPoint(x: 1, y: 7), name: "po_g1", num: 1, imageName: "Green_Po"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 7, y: 7), name: "po_g2", num: 1, imageName: "Green_Po"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 1, y: 2), name: "po_r1", num: 2, imageName: "Red_Po"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 7, y: 2), name: "po_r2", num: 2, imageName: "Red_Po"))
        
        //차 데이터 입력
        Variables.allUnits.append(Unit(point: CGPoint(x: 0, y: 9), name: "cha_g1", num: 1, imageName: "Green_Cha"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 8, y: 9), name: "cha_g2", num: 1, imageName: "Green_Cha"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 0, y: 0), name: "cha_r1", num: 2, imageName: "Red_Cha"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 8, y: 0), name: "cha_r2", num: 2, imageName: "Red_Cha"))
        
        //상 데이터 입력
        Variables.allUnits.append(Unit(point: CGPoint(x: 1, y: 9), name: "seng_g1", num: 1, imageName: "Green_Sang"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 7, y: 9), name: "seng_g2", num: 1, imageName: "Green_Sang"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 1, y: 0), name: "seng_r1", num: 2, imageName: "Red_Sang"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 7, y: 0), name: "seng_r2", num: 2, imageName: "Red_Sang"))
        
        //마 데이터 입력
        Variables.allUnits.append(Unit(point: CGPoint(x: 2, y: 9), name: "ma_g1", num: 1, imageName: "Green_Ma"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 6, y: 9), name: "ma_g2", num: 1, imageName: "Green_Ma"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 2, y: 0), name: "ma_r1", num: 2, imageName: "Red_Ma"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 6, y: 0), name: "ma_r2", num: 2, imageName: "Red_Ma"))
        
        //사 데이터 입력
        Variables.allUnits.append(Unit(point: CGPoint(x: 3, y: 9), name: "sa_g1", num: 1, imageName: "Green_Sa"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 5, y: 9), name: "sa_g2", num: 1, imageName: "Green_Sa"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 3, y: 0), name: "sa_r1", num: 2, imageName: "Red_Sa"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 5, y: 0), name: "sa_r2", num: 2, imageName: "Red_Sa"))
        
        //왕 데이터 입력
        Variables.allUnits.append(Unit(point: CGPoint(x: 4, y: 8), name: "wang_g", num: 1, imageName: "Green_King"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 4, y: 1), name: "wang_r", num: 2, imageName: "Red_King"))
        
        unitSetting()
    }
    
    func unitSetting(){
        for item in Variables.allUnits{
            let unit = SKSpriteNode()
            unit.texture = SKTexture(imageNamed: item.imageName)
            let xValue = Int(item.point.x)
            let yValue = Int(item.point.y)
            unit.position = CGPoint(x: Variables.startX + Variables.interval * xValue, y:  Variables.startY - Variables.interval * yValue)
            unit.size = CGSize(width: Variables.interval, height: Variables.interval)
            unit.name = item.name
            unit.zPosition = 1
            Variables.scene.addChild(unit)
        }
        
    }
    
    func bg(){
        let bg = SKSpriteNode(imageNamed: "bg")
        bg.size = CGSize(width: Variables.scene.frame.width, height: Variables.scene.frame.height)
        bg.name = "bg"
        bg.position = CGPoint(x: Variables.scene.frame.width / 2, y : -Variables.scene.frame.height / 2 )
        bg.zPosition = -2
       
        Variables.scene.addChild(bg)
        
        let place = SKSpriteNode(imageNamed: "place")
        let xValue = Variables.interval * Variables.row
        let yValue = Variables.interval * Variables.col
         
        place.size = CGSize(width: xValue, height: yValue)
        place.name = "background"
        place.anchorPoint = CGPoint(x: 0, y: 1)
        place.position = CGPoint(x: Variables.interval / 2, y: Variables.startY + Variables.interval / 2)
        Variables.scene.addChild(place)
    }
    
    //장기알 위치 변경
    func changeUnitPostion(){
        let hideNode = SKSpriteNode()
        hideNode.size = Variables.scene.frame.size
        hideNode.position = CGPoint(x: Variables.scene.frame.width / 2, y: -Variables.scene.frame.height / 2)
        hideNode.color = .black
        hideNode.alpha = 0.8
        hideNode.zPosition = 100
        hideNode.name = "hideNode"
        
        let start = SKSpriteNode(imageNamed: "start_btn")
        start.setScale(0.4)
        start.position = CGPoint(x: 0, y: 20)
        start.name = "start"
        start.zPosition = 103
        hideNode.addChild(start)
        
        //버튼 애니메이션
        let action = SKAction.scale(by:1.03, duration: 0.5)
        let action1 = SKAction.scale(by:0.97, duration: 0.5)
        let sequence = SKAction.sequence([action,action1])
        
        let btn1 = SKSpriteNode(imageNamed: "replace_btn")
        btn1.setScale(1)
        btn1.anchorPoint = CGPoint(x: 0.5, y:0.5)
        btn1.position = CGPoint(x: -btn_xValue, y: -btn_yValue)
        btn1.zPosition = 105
        btn1.name = "btn1"
        btn1.run(SKAction.repeatForever(sequence))
        start.addChild(btn1)
        
        let btn2 = SKSpriteNode(imageNamed: "replace_btn")
        btn2.setScale(1)
        btn2.anchorPoint = CGPoint(x: 0.5, y:0.5)
        btn2.position = CGPoint(x: btn_xValue, y: -btn_yValue)
        btn2.zPosition = 105
        btn2.name = "btn2"
        btn2.run(SKAction.repeatForever(sequence))
        start.addChild(btn2)
        
        let btn3 = SKSpriteNode(imageNamed: "replace_btn")
        btn3.setScale(1)
        btn3.anchorPoint = CGPoint(x: 0.5, y:0.5)
        btn3.position = CGPoint(x: -btn_xValue, y: btn_yValue)
        btn3.zPosition = 105
        btn3.name = "btn3"
        btn3.run(SKAction.repeatForever(sequence))
        start.addChild(btn3)
        
        let btn4 = SKSpriteNode(imageNamed: "replace_btn")
        btn4.setScale(1)
        btn4.anchorPoint = CGPoint(x: 0.5, y:0.5)
        btn4.position = CGPoint(x: btn_xValue, y: btn_yValue)
        btn4.zPosition = 105
        btn4.name = "btn4"
        btn4.run(SKAction.repeatForever(sequence))
        start.addChild(btn4)
        
        Variables.scene.addChild(hideNode)
        for item in Variables.scene.children {
            if item.name!.contains("ma") || item.name!.contains("seng"){
                item.zPosition = 101
            }
        }
    }
}

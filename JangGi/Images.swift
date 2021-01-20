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
    
    init(){
        switch UIDevice().name {
        case "iPhone 8":
            img_size = CGSize(width: 100, height: 100)
            greenPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -Variables.scene.frame.height + 100)
            redPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -50)
        case "iPhone 8 Plus":
            img_size = CGSize(width: 120, height: 120)
            greenPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -Variables.scene.frame.height + 100)
            redPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -50)
        case "iPhone 11":
            img_size = CGSize(width: 150, height: 150)
            greenPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -Variables.scene.frame.height + 150)
            redPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -120)
        default:
            img_size = CGSize(width: 100, height: 100)
            greenPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -Variables.scene.frame.height + 100)
            redPosition = CGPoint(x: Variables.scene.frame.width / 2, y: -50)
        }
    }
    
    func setting(){
        bg()
        addToArray()
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
        Variables.allUnits.append(Unit(point: CGPoint(x: 4, y: 8), name: "wang_g1", num: 1, imageName: "Green_King"))
        Variables.allUnits.append(Unit(point: CGPoint(x: 4, y: 1), name: "wang_r2", num: 2, imageName: "Red_King"))
        
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
}

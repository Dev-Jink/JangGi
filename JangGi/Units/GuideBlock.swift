//
//  GuideBlock.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/19.
//

import Foundation
import SpriteKit

class GuideBlock{
    func guideBlock(position : CGPoint , movable : Bool){
        let block = SKSpriteNode()
        block.size = CGSize(width: Variables.interval - 2, height: Variables.interval - 2)
        let imageName = movable ? "guide_G" : "guide_R"
        block.texture = SKTexture(imageNamed: imageName)
        block.alpha = 0.5
        block.zPosition = 2
        block.name = "guideBlock"
        let xValue = Variables.startX + (Int(position.x) * Variables.interval)
        let yValue = Variables.startY - (Int(position.y) * Variables.interval)
        block.position = CGPoint(x: xValue, y: yValue)
        Variables.scene.addChild(block)
    }
}

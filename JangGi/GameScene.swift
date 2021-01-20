//
//  GameScene.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/17.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let touchEvent = TouchEvent()
    override func didMove(to view: SKView) {
        Variables.scene = self
        let image = Images()
        image.setting()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let n : SKNode = self.atPoint(location!)
        
        touchEvent.getSelectedNode(node: n)
    }
}

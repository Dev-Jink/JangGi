//
//  GameScene.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/17.
//

import SpriteKit
import GameplayKit
import AVKit

class GameScene: SKScene {
    let touchEvent = TouchEvent()
    var bgSound = AVAudioPlayer()
    
    override func didMove(to view: SKView) {
        Variables.scene = self
        let image = Images()
        image.setting()
        sound()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let n : SKNode = self.atPoint(location!)
        
        touchEvent.getSelectedNode(node: n)
    }
    
    func sound(){
        if let url = Bundle.main.path(forResource: "sound-6", ofType: "mp3"){
            do{
                bgSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
            }catch{
                print("error")
            }
            bgSound.volume = 0.5
            bgSound.numberOfLoops = -1
            bgSound.play()
        }
    }
}

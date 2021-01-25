//
//  Intro.swift
//  JangGi
//
//  Created by MyeongJin on 2021/01/24.
//

import Foundation
import SpriteKit
import AVKit

class Intro : SKScene {
    
    var bgSound = AVAudioPlayer()
    
    override func didMove(to view: SKView) {
        let bg = SKSpriteNode(imageNamed: "intro")
        bg.size = view.frame.size
        bg.position = CGPoint(x: view.frame.width / 2, y: -view.frame.height / 2)
        addChild(bg)
        sound()
    }
    
    func sound(){
        if let url = Bundle.main.path(forResource: "sound-3", ofType: "wav"){
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let scene = GameScene(size: view!.frame.size)
        scene.scaleMode = .aspectFill
        scene.anchorPoint = CGPoint(x: 0, y: 1)
        
        scene.name = "scene"
        let transition = SKTransition.flipVertical(withDuration: 0.5)
        view?.presentScene(scene, transition: transition)
        
    }
}

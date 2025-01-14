//
//  gameViewController.swift
//  Cathy
//
//  Created by Terretino on 09/10/18.
//  Copyright © 2018 Rangga Leo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var outletEndGameButton: UIButton!
    @IBOutlet weak var outletLabelOKButton: UILabel!
    var timer = Timer()
    var toChronology = ChronologyViewController()
    var score = 0
    var backgroundMusic = backgroundSound.shared
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundMusic.playSound(namaMusic: "laguGame")
        print("play game")
        outletEndGameButton.isHidden = true
        outletLabelOKButton.isHidden = true
        showCountdownScene()
        _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(GameViewController.update), userInfo: nil, repeats: false)
        _ = Timer.scheduledTimer(timeInterval: 48, target: self, selector: #selector(GameViewController.endGame), userInfo: nil, repeats: false)
    }
    
    
    func showCountdownScene() {
            let scene = GameScene(fileNamed: "startGameScene")
            let skView = view as! SKView
//            skView.showsFPS = true
//            skView.showsNodeCount = true
            skView.presentScene(scene)
    }
    
    func showGameScene() {
            let scene = GameScene(size: view.bounds.size)
            let skView = view as! SKView
//            skView.showsFPS = true
//            skView.showsNodeCount = true
            skView.presentScene(scene)
    }
    
    func showEndGameScene() {
        backgroundMusic.musicPlayer.stop()
        backgroundMusic.playSound(namaMusic: "defaultMusic")
        let scene = GameScene(fileNamed: "endGameScene")
        let skView = view as! SKView
        skView.presentScene(scene)
    }
    
    @objc func update(){
        showGameScene()
    }
    
    @objc func endGame() {
        outletEndGameButton.isHidden = false
        outletLabelOKButton.isHidden = false
        showEndGameScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}

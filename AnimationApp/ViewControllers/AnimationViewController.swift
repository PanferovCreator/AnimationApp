//
//  AnimationViewController.swift
//  AnimationApp
//
//  Created by Dmitriy Panferov on 02/05/23.
//

import UIKit
import SpringAnimation

class AnimationViewController: UIViewController {
    
    @IBOutlet weak var animationView: SpringView!
    
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    @IBOutlet weak var runButton: UIButton!
    
    var animations = Animation.getAnimation()
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presetLabel.text = "preset: \(animations[currentIndex].preset)"
        curveLabel.text = "curve: \(animations[currentIndex].curve)"
        forceLabel.text = "force: \(animations[currentIndex].force)"
        durationLabel.text = "duration: \(animations[currentIndex].duration)"
        delayLabel.text = "delay: \(animations[currentIndex].delay)"
        print(animations.count)
    }
    
    @IBAction func runButtonPressed(_ sender: UIButton) {
        currentIndex += 1
        
        if currentIndex != 0 {
            animationView.animation = animations[currentIndex].preset
            animationView.curve = animations[currentIndex].curve
            animationView.force = animations[currentIndex].force
            animationView.duration = animations[currentIndex].duration
            animationView.delay = animations[currentIndex].delay
            animationView.animate()
            
            presetLabel.text = "preset: \(animations[currentIndex].preset)"
            curveLabel.text = "curve: \(animations[currentIndex].curve)"
            forceLabel.text = "force: \(animations[currentIndex].force)"
            durationLabel.text = "duration: \(animations[currentIndex].duration)"
            delayLabel.text = "delay: \(animations[currentIndex].delay)"
            
            if currentIndex >= animations.count {
                currentIndex = 0
                animations = Animation.getAnimation()
            }
            if currentIndex < animations.count - 1 {
                runButton.setTitle("Run \(animations[currentIndex + 1].preset)", for: .normal)
            }
        }
    }
}


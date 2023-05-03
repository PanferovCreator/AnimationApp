//
//  Animation.swift
//  AnimationApp
//
//  Created by Dmitriy Panferov on 02/05/23.
//

import Foundation

struct Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
}

extension Animation {
    static func getAnimation() -> [Animation] {
        
        var animations: [Animation] = []
        
        let presets = DataStore.shared.presets.shuffled()
        let curves = DataStore.shared.curves.shuffled()
        let forces = DataStore.shared.forces.shuffled()
        let durations = DataStore.shared.durations.shuffled()
        let delays = DataStore.shared.delays.shuffled()
        
        for index in 0..<presets.count {
            let animation = Animation(
                preset: presets[index],
                curve: curves[index],
                force: forces[index],
                duration: durations[index],
                delay: delays[index]
            )
            
            animations.append(animation)
        }
        
        return animations
    }
}

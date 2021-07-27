//
//  TrafficLightView.swift
//  TrafficLight
//
//  Created by Иван Маришин on 27.07.2021.
//

import SwiftUI

struct TrafficLightView: View {
    let redLight: Bool
    let yellowLight: Bool
    let greenLight: Bool
    
    var body: some View {
        VStack{
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(.red)
                .contrast(redLight ? 0.3:1.5)
                .overlay(Capsule(style: .circular).stroke(lineWidth: 3).foregroundColor(.white))
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(.yellow)
                .contrast(yellowLight ? 0.3:1.5)
                .overlay(Capsule(style: .circular).stroke(lineWidth: 3).foregroundColor(.white))
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(.green)
                .contrast(greenLight ? 0.3:1.5)
                .overlay(Capsule(style: .circular).stroke(lineWidth: 3).foregroundColor(.white))
        }
    }
}

struct TrafficLightView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLightView(redLight: false, yellowLight: false, greenLight: false)
    }
}

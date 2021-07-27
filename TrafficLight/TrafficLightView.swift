//
//  TrafficLightView.swift
//  TrafficLight
//
//  Created by Иван Маришин on 27.07.2021.
//

import SwiftUI

struct TrafficLightView: View {
    let redLight: Double
    let yellowLight: Double
    let greenLight: Double
    
    var body: some View {
        VStack{
            Circle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .foregroundColor(.red)
                .contrast(redLight)
                .overlay(Capsule(style: .circular).stroke(lineWidth: 3).foregroundColor(.white))
            Circle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .foregroundColor(.yellow)
                .contrast(yellowLight)
                .overlay(Capsule(style: .circular).stroke(lineWidth: 3).foregroundColor(.white))
            Circle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .foregroundColor(.green)
                .contrast(greenLight)
                .overlay(Capsule(style: .circular).stroke(lineWidth: 3).foregroundColor(.white))
        }
    }
}

struct TrafficLightView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLightView(redLight: 0.5, yellowLight: 0.5, greenLight: 0.5)
    }
}

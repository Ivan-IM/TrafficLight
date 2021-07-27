//
//  ContentView.swift
//  TrafficLight
//
//  Created by Иван Маришин on 27.07.2021.
//

import SwiftUI

struct ContentView: View {
    @State var redLight = 1.5
    @State var yellowLight = 1.5
    @State var greenLight = 1.5
    @State private var currentLight = CurrentLight.red
    @State var buttonTitle = "START"
    @State var buttonIsHidden = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                .ignoresSafeArea()
            VStack{
                TrafficLightView(redLight: redLight, yellowLight: yellowLight, greenLight: greenLight)
                Spacer()
                Button(action: {
                    buttonTitle = "NEXT"
                    
                    switch currentLight {
                    case .red:
                        redLight = 1.5
                        yellowLight = 0.3
                        greenLight = 0.3
                        currentLight = .yellow
                    case .yellow:
                        redLight = 0.3
                        yellowLight = 1.5
                        greenLight = 0.3
                        currentLight = .green
                    case .green:
                        redLight = 0.3
                        yellowLight = 0.3
                        greenLight = 1.5
                        currentLight = .red
                    }
                }, label: {
                    Text(buttonTitle)
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                        .cornerRadius(20)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .overlay(Capsule(style: .continuous).stroke(lineWidth: 3).foregroundColor(.white))
                })
                .opacity(buttonIsHidden ? 1:0)
            }.padding()
        }
        .onAppear() {
            withAnimation(Animation.easeIn.delay(0.5)) {
                redLight = 0.3
            }
            withAnimation(Animation.easeIn.delay(1.5)) {
                yellowLight = 0.3
            }
            withAnimation(Animation.easeIn.delay(2.5)) {
                greenLight = 0.3
            }
            withAnimation(Animation.easeIn(duration: 0.5).delay(3.5)) {
                buttonIsHidden = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

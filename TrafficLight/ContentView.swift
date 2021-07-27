//
//  ContentView.swift
//  TrafficLight
//
//  Created by Иван Маришин on 27.07.2021.
//

import SwiftUI

struct ContentView: View {
    @State var redLight = false
    @State var yellowLight = false
    @State var greenLight = false
    @State var currentLight = CurrentLight.red
    @State var buttonTitle = "START"
    @State var buttonIsHidden = false
    @State var buttonIsDisable = true
    
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
                        redLight = false
                        greenLight = true
                        currentLight = .yellow
                    case .yellow:
                        redLight = true
                        yellowLight = false
                        currentLight = .green
                    case .green:
                        yellowLight = true
                        greenLight = false
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
                .disabled(buttonIsDisable)
                .opacity(buttonIsHidden ? 1:0)
            }.padding()
        }
        .onAppear() {
            withAnimation(Animation.easeIn.delay(0.5)) {
                redLight = true
            }
            withAnimation(Animation.easeIn.delay(1.5)) {
                yellowLight = true
            }
            withAnimation(Animation.easeIn.delay(2.5)) {
                greenLight = true
            }
            withAnimation(Animation.easeIn(duration: 0.5).delay(3.5)) {
                buttonIsHidden = true
            }
            delayButtonIsActive()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private func delayButtonIsActive() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            buttonIsDisable = false
        }
    }
}

//
//  ContentView.swift
//  TestSlavit
//
//  Created by Кирилл Коновалов on 18.10.2023.
//

import SwiftUI
import WebKit

struct TopModel {
    let country: String
    let name: String
    let deposit: Int
    var profit: Int
}
struct TopView: View {
    @State var top: [TopModel] = [
        TopModel(country: "001",
                 name: "Oliver",
                 deposit: 2367,
                 profit: 336755),
        TopModel(country: "002",
                 name: "Jack",
                 deposit: 1175,
                 profit: 148389),
        TopModel(country: "003",
                 name: "Harry",
                 deposit: 1000,
                 profit: 113888),
        TopModel(country: "004",
                 name: "Jacob",
                 deposit: 999,
                 profit: 36755),
        TopModel(country: "005",
                 name: "Charley",
                 deposit: 888,
                 profit: 18389),
        TopModel(country: "006",
                 name: "Thomas",
                 deposit: 777,
                 profit: 12000),
        TopModel(country: "007",
                 name: "George",
                 deposit: 666,
                 profit: 11111),
        TopModel(country: "008",
                 name: "Oscar",
                 deposit: 555,
                 profit: 9988),
        TopModel(country: "009",
                 name: "James",
                 deposit: 444,
                 profit: 8877),
        TopModel(country: "010",
                 name: "William",
                 deposit: 333,
                 profit: 6652),
    ]
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State var name: String = ""
    var body: some View {
        ZStack() {
            Color(red: 0.11, green: 0.12, blue: 0.18)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 29) {
                Text("TOP 10 Traders")
                  .font(Font.custom("Inter-Bold", size: 22))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                
                VStack(spacing: 0) {
                    HStack() {
                        Text("№")
                            .font(Font.custom("Inter-Medium", size: 12))
                            .foregroundColor(Color("gray"))
                        
                        Spacer()
                        
                        Text("Сountry")
                            .font(Font.custom("Inter-Medium", size: 12))
                            .foregroundColor(Color("gray"))
                        
                        Spacer()
                        
                        Text("Name")
                            .font(Font.custom("Inter-Medium", size: 12))
                            .foregroundColor(Color("gray"))
                        
                        Spacer()
                        
                        Text("Deposit")
                            .font(Font.custom("Inter-Medium", size: 12))
                            .foregroundColor(Color("gray"))
                        
                        Spacer()
                        
                        Text("Profit")
                            .font(Font.custom("Inter-Medium", size: 12))
                            .foregroundColor(Color("gray"))
                        
                    }
                    .padding(.horizontal, 8)
                    .frame(width: UIScreen.main.bounds.width - 16)
                    .padding(.top, 21)
                    .padding(.bottom, 19)
                    .background(Color.init(hex: "2E303E"))
                    .sideСornerRadius(12, corners: [.topLeft, .topRight])
                    
                    VStack(spacing: 0) {
                        ForEach(top.indices, id: \.self) { index in
                            HStack() {
                                Text("\(index + 1)")
                                    .font(Font.custom("Inter-Medium", size: 14))
                                    .foregroundColor(Color("gray"))
                                
                                Spacer()
                                
                                Image(top[index].country)
                                
                                Spacer()
                                
                                Text(top[index].name)
                                    .font(Font.custom("Inter-Medium", size: 14))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text("$\(top[index].deposit)")
                                    .font(Font.custom("Inter-Medium", size: 14))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text("$\(top[index].profit)")
                                    .font(Font.custom("Inter-Medium", size: 14))
                                    .foregroundColor(Color("green"))
                                
                            }
                            .padding(.horizontal, 8)
                            .frame(width: UIScreen.main.bounds.width - 16,
                                   height: 50)
                            .background(index % 2 != 0 ? Color.init(hex: "2E303E") : .clear)
                        }
                    }
                }
                
                Text(name)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.top, 20)
        }
        .onReceive(timer) { input in
            let arr: [Int] = Array(0...9)
            top[arr.randomElement()!].profit += 50
            top[arr.randomElement()!].profit -= 150
            
            top = top.sorted(by: { $0.profit > $1.profit})
            
        }
    }
    
    func eventWith(timer: Timer!) {
            let info = timer.userInfo as Any
            print(info)
        }
}

#Preview {
    TopView()
}

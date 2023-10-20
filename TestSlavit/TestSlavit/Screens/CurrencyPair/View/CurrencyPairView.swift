//
//  CurrencyPairView.swift
//  TestSlavit
//
//  Created by Кирилл Коновалов on 19.10.2023.
//

import SwiftUI

struct CurrencyPairModel: Identifiable {
    let id: UUID = UUID()
    let name: String
    let url: String
    var isActive: Bool
}

struct CurrencyPairView: View {
    @ObservedObject var viewModel: TradeViewModel
    
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack() {
            Color.init(hex: "#121629")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 36) {
                HStack() {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        viewModel.shouldRefresh.toggle()
                    }, label: {
                        Image("arrow-left")
                            .rotationEffect(.degrees(-180))
                    })
                    
                    Spacer()
                    
                    Text("Currency pair")
                        .font(Font.custom("Inter-Bold", size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                    
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal, 9)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.currencyPair.indices, id: \.self) { index in
                        Button {
                            for item in viewModel.currencyPair.indices {
                                viewModel.currencyPair[item].isActive = false
                            }
                            viewModel.currencyPair[index].isActive = true
                            viewModel.selectCurrencyPair = viewModel.currencyPair[index].name
                            viewModel.url = viewModel.currencyPair[index].url
                        } label: {
                            Text(viewModel.currencyPair[index].name)
                                .font(Font.custom("Inter-Bold", size: 14))
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .frame(width: UIScreen.main.bounds.width / 2 - 50,
                                       height: 54)
                                .background(viewModel.currencyPair[index].isActive ? Color.init(hex: "#35B972") : Color.init(hex: "#333749"))
                                .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal, 29)
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CurrencyPairView(viewModel: TradeViewModel())
}

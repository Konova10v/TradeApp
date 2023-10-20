//
//  TradeView.swift
//  TestSlavit
//
//  Created by Кирилл Коновалов on 18.10.2023.
//

import SwiftUI
import WebKit
import Combine
import UIKit

struct TradeView: View, KeyboardReadable {
    @ObservedObject var viewModel: TradeViewModel = TradeViewModel()
    @State var text: String = "00:01"
    @State var showColor: Bool = false
    
    var body: some View {
        NavigationView() {
            ZStack(alignment: .bottom) {
                ZStack(alignment: .top) {
                    Color.init(hex: "#121629")
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 15) {
                        Text("Trade")
                            .font(Font.custom("Inter-Bold", size: UIScreen.main.bounds.width / 20))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                        
                        VStack(spacing: 7) {
                            Text("Balance")
                                .font(Font.custom("Inter-Medium", size: UIScreen.main.bounds.width / 31))
                                .foregroundColor(Color("gray"))
                            
                            Text("10 000")
                                .font(Font.custom("Inter-Bold", size: UIScreen.main.bounds.width / 25))
                                .foregroundColor(.white)
                        }
                        .padding(.top, 8)
                        .padding(.bottom, 12)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.init(hex: "#333749"))
                        .cornerRadius(12)
                        
                        WebView(url: URL(string: viewModel.url), reload: $viewModel.shouldRefresh)
                            .frame(height: UIScreen.main.bounds.height / 2.6)
                        
                        Spacer()
                    }
                }
                
                ZStack(alignment: .bottom, content: {
                    Color.init(hex: "#121629")
                        .edgesIgnoringSafeArea(.all)
                        .hidden()
                    
                    VStack(spacing: 10) {
                        NavigationLink {
                            CurrencyPairView(viewModel: viewModel)
                        } label: {
                            HStack() {
                                Spacer()
                                
                                Text(viewModel.selectCurrencyPair)
                                    .font(Font.custom("Inter-Bold", size: UIScreen.main.bounds.width / 25))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .padding(.leading, 34)
                                
                                Spacer()
                                
                                Image("arrow-left")
                            }
                            .padding(.trailing, 17)
                            .frame(width: UIScreen.main.bounds.width - 60, height: UIScreen.main.bounds.width / 7)
                            .background(Color.init(hex: "#333749"))
                            .cornerRadius(12)
                        }
                        
                        HStack(spacing: 11) {
                            VStack() {
                                Text("Timer")
                                    .font(Font.custom("Inter-Medium", size: 12))
                                    .foregroundColor(.white)
                                
                                HStack() {
                                    Image("minus-cirlce")
                                    
                                    Spacer()
                                    
                                    TextField(
                                      "Hint Text",
                                      text: $text
                                    )
                                    .multilineTextAlignment(.center)
                                    .font(Font.custom("Inter-Bold", size: 16))
                                    .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    Image("add-circle")
                                }
                                .padding(.horizontal, 19)
                                .frame(width: UIScreen.main.bounds.width / 2 - 30, height: UIScreen.main.bounds.width / 7)
                                .background(Color.init(hex: "#333749"))
                                .cornerRadius(12)
                                
                            }
                            
                            VStack() {
                                Text("Investment")
                                    .font(Font.custom("Inter-Medium", size: 12))
                                    .foregroundColor(.white)
                                
                                HStack() {
                                    Image("minus-cirlce")
                                    
                                    Spacer()
                                    
                                    TextField(
                                      "Hint Text",
                                      text: $text
                                    )
                                    .multilineTextAlignment(.center)
                                    .font(Font.custom("Inter-Bold", size: 16))
                                    .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    Image("add-circle")
                                }
                                .padding(.horizontal, 20)
                                .frame(width: UIScreen.main.bounds.width / 2 - 30, height: UIScreen.main.bounds.width / 7)
                                .background(Color.init(hex: "#333749"))
                                .cornerRadius(12)
                                
                            }
                        }
                        
                        HStack(spacing: 11) {
                            Button(action: {
                                
                            }, label: {
                                Text("Sell")
                                    .font(Font.custom("Inter-Bold", size: 24))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 19)
                                    .frame(width: UIScreen.main.bounds.width / 2 - 30,
                                           height: UIScreen.main.bounds.width / 7,
                                           alignment: .leading)
                                    .background(Color.init(hex: "#FE3D43"))
                                    .cornerRadius(12)
                            })
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Buy")
                                    .font(Font.custom("Inter-Bold", size: 24))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20)
                                    .frame(width: UIScreen.main.bounds.width / 2 - 30,
                                           height: UIScreen.main.bounds.width / 7,
                                           alignment: .leading)
                                    .background(Color.init(hex: "#35B972"))
                                    .cornerRadius(12)
                            })
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(.top, 10)
                    .frame(width: UIScreen.main.bounds.width)
                    .background(Color.init(hex: "#121629"))
                })
            }
        }
        .onReceive(keyboardPublisher) { newIsKeyboardVisible in
            showColor.toggle()
        }
    }
}

#Preview {
    TradeView()
}


struct WebView: UIViewRepresentable{

    var url: URL?     // optional, if absent, one of below search servers used
    @Binding var reload: Bool

    private let urls = [URL(string: "https://google.com/")!, URL(string: "https://bing.com")!]
    private let webview = WKWebView()

    fileprivate func loadRequest(in webView: WKWebView) {
        if let url = url {
            webView.load(URLRequest(url: url))
        } else {
            let index = Int(Date().timeIntervalSince1970) % 2
            webView.load(URLRequest(url: urls[index]))
        }
    }

    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        loadRequest(in: webview)
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        if reload {
            loadRequest(in: uiView)
            DispatchQueue.main.async {
                self.reload = false     // must be async
            }
        }
    }
}


/// Publisher to read keyboard changes.
protocol KeyboardReadable {
    var keyboardPublisher: AnyPublisher<Bool, Never> { get }
}

extension KeyboardReadable {
    var keyboardPublisher: AnyPublisher<Bool, Never> {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .map { _ in true },
            
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in false }
        )
        .eraseToAnyPublisher()
    }
}

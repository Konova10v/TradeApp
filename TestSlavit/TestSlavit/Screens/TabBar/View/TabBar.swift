//
//  TabBar.swift
//  TestSlavit
//
//  Created by Кирилл Коновалов on 18.10.2023.
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    @State var selection = 0
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $selection) {
            TradeView()
                .tabItem {
                    if selection == 0 {
                        Image("tradeTabBarSelect")
                        
                        Text("Trade")
                            .foregroundColor(.white)
                    } else {
                        Image("tradeTabBar")
                        Text("Trade")
                            .foregroundColor(.white)
                    }
                }
                .tag(0)
            
            TopView()
                .tabItem {
                    if selection == 1 {
                        Image("topTabBarSelect")
                        
                        Text("Trade")
                            .foregroundColor(.white)
                    } else {
                        Image("topTabBar")
                        Text("Top")
                            .foregroundColor(.white)
                    }
                }
                .tag(1)
        }
        .accentColor(Color("green"))
        .task {
            registerForPushNotifications()
            try? await Task.sleep(for: Duration.seconds(2))
            self.launchScreenState.dismiss()
        }
    }
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            print("Permission granted: \(granted)")
        }
    }
}

#Preview {
    TabBar()
}

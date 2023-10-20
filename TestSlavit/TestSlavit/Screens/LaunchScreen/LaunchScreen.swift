//
//  LaunchScreen.swift
//  TestSlavit
//
//  Created by Кирилл Коновалов on 19.10.2023.
//

import Foundation
import SwiftUI
import Combine

enum LaunchScreenStep {
    case firstStep
    case secondStep
    case finished
}

final class LaunchScreenStateManager: ObservableObject {

@MainActor @Published private(set) var state: LaunchScreenStep = .firstStep

    @MainActor func dismiss() {
        Task {
            state = .secondStep

            try? await Task.sleep(for: Duration.seconds(1))

            self.state = .finished
        }
    }
}

struct LaunchScreenView: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager // Mark 1

    @State private var firstAnimation = false
    @State private var secondAnimation = false
    @State private var startFadeoutAnimation = false
    
    private let animationTimer = Timer
        .publish(every: 0.5, on: .current, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            ContentView()
        }
    }
    
    private func updateAnimation() { // Mark 5
        switch launchScreenState.state {
        case .firstStep:
            withAnimation(.easeInOut(duration: 0.9)) {
                firstAnimation.toggle()
            }
        case .secondStep:
            if secondAnimation == false {
                withAnimation(.linear) {
                    self.secondAnimation = true
                    startFadeoutAnimation = true
                }
            }
        case .finished:
            break
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenStateManager())
    }
}


struct ContentView: View {
  @State private var progress: CGFloat = 0.0

  let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack(alignment: .center, content: {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 300, height: 24)
                    .foregroundColor(.init(hex: "#5B5A60"))
                    .cornerRadius(30)
                
                Rectangle()
                    .frame(width: progress * 300, height: 24)
                    .foregroundColor(Color("green"))
                    .cornerRadius(30)
                    .animation(.easeInOut, value: progress)
            }
            
            Text("\(Int(progress * 100 - 2 ))")
        })
        .onReceive(timer) { _ in
            if progress < 1.0 {
                progress += 0.03
            }
        }
    }
}

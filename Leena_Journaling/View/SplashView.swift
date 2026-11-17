//
//  Leena_JournalingApp.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 09/11/2026.
//

import SwiftUI

struct SplashView: View {

    @State private var isFinished = false

    var body: some View {
        if isFinished {
            MainView()
        } else {
            VStack {
                Image("ImageTwo")
                    .resizable()
                    .frame(width: 81, height: 106)

                Text("Journali")
                    .font(.system(size: 42, weight: .black))

                Text("Your thoughts, your story")
                    .font(.system(size: 21, weight: .light))
                    .padding(.top, -20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isFinished = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}

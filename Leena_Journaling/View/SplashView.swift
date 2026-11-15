//
//  Leena_JournalingApp.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 09/11/2026.
//

import SwiftUI

struct SplashView: View {

    // متغير يتذكر: خلصت السبلاش ولا لا؟
    @State private var isFinished = false

    var body: some View {
        if isFinished {
            // بعد السبلاش نعرض صفحة الامبتي ستيت
           // EmptyStateView()
            MainView()
        } else {
            // شكل السبلاش
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
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .onAppear {
                // بعد ثانيتين غيّر المتغير
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    isFinished = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}

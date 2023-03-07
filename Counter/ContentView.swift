//
//  ContentView.swift
//  Counter
//
//  Created by 出口楓真 on 2023/03/06.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var counter = Counter()

    var body: some View {
        VStack {

            Button("+") {
                counter.plus()
            }
            .font(.system(size: 50))

            Text("\(counter.number)")
                .padding(.vertical, 50)
                .font(.largeTitle)
                .foregroundColor(Color(UIColor(named: "TextColor")!))

            Button("-") {
                counter.minus()
            }
            .font(.system(size: 50))

            Button("リセット") {
                counter.reset()
            }
        }
        .frame(width: 500, height: 600)
        .background(.white)
        .gesture(DragGesture(minimumDistance: 5)
            .onEnded { value in
                withAnimation {
                    if value.translation.height < -100 {
                        counter.plus()
                    } else if value.translation.height > 100 {
                        counter.minus()
                    }
                }

        })


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class Counter: ObservableObject {

    @Published var number: Int = 0

    func plus() {
        number += 1
    }

    func minus() {
        number -= 1
    }

    func reset() {
        number = 0
    }
}

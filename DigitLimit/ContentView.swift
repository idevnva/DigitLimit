//
//  ContentView.swift
//  DigitLimit
//
//  Created by Vladislav Novoshinskiy on 04.06.2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var number: String = ""
    let digitLimit: Int = 5 //Your limit

    var body: some View {
        VStack {
            //Your TextField
            TextField("Number", text: $number)
            .onReceive(Just(number)) { _ in limitDigits(digitLimit) }
            .keyboardType(.numberPad)
        }
        .padding()
    }

    //Function to keep digit count in limits
    func limitDigits(_ upper: Int) {
        let digitsOnly = number.filter { $0.isNumber }
        if digitsOnly.count > upper {
            number = String(digitsOnly.prefix(upper))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

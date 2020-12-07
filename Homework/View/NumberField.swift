//
//  NumberField.swift
//  Homework
//
//  Created by Vsevolod Pavlovskyi on 06.12.2020.
//

import SwiftUI
import Combine

struct NumberField: View {
    @Binding var input: String
    
    var body: some View {
        TextField(input, text: $input)
            .padding()
            .keyboardType(.numberPad)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            .onReceive(Just(input)) { newValue in
                let filteredInput = newValue.filter {
                    "0123456789".contains($0)
                }
                if filteredInput != newValue {
                    input = filteredInput
                }
            }
    }
}

struct NumberField_Previews: PreviewProvider {
    static var previews: some View {
        NumberField(input: .constant("5"))
    }
}

//
//  PiNumber.swift
//  Homework
//
//  Created by Vsevolod Pavlovskyi on 06.12.2020.
//

import SwiftUI

struct PiNumber: View {
    
    @State private var input = "5"
    
    var ordinal: String {
        switch input {
        case "1":
            return "st"
        case "2":
            return "nd"
        case "3":
            return "rd"
        default:
            return "th"
        }
    }
    
    var result: String {
        String(
            Int(floor(Double.pi * pow(10, Double(input) ?? 0)).truncatingRemainder(dividingBy: 10))
        )
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 25)
            {
                VStack(alignment: .leading) {
                    Text("Code").font(.title2)
                    CodeView(code:
                        """
                        // This code can return nth digit of pi counting from '3' and works with Double precision.

                        Int(floor(Double.pi * pow(10, Double(input) ?? 0)).truncatingRemainder(dividingBy: 10))
                        """
                    )
                }
                
                VStack(alignment: .leading) {
                    Text("Example").font(.title2).padding(.bottom, 10)

                    Text("Enter number")
                    HStack {
                        NumberField(input: $input)

                        Button("Done") {
                            self.hideKeyboard()
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("\(Int(input) ?? 0)\(ordinal) digit of π").font(.title2).padding(.bottom, 10)
                    
                    Text(result)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarTitle("Pi digits")
    }
}

struct PiNumber_Previews: PreviewProvider {
    static var previews: some View {
        PiNumber()
    }
}


extension Double {
    func getDigit(digit: Double) -> Int{
        let power = Int(pow(10, (digit-1)))
        return (Int(self) / power) % 10
    }
}

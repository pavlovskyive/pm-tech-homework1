//
//  FactorialIteration.swift
//  Homework
//
//  Created by Vsevolod Pavlovskyi on 06.12.2020.
//

import SwiftUI
import Combine

struct FactorialIteration: View {
    
    @State private var input = "5"
    
    func factorial(of number: UInt64) -> UInt64 {
        // UInt64 factorial threshold is 21!
        // If number >= 21 app will crash
        guard number < 21 else {
            return 0
        }
        
        switch number {
        case 0, 1:
            return 1
        default:
            var factorial: UInt64 = 1
            for i in 1...number {
                factorial *= i
            }
            return factorial
        }
    }
    
    var result: String {
        input + "! = " + String(factorial(of: UInt64(input) ?? 0))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 25)
            {
                VStack(alignment: .leading) {
                    Text("Code").font(.title2)
                    CodeView(code:
                                """
                                func factorial(of number: UInt64) -> UInt64 {
                                    switch number {
                                    case 0, 1:
                                        return 1
                                    default:
                                        var factorial: UInt64 = 1
                                        for i in 1...number {
                                            factorial *= i
                                        }
                                        return factorial
                                    }
                                }
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
                    Text("Result").font(.title2).padding(.bottom, 10)
                    
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
        .navigationBarTitle("Factorial: Iteration")
    }
}

struct FactorialIteration_Previews: PreviewProvider {
    static var previews: some View {
        FactorialIteration()
    }
}

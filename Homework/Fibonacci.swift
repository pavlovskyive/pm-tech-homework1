//
//  Fibonacci.swift
//  Homework
//
//  Created by Vsevolod Pavlovskyi on 06.12.2020.
//

import SwiftUI
import Combine

struct Fibonacci: View {
    
    @State private var input = "5"
    
    func fibonacci(till number: UInt64) -> [UInt64] {
        
        // 95th fibonacci number overflows UInt64
        guard number < 95 else {
            return []
        }
        
        switch number {
        case 0:
            return []
        case 1:
            return [0]
        default:
            var array: [UInt64] = [0, 1]
            while array.count < number {
                array.append(array[array.count - 1] + array[array.count - 2])
            }
            return array
        }
    }
    
    var result: String {
        fibonacci(till: UInt64(input) ?? 0)
            .map { String($0) }
            .joined(separator: ", ")
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 25)
            {
                VStack(alignment: .leading) {
                    Text("Code").font(.title2)
                    CodeView(code:
                                """
                                func fibonacci(till number: UInt64) -> [UInt64] {
                                    switch number {
                                    case 0:
                                        return []
                                    case 1:
                                        return [0]
                                    default:
                                        var array: [UInt64] = [0, 1]
                                        while array.count < number {
                                            array.append(array[array.count - 1] + array[array.count - 2])
                                        }
                                        return array
                                    }
                                }
                                """
                             , size: 12)
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
                    Text("First \(input) fibonacci numbers").font(.title2).padding(.bottom, 10)
                    
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
        .navigationBarTitle("Fibonacci Sequence")
    }
}

struct Fibonacci_Previews: PreviewProvider {
    static var previews: some View {
        Fibonacci()
    }
}

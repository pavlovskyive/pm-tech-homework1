//
//  ContentView.swift
//  Homework
//
//  Created by Vsevolod Pavlovskyi on 06.12.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: FactorialRecursion()) {
                    Text("Factorial: Recursion")
                }
                NavigationLink(destination: FactorialIteration()) {
                    Text("Factorial: Iteration")
                }
                NavigationLink(destination: Fibonacci()) {
                    Text("Fibonacci")
                }
                NavigationLink(destination: PiNumber()) {
                    Text("Pi digits")
                }
            }
            .padding(.vertical)
            .navigationBarTitle("Homework")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

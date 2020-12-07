//
//  Extensions.swift
//  Homework
//
//  Created by Vsevolod Pavlovskyi on 07.12.2020.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

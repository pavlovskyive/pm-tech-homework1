//
//  CodeView.swift
//  Homework
//
//  Created by Vsevolod Pavlovskyi on 06.12.2020.
//

import SwiftUI

struct CodeView: View {
    var code = ""
    var size: CGFloat = 15
    
    var body: some View {
        Text(code)
        .font(.system(size: size, weight: .bold, design: .monospaced))
        .foregroundColor(.white)
        .padding(25)
        .background(Color.blue)
        .cornerRadius(15)
    }
}

struct CodeView_Previews: PreviewProvider {
    static var previews: some View {
        CodeView(code:
                    """
                    func factorial(of number: UInt) -> UInt {
                        switch number {
                        case 0, 1:
                            return 1
                        default:
                            return number * factorial(of: number - 1)
                        }
                    }
                    """
                 , size: 15)
    }
}

//
//  ContentView.swift
//  Calculator
//
//  Created by Student on 6.05.21.
//

import SwiftUI

struct ContentView: View {
    let btnText = [
        ["AC", "+/-", "%", "/"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ",", "MR", "="]
    ]
    let btnColorNames = [
        ["colorDarkGray", "colorDarkGray", "colorDarkGray", "colorOrange"],
        ["colorLightGray", "colorLightGray", "colorLightGray", "colorOrange"],
        ["colorLightGray", "colorLightGray", "colorLightGray", "colorOrange"],
        ["colorLightGray", "colorLightGray", "colorLightGray", "colorOrange"],
        ["colorLightGray", "colorLightGray", "colorLightGray", "colorOrange"]
    ]
    
    var result = "0"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                Spacer()
                Text(result)
                    .font(.system(size: 32))
                    .foregroundColor(Color("colorWhite"))
                    .padding(15)
            }
            ForEach(0..<5) { row in
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 2) {
                    ForEach(0..<4) { col in
                        Button(action: {}) {
                            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                                Text(btnText[row][col])
                            }
                            .background(Color(btnColorNames[row][col]))
                            .cornerRadius(5)
                        }
                        Spacer()
                    }
                }
            }
            .background(Color("colorBlack"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

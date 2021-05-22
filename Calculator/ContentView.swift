//
//  ContentView.swift
//  Calculator
//
//  Created by Dudko Mikhail on 6.05.21.
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
    
    @State var result = "0"
    @State var isOperation = false
    @State var operation: String = ""
    @State var firstOperand: Double = 0
    @State var secondOperand: Double = 0
    func btnClick(text: String) {
        switch text {
            case "0"..."9":
                digitButtonClicked(text)
            case "AC", "MR":
                result = "0"
                firstOperand = 0
                secondOperand = 0
                operation = ""
            case "%":
                result = String((Double(result) ?? 0) / 100)
                isOperation = false
            case "+/-":
                if !Double(result)!.isZero {
                    if (result[result.startIndex] != "-") {
                        result = "-" + result
                    }
                    else {
                        result.removeFirst()
                    }
                }
            case ",":
                if !result.contains(".") {
                    result += "."
                }
            case "=":
                if operation != "" {
                    if isOperation == false {
                        secondOperand = Double(result) ?? 0
                    }
                    executeOperation(operation)
                    isOperation = true

                }
                print("=")
            default:
                if operation == "" {
                    firstOperand = Double(result) ?? 0
                }
                else {
                    if !isOperation {
                        secondOperand = Double(result) ?? 0
                        executeOperation(operation)
                    }
                }
                isOperation = true
                operation = text
        }
    }
    
    func digitButtonClicked(_ text: String) {
        if result == "0" || isOperation {
            result = text
            isOperation = false
        }
        else if (result.count < 11) {
            result += text
        }
        
    }
    
    func executeOperation(_ operation: String) {
//        print("first: \(self.firstOperand)")
//        print("second: \(self.secondOperand)")
        switch operation {
            case "+":
                firstOperand += secondOperand
            case "-":
                firstOperand -= secondOperand
            case "/":
                firstOperand /= secondOperand
            case "x":
                firstOperand *= secondOperand
            default:
                print("impossible")
        }
        if firstOperand.isEqual(to: Double(Int(firstOperand))) {
            result = String(Int(firstOperand))
        }
        else {
            result = String(firstOperand)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                Spacer()
                Text(result)
                    .font(.system(size: 32))
                    .foregroundColor(Color("colorWhite"))
                    .padding(15)
                    .padding()
                    
            }
            ForEach(0..<5) { row in
                HStack(alignment: .center, spacing: 2) {
                    ForEach(0..<4) { col in
                        Button(action: {self.btnClick(text: self.btnText[row][col])}) {
                            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                                Spacer()
                                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                                    Spacer()
                                    Text(btnText[row][col])
                                        .foregroundColor(Color("colorBlack"))
                                    Spacer()
                                        
                                }
                                Spacer()
                             }
                            .background(Color(btnColorNames[row][col]))
                            .cornerRadius(5)
                            .font(.system(size: 22))

                        }
                    }
                }
            }
        }
        .background(Color("colorBlack"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

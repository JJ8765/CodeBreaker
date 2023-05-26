//
//  ContentView.swift
//  FinalGame
//
//  Created by Jaden Lin on 5/8/23.
//
import SwiftUI

struct Guess {
    let code: String
    let result: String
}

struct ContentView: View {
    @State private var enteredCode: String = ""
    @State private var showAlert = false
    @State private var showingPopover = false
    @State private var guesses: [Guess] = []
    @State private var code: String = ""
    @State private var showingPopover1 = false
    
    let correctDigit = "🟩"
    let misplacedDigit = "🟦"
    let incorrectDigit = "🟥"
    
    private var generatedCode: String {
        let firstDigit = Int.random(in: 0...9)
        let secondDigit = Int.random(in: 0...9)
        let thirdDigit = Int.random(in: 0...9)
        let fourthDigit = Int.random(in: 0...9)
        
        return String(firstDigit) + String(secondDigit) + String(thirdDigit) + String(fourthDigit)
    }
    
    
    private func generateCode() {
        code = generatedCode
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    showingPopover1 = true
                } label: {
                    Image(systemName: "questionmark.circle.fill")
                }
            }
            .padding()
            .popover(isPresented: $showingPopover1) {
                VStack{
                    Text("How To Play:")
                        .font(.system(size: 33))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("Guess the 4 digit combination")
                        .font(.system(size: 25))
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("Colors will appear after each attempt")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .padding()

                VStack(alignment: .leading){
                    Text("🟩 = Correct Digit in the Correct Place")
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Text("🟦 = A Digit You Entered Goes Here")
                        .multilineTextAlignment(.leading)
                        .padding()
                    Text("🟥 = Incorrect Digit")
                        .multilineTextAlignment(.leading)
                        .padding()
                    Text("Normal Mode:\nThe Colors Correspond With Each Digit")
                        .font(.headline)
                        .padding()
                    Text("Hard Mode:\nThe Colors Are Correct But Misordered")
                        .font(.headline)
                        .padding()
                }
                
            }
            Text("Number: \(enteredCode)")
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
                .font(.system(size: 50))
            Text("Guesses:")
                .padding()
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
                .font(.system(size: 33))
            
            ForEach(guesses.indices, id: \.self) { index in
                HStack {
                    Spacer()
                    Text("\(guesses[index].code):")
                        .frame(width: 50, alignment: .leading)
                    Text("\(guesses[index].result)")
                        .frame(width: 100, alignment: .leading)
                    Spacer()
                }
                .padding(.bottom, 5)
            }
            Spacer()
            
            HStack {
                Button("1") {
                    appendNumber("1")
                }.padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                Button("2") {
                    appendNumber("2")
                }.padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                Button("3") {
                    appendNumber("3")
                }.padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            HStack {
                Button("4") {
                    appendNumber("4")
                }.padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                Button("5") {
                    appendNumber("5")
                }.padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                Button("6") {
                    appendNumber("6")
                }.padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            HStack {
                Button("7") {
                    appendNumber("7")
                }.padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                Button("8") {
                    appendNumber("8")
                }.padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                Button("9") {
                    appendNumber("9")
                }.padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            HStack {
                Button("Check") {
                    if enteredCode.count == 4 {
                        let newResult = GameLogic1(enteredCode: enteredCode, code: code)
                        let isCorrect = enteredCode == code
                        let guess = Guess(code: enteredCode, result: newResult)
                        
                        if isCorrect {
                            guesses.append(guess)
                            showAlert = true
                        } else {
                            guesses.append(guess)
                        }
                        enteredCode = ""}
                }.padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                
                Button("0") {
                    appendNumber("0")
                }.padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                
                Button("Clear") {
                    enteredCode = ""
                }.padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Congrats!"),
                    message: Text("You Found The Code!"),
                    dismissButton: .default(Text("Play Again"), action: {
                        resetGame()
                    })
                )
            }
        }
        .onAppear {
            resetGame()
        }
    }
    
    private func appendNumber(_ number: String) {
        if enteredCode.count < 4 {
            enteredCode += number
        }
    }
    
    private func resetGame() {
        enteredCode = ""
        showAlert = false
        guesses.removeAll()
        
        code = generatedCode
    }
}


func GameLogic1(enteredCode: String, code: String) -> String {
    let correctDigit = "🟩"
    let misplacedDigit = "🟦"
    let incorrectDigit = "🟥"
    
    var result = ""
    
    let guessedCode = Array(enteredCode)
    let password = Array(code)
    
    for i in 0...3 {
        if guessedCode.contains(password[i]) {
            if password[i] == guessedCode[i] {
                result += correctDigit
            } else {
                result += misplacedDigit
            }
        } else {
            result += incorrectDigit
        }
    }
    
    
    // This is to mix up the colors
    // Might Make it too hard though...
    
    var resultArray = Array(result)
    resultArray.shuffle()
    let mixedResult = String(resultArray)
    
    return mixedResult
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


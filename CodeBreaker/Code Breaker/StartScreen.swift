//
//  StartScreen.swift
//  FinalGame
//
//  Created by Jaden Lin on 5/16/23.
//
import SwiftUI

struct StartScreen: View {
    @State private var showingPopover = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 70)
                Text("Code Breaker")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                
                Image("shield")
                    .resizable()
                    .frame(width: 450, height: 480)
                Spacer()
                Button("How To Play?") {
                    showingPopover = true
                }
                .padding()
                .font(.headline)
                .foregroundColor(.black)
                .background(Color.yellow)
                .cornerRadius(10)
                .padding()
                
                HStack{
                    NavigationLink(destination: NormalMode()) {
                        Text("Normal Mode")
                            .font(.headline)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: ContentView()) {
                        Text("Hard Mode")
                            .font(.headline)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
                
                .popover(isPresented: $showingPopover) {
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
            }
            .navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}

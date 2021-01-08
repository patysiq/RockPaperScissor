//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by PATRICIA S SIQUEIRA on 07/01/21.
//

import SwiftUI

struct ContentView: View {
    @State var moviments = ["Rock", "Paper", "Scissors"]
    @State var number = 0
    @State var finalGame = Bool.random()
    @State var index = Int.random(in: 0...2)
    @State var score = 0
    @State var scoreTitle = ""
    @State private var showingScore = false
    @State var times = 0
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 50) {
                Spacer()
                VStack(spacing: 20) {
                    Text("Computer choose:")
                        .foregroundColor(.black)
                        .font(.title2)
                    
                    Text(moviments[index])
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    Text(self.finalGame ? "You're win." : "You're lose.")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }
                VStack (spacing: 20){
                    Text("What do you choose?")
                        .foregroundColor(.black)
                        .font(.title)
                    
                    VStack (spacing: 20) {
                        ForEach(0 ..< 3) { number in
                            Button("\(moviments[number])", action: {
                                choiceTapped(number)
                                self.number = number
                            } )
                        }
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous), style: FillStyle())
                        .foregroundColor(.black)
                        .font(.title)
                        .shadow(color: .blue, radius: 2, y: 10)
                    }
                }
                VStack {
                    Text("Your score is \(score)")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text(times >= 10 ? "Finish the game." : "")
                        .transition(.move(edge: .bottom))
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }
                Spacer()
            }
            
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                askAgain()
                if times >= 10 {
                    score = 0
                }
            })
        }
    }
    
    func choiceTapped(_ number: Int) {
        if index == 0 && finalGame == true && number != 2 {
            scoreTitle = "Wrong"
        } else if index == 0 && finalGame == true && number == 2 {
            scoreTitle = "Correct"
            score += 1
        } else if index == 0 && finalGame == false && number == 1{
            scoreTitle = "Correct"
            score += 1
        } else if index == 0 && finalGame == false && number != 1 {
            scoreTitle = "Wrong"
        }else if index == 1 && finalGame == true && number != 0 {
            scoreTitle = "Wrong"
        } else if index == 1 && finalGame == true && number == 0 {
            scoreTitle = "Correct"
            score += 1
        } else if index == 1 && finalGame == false && number == 2 {
            scoreTitle = "Correct"
            score += 1
        } else if index == 1 && finalGame == false && number != 2 {
            scoreTitle = "Wrong"
        }else if index == 2 && finalGame == true && number != 1 {
            scoreTitle = "Wrong"
        } else if index == 2 && finalGame == true && number == 1 {
            scoreTitle = "Correct"
            score += 1
        } else if index == 2 && finalGame == false && number == 0 {
            scoreTitle = "Correct"
            score += 1
        } else if index == 2 && finalGame == false && number != 0 {
            scoreTitle = "Wrong"
        }else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askAgain() {
        index = Int.random(in: 0...2)
        finalGame = Bool.random()
        
        if times >= 10 {
            scoreTitle = "Finish the game."
            times = 0
        } else {
            times += 1
        }
    }
}
   
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct GameOver: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
    }
}

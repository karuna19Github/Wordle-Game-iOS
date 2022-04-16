//
//  second.swift
//  Slider
//
//  Created by User12 on 2022/4/17.
//

import SwiftUI

struct second: View {
    @Binding var secondview: Bool
    var body: some View {
        GeometryReader { geometry in
        VStack {
            Text("HOW TO PLAY")
                .bold()
                .font(.system(size: 30))
            Text("")
            
            HStack{
                Text("Guess the")
                Text(" WORDLE ")
                    .bold()
                Text("in limited tries.")
            }
            VStack{
            Text("")
            Text("Each guess must be a valid word.")
            Text("Hit the enter button to submit.")
            Text("")
            Text("After each guess, the color of the tiles will change to show how close your guess was to the word.")
            }
            VStack{
            Divider()
                Group {
                                    Text("Examples")
                                        .bold()
                                        .font(.title3)
                                    
                                    HStack {
                                        Text("C")
                                            .bold()
                                            .font(.largeTitle)
                                            .foregroundColor(.white)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .background(Color.green)
                                        Text("A")
                                            .bold()
                                            .font(.largeTitle)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .border(Color.gray, width: 3)
                                        Text("M")
                                            .bold()
                                            .font(.largeTitle)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .border(Color.gray, width: 3)
                                        Text("E")
                                            .bold()
                                            .font(.largeTitle)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .border(Color.gray, width: 3)
                                        Text("L")
                                            .bold()
                                            .font(.largeTitle)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .border(Color.gray, width: 3)
                                    }
                                    
                                    (Text("The letter ") + Text("W").bold() + Text(" is in the word and in the correct spot."))
                                    
                                    HStack {
                                        Text("P")
                                            .bold()
                                            .font(.largeTitle)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .border(Color.gray, width: 3)
                                        Text("U")
                                            .bold()
                                            .font(.largeTitle)
                                            .foregroundColor(.white)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .background(Color.red)
                                        Text("P")
                                            .bold()
                                            .font(.largeTitle)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .border(Color.gray, width: 3)
                                        Text("p")
                                            .bold()
                                            .font(.largeTitle)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .border(Color.gray, width: 3)
                                        Text("Y")
                                            .bold()
                                            .font(.largeTitle)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .border(Color.gray, width: 3)
                                    }
                                    
                                    (Text("The letter ") + Text("I").bold() + Text(" is in the word but in the wrong spot."))
                                    
                                    HStack {
                                        Text("K")
                                            .bold()
                                            .font(.largeTitle)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .border(Color.gray, width: 3)
                                        Text("O")
                                            .bold()
                                            .font(.largeTitle)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .border(Color.gray, width: 3)
                                        Text("A")
                                            .bold()
                                            .font(.largeTitle)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .border(Color.gray, width: 3)
                                        Text("L")
                                            .bold()
                                            .font(.largeTitle)
                                            .foregroundColor(.white)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .background(Color.yellow)
                                        Text("A")
                                            .bold()
                                            .font(.largeTitle)
                                            .frame(width:geometry.size.width/10, height: geometry.size.width/10)
                                            .border(Color.gray, width: 3)
                                    }
                                    
                                    (Text("The letter ") + Text("U").bold() + Text(" is not in the word in any spot."))
                                    
            Divider()
            }
            
        }.padding(20)
    }
        }
    }
}

struct second_Previews: PreviewProvider {
    static var previews: some View {
        second(secondview: .constant(true))
    }
}

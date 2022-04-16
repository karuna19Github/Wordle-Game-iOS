//
//  games.swift
//  Slider
//
//  Created by User12 on 2022/4/16.
//

import SwiftUI

struct games: View {
    
    
    @State private var secondview = false
    @State var scale: Double = 4
    @State var numbers = [NumberData]()
    @State var result_color: String = ""
    @State var keyboard = [[String]]()
    @State var keyboard_color = [[Color]]()
    @State var start = 0
    @State var finishedrow = 0
    @State var nowindex = 0
    @State var answer: String = ""
    @State var showAlert = false
    @State var alertTitle = ""
    @State var win: Int = 0
    @State var guesstime: Int = 5
    @State private var showResultView = false
    @State var lose: Int = 0 //戰敗為2,勝利為1
    @Binding var showgames: Bool
    func ReadFile(scale: Int){
        if (scale == 4){
            if let asset = NSDataAsset(name: "four"),
               let content = String(data: asset.data, encoding: .utf8){
                let array = content.split(separator: "\n")
                let num = Int.random(in: 0...(array.count - 1))
                answer = String(array[num])
            }
        }
        else if (scale == 5){
            if let asset = NSDataAsset(name: "five"),
               let content = String(data: asset.data, encoding: .utf8){
                let array = content.split(separator: "\n")
                let num = Int.random(in: 0...(array.count - 1))
                answer = String(array[num])
            }
        }
        else if (scale == 6){
            if let asset = NSDataAsset(name: "six"),
               let content = String(data: asset.data, encoding: .utf8){
                let array = content.split(separator: "\n")
                let num = Int.random(in: 0...(array.count - 1))
                answer = String(array[num])
            }
        }
    }
    
    //初始化格子
    func InitialNumbers(){
        numbers = []
        result_color = ""
        for _ in 1...Int(scale)*guesstime{
            let number = ""
            numbers.append(NumberData(value: number))
        }
    }
    
    //更新格子
    func UpdateNumbers(){
        numbers = []
        result_color = ""
        for _ in 1...Int(scale)*guesstime{
            let number = ""
            numbers.append(NumberData(value: number))
        }
    }
    
    //初始化鍵
    func InitialKeyboard(){
        keyboard = []
        keyboard_color = []
        finishedrow = 0
        nowindex = 0
        lose = 0
        keyboard.append(["Q","W","E","R","T","Y","U","I","O","P"])
        keyboard_color.append([Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white])
        keyboard.append(["A","S","D","F","G","H","J","K","L"])
        
        keyboard_color.append([Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white])
        keyboard.append(["ENTER","Z","X","C","V","B","N","M","<-"])
        
        keyboard_color.append([Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white])
    }
    
    func UpdateGuess(guess: Int){
        guesstime = guess
    }
    //填上文字
    func WriteChar(w:String)->(){
        //AudioServicesPlaySystemSound(1026)
        if nowindex % Int(scale) != (Int(scale) - 1){
            numbers[nowindex].value = w
            nowindex += 1
        }
        
        else{
            numbers[nowindex].value = w
        }
        
    }
    
    func EnterJudge(){
        if nowindex % Int(scale) == (Int(scale) - 1) && numbers[nowindex].value != "" && lose == 0{
            finishedrow += 1
            nowindex += 1
            var correct: Int = 0
            for i in nowindex-Int(scale)..<nowindex{
                var co: Int = 0
                for index in answer.indices{
                    if numbers[i].value == String(answer[index]){
                        numbers[i].color = .yellow
                        if i % Int(scale) == co{
                            numbers[i].color = .green
                            correct += 1
                            break
                        }
                    }
                    co += 1
                    if co == Int(scale) && numbers[i].color == .gray{
                        numbers[i].color = .red
                    }
                }
                for j in 0..<keyboard_color.count{
                    for k in 0..<keyboard_color[j].count{
                        if keyboard[j][k] == numbers[i].value{
                            if keyboard_color[j][k] != .green && keyboard_color[j][k] != .red{
                                keyboard_color[j][k] = numbers[i].color
                            }
                        }
                    }
                }
            }
            if correct == Int(scale){
                //顯示勝利
                //showAlert = true
                //alertTitle = "correct"
                for i in 0..<Int(scale)*guesstime{
                    if numbers[i].color == Color.yellow{
                        result_color += "2"
                    }
                    else if numbers[i].color == Color.green{
                        result_color += "1"
                    }
                    else {
                        result_color += "0"
                    }
                }
                lose = 1
                win += 1
            }
            else if finishedrow == guesstime{
                //showAlert = true
                for i in 0..<Int(scale)*guesstime{
                    if numbers[i].color == Color.yellow{
                        result_color += "2"
                    }
                    else if numbers[i].color == Color.green{
                        result_color += "1"
                    }
                    else {
                        result_color += "0"
                    }
                }
                lose = 2
                //alertTitle = "answer is \(answer)"
            }
            else{
                var exp:Int = 0
                for i in nowindex-Int(scale)..<nowindex{
                    if numbers[i].color == .red{
                        exp += 1
                    }
                }
                if exp == Int(scale){
                    showAlert = true
                    alertTitle = "not in word list"
                }
            }
        }
        else{
            showAlert = true
            alertTitle = "Not enough letters"
        }
    }
    //刪除
    func BackSpace(){
        if nowindex % Int(scale) != 0{
            numbers[nowindex].value = ""
            nowindex -= 1
        }
        else{
            numbers[nowindex].value = ""
        }
    }
    
    var body: some View {
        ZStack {
            Image("awan")
                .resizable()
            //.scaledToFill()
            
            VStack{
                ScrollView {
                    VStack(spacing:30){
                        HStack(spacing:30){
                            
                            Button(action: {showgames = false}, label: {
                                
                                Image("home")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20,height:30)
                                
                            })
                         
                            Button(action: {secondview = true}, label: {
                                Image(systemName: "questionmark.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20,height:30)
                                
                            })
                            .sheet(isPresented: $secondview) {
                            second(secondview: $secondview)
                            }
                           
                            
                        }
                       
                        
                        HStack{
                            Text("Letter \(Int(scale))")
                                .padding(.bottom,-15)
                            Slider(value: $scale, in: 4...6, step: 1)
                                .frame(width: 300.0)
                                .onChange(of: scale, perform: {
                                    value in UpdateNumbers()
                                } )
                        }
                        HStack{
                            Button(action: {
                                    if guesstime < 5 || guesstime > 1{
                                        guesstime = 5
                                        InitialNumbers()
                                        InitialKeyboard()
                                        ReadFile(scale: Int(scale))
                                        start = 1
                                    }}, label: {
                                        
                                        ZStack{
                                            
                                            RoundedRectangle(cornerRadius: 30)
                                                .frame(width: 50, height: 50)
                                            Text("Easy")
                                                //.font(.largeTitle)
                                                .foregroundColor(.black)
                                        }
                                        
                                    })
                            Button(action: {
                                    if guesstime <= 2 || guesstime > 4{
                                        guesstime = 3
                                        InitialNumbers()
                                        InitialKeyboard()
                                        ReadFile(scale: Int(scale))
                                        start = 1
                                    }}, label: {
                                        
                                        ZStack{
                                            
                                            RoundedRectangle(cornerRadius: 30)
                                                .frame(width: 50, height: 50)
                                            Text("Medium")
                                                //.font(.largeTitle)
                                                .foregroundColor(.black)
                                        }
                                        
                                    })
                            Button(action: {
                                    if guesstime > 2{
                                        guesstime = 2
                                        InitialNumbers()
                                        InitialKeyboard()
                                        ReadFile(scale: Int(scale))
                                        start = 1
                                    }}, label: {
                                        
                                        ZStack{
                                            
                                            RoundedRectangle(cornerRadius: 30)
                                                .frame(width: 50, height: 50)
                                            Text("Hard")
                                                //.font(.largeTitle)
                                                .foregroundColor(.black)
                                        }
                                        
                                    })
                            Button(action: {
                                var co = 0
                                for index in answer.indices{
                                    if co == nowindex{
                                        WriteChar(w: String(answer[index]))
                                        break
                                    }
                                    co += 1
                                }
                            }, label: {
                                
                                ZStack{
                                    
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: 50, height: 50)
                                    Text("Plz")
                                        //.font(.largeTitle)
                                        .foregroundColor(.black)
                                }
                                
                            })
                            
                        }
                        ZStack{
                            let columns = Array(repeating: GridItem(), count: Int(scale))
                            LazyVGrid(columns: columns){
                                ForEach(numbers){number in
                                    ZStack{
                                        Rectangle()
                                            .foregroundColor(number.color)
                                            .frame(height: 50)
                                            .padding(5)
                                        Text("\(number.value)")
                                    }
                                }
                            }
                            .alert(isPresented: $showAlert, content: {
                                Alert(title: Text(alertTitle))
                            })
                            
                            if lose == 1{
                                Button("CORRECT"){
                                    showResultView = true
                                }
                                .font(.largeTitle)
                                .fullScreenCover(isPresented: $showResultView, content:{ResultView(showResultView: $showResultView,result_color:$result_color,lose:$lose,scale:$scale)})
                            }
                            else if lose == 2{
                                Button("LOSE"){
                                    showResultView = true
                                }
                                .font(.largeTitle)
                                .fullScreenCover(isPresented: $showResultView, content:{ResultView(showResultView: $showResultView,result_color:$result_color,lose:$lose,scale:$scale)})
                            }
                        }
                        
                        //Text("\(Int(numbers.count))")
                        .padding()
                        if start == 1{
                            VStack{
                                ForEach(0..<3){i in
                                    HStack{
                                        ForEach(0..<keyboard[i].count){ j in
                                            if (i == 2 && j == 0 || i == 2 && j == 8){
                                                ZStack{
                                                    Rectangle().frame(width: 52, height: 30)
                                                        .foregroundColor(.white)
                                                        .onTapGesture{
                                                            if(i==2 && j == 0){
                                                                EnterJudge()
                                                            }
                                                            else{
                                                                BackSpace()
                                                            }
                                                        }
                                                    Text(keyboard[i][j])
                                                }
                                            }
                                            else{
                                                ZStack{
                                                    Rectangle().frame(width: 30, height: 30)
                                                        .foregroundColor(keyboard_color[i][j])
                                                        .onTapGesture{ WriteChar(w:keyboard[i][j])}
                                                    Text(keyboard[i][j])
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                }
            }
            
        }
    }
    
}

struct games_Previews: PreviewProvider {
    static var previews: some View {
        games(showgames : .constant(true))
        //games(showgames: $showgames ,start :$start)
        
    }
}

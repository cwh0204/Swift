//
//  ContentView.swift
//  Acalculator_1
//
//  Created by 최원효 on 2023/07/07.
//

import SwiftUI
enum ButtonType:String{
    case a0,a1, a2, a3, a4, a5, b1, b2, b3,b4,b5
    case c1, c2, c3, c4, c5 ,c6
    case d1, d2, d3
    
    var ButtonDisplayName: String{
        switch self{
        case .b3 :
            return "1"
        case .b4 :
            return "2"
        case .b5 :
            return "3"
        case .c1 :
            return "+"
        case .c2 :
            return "4"
        case .c3 :
            return "5"
        case .c4:
            return "6"
        case .c5:
            return "-"
        case .d1:
            return "7"
        case .d2:
            return "8"
        case .d3:
            return "9"
        case .c6:
            return "X"
        case .a4:
            return "0"
        case .a5:
            return "0"
        case .b1:
            return "."
        case .b2 :
            return "="
        case .a0 :
            return "C"
        case .a1 :
            return "/"
        case .a2 :
            return "%"
        case .a3 :
            return "$"
        }
    }
    var backgroungColor: Color{
        switch self {
        case .a0,.a1,.a2 :
            return Color.gray
        case .a3,.c6,.c5,.c1,.b2 :
            return Color.orange
        case .d1,.d2,.d3,.c2,.c3,.c4,.b3,.b4,.b5
            ,.a4,.a5,.b1 :
            return Color("Numbtn")
        }
    }
    var forgroundColor: Color{
        switch self {
        case .a0,.a1,.a2 :
            return Color.black
        case .d1,.d2,.d3,.c2,.c3,.c4,.b3,.b4,.b5
            ,.a4,.a5,.b1,.a3,.c6,.c5,.c1,.b2 :
            return Color.white
        }
    }
}
struct ContentView: View {
    @State private var num: String = "0"
    @State var tempNum: Int = 0
    @State var operatorType: ButtonType = .c1
    
    private let buttonData: [[ButtonType]] = [
        [.a0,.a1,.a2,.a3],
        [.d1,.d2,.d3,.c6],
        [.c2,.c3,.c4,.c5],
        [.b3,.b4,.b5,.c1],
        [.a4,.b1,.b2]
    ]
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Spacer()
                HStack{
                Text(num)
                        .padding()
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }
                ForEach(buttonData, id: \.self){
                    line in
                    HStack{
                    ForEach(line, id: \.self){
                        item in Button{
                            if num == "0"{
                                
                                if item == .a0 {
                                    num = "0"
                                } else if item == .a3 ||
                                          item == .c6 ||
                                          item == .c5 ||
                                          item == .c1{
                                    num = "Error"
                                }
                                else{
                                    num = item.ButtonDisplayName
                                }
                            }else{
                                if item == .a0 {
                                    num = "0"
                                }else if item == .c1{
                                    tempNum = Int(num) ?? 0
                                    operatorType = .c1
                                    num = "0"
                                    //숫자 저장
                                    // 더하기
                                    //남은 숫자 초기화
                            
                                }else if item == .c6{
                                    tempNum = Int(num) ?? 0
                                    operatorType = .c6
                                    num = "0"
                                    //숫자 저장
                                    // 곱하기
                                    //남은 숫자 초기화
                                }
                                else if item == .c5{
                                    tempNum = Int(num) ?? 0
                                    operatorType = .c5
                                    num = "0"
                                    //숫자 저장
                                    // 빼기
                                    //남은 숫자 초기화
                                }
                                else if item == .b2 {
                                    if operatorType == .c1 {
                                        num = String((Int(num) ?? 0) + tempNum)
                                    }
                                    else if operatorType == .c6{
                                        num = String((Int(num) ?? 0) * tempNum)
                                    }else if operatorType == .c5{
                                        num = String(tempNum - (Int(num) ?? 0))
                                    }
                                }
                                else {
                                    num += item.ButtonDisplayName
                            }
                        }


                        } label: {
                            Text(item.ButtonDisplayName)
                                .frame(width: item == .some(.a4) ? 125:60, height: 60)
                                .background(item.backgroungColor)
                                .cornerRadius(30)
                                .foregroundColor(item.forgroundColor)
                                .font(.system(size: 40))
                        }

                    }
                    }
                }

            }
    }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

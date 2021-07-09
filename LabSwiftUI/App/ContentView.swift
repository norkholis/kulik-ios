//
//  ContentView.swift
//  LabSwiftUI
//
//  Created by Moch. Nor Kholis on 15/11/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var homePresenter: HomePresenter
    
    var body: some View {
        NavigationView {
            HomeView(presenter: homePresenter)
        }
    }
}

//enum CalculatorButton: String {
//    case zero, one, two, three, four, five, six, seven, eight, nine
//    case desimal
//    case equal, plus, minus, multiply, devide
//    case ac, minOrPlus, percent
//
//    var backgroundColor: Color {
//        switch self {
//        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
//            return Color(.darkGray)
//        case .devide, .multiply, .minus, .plus, .equal:
//            return Color(.orange)
//        default:
//            return Color(.lightGray)
//        }
//    }
//
//    var title: String {
//        switch self {
//        case .zero: return "0"
//        case .one: return "1"
//        case .two: return "2"
//        case .three: return "3"
//        case .four: return "4"
//        case .five: return "5"
//        case .six: return "6"
//        case .seven: return "7"
//        case .eight: return "8"
//        case .nine: return "9"
//        case .multiply: return "X"
//        case .plus: return "+"
//        case .minus: return "-"
//        case .ac: return "AC"
//        case .minOrPlus: return "+/-"
//        case .devide: return "/"
//        case .percent: return "%"
//        case .equal: return "="
//        default:
//            return "."
//        }
//    }
//}
//
//class GlobalEnvironment: ObservableObject {
//    @Published var display = "0"
//
//    func receiveInput(button: CalculatorButton) {
//        display = button.title
//    }
//}
//
//struct ContentView: View {
//
//    @EnvironmentObject var env: GlobalEnvironment
//
//    let buttons: [[CalculatorButton]] = [
//        [.ac, .minOrPlus, .percent, .devide],
//        [.seven, .eight, .nine, .multiply],
//        [.four, .five, .six, .minus],
//        [.one, .two, .three, .plus],
//        [.zero, .desimal, .equal]
//    ]
//
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//
//            VStack(spacing: 12) {
//                HStack {
//                    Spacer()
//                    Text(env.display)
//                        .foregroundColor(.white)
//                        .font(.system(size: 64))
//                }.padding()
//
//                ForEach(buttons, id: \.self) { row in
//                    HStack(spacing: 12) {
//                        ForEach(row, id: \.self) { button in
//
//                            Button(action: {
//
//                                env.receiveInput(button: button)
//
//                            }, label: {
//                                Text(button.title)
//                                    .font(.system(size: 32))
//                                    .frame(width: buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5 * 12) / 4)
//                                    .foregroundColor(.white)
//                                    .background(button.backgroundColor)
//                                    .cornerRadius(buttonWidth(button: button))
//                            })
//
//                        }
//                    }
//                }
//            }.padding(.bottom)
//        }
//    }
//
//    private func buttonWidth(button: CalculatorButton) -> CGFloat {
//        if button == .zero {
//            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
//        }
//        return (UIScreen.main.bounds.width - 5 * 12) / 4
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environmentObject(GlobalEnvironment())
//    }
//}

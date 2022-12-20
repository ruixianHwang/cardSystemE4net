//
//  Any1ItemView.swift
//  example
//
//  Created by net e4 on 2022/12/19.
//

import SwiftUI

//Any1View 가 있고 거기 안에 들어가므로 이름 따라가기
struct Any1ItemView: View {
    //상수로 담아줌
    let item: Any1Model
    
    var body: some View {
        ZStack(alignment: .center){
            Button(action: {
                print("itme.label : \(item.label)  item.id: \(item.id)")
            }){
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white)
                    .overlay(
                        VStack{
                            //이렇게 쓰려고 Any1Model에서 identifiable써줬나
                            Text(item.id)
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding(.bottom, 10)
                            Text(item.label)
                                .foregroundColor(.black)
                        }
                    )
                    .shadow(color: .gray, radius: 2, x: CGFloat(2), y: CGFloat(2))
            }
        }
        .frame(height:72)
    }
}

struct Any1ItemView_Previews: PreviewProvider {
    static var previews: some View {
        Any1ItemView(item: Any1Model(id:"", label: ""))
    }
}

// swiftUI => mvvm 패턴 써보기

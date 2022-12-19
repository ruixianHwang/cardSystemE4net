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
        VStack{
            //이렇게 쓰려고 Any1Model에서 identifiable써줬나
            Text(item.id)
            Text(item.label)
        }
    }
}

struct Any1ItemView_Previews: PreviewProvider {
    static var previews: some View {
        Any1ItemView(item: Any1Model(id:"", label: ""))
    }
}

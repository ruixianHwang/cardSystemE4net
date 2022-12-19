//
//  ContentView.swift
//  example
//
//  Created by net e4 on 2022/12/19.
//

import SwiftUI

struct ContentView: View {
    
    //최초로 쓸 거니까, 즉, 밑에서 쓰려면 여기에서 생성자 만들어줘야한다.
    
    @StateObject var navModel = NavModel()
    
    //zstack }.padding지움
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                //navView  갔다가 넘겨줄꺼임(navModel) => menu나오는 거 구현
                NavView(navModel : navModel)
                    .frame(width: width, height: height)
                //menuviw 슬라이딩 같은거
                MenuView(navModel :navModel)
                    .frame(width:width)
                    .offset(x: navModel.isShowMenu ? 0 : -width)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

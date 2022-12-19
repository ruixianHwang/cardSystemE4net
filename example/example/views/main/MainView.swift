//
//  MainView.swift
//  example
//
//  Created by net e4 on 2022/12/19.
//

import SwiftUI

//화면 안 보이면 canvas 클릭한 다음 기다리기
//이거 footer처럼 쓰임
struct MainView: View {
    
    //따로 밑에서 NavModel = NavModel() 이런거 안해주면 다른 화면에서 그려준다고 보면 된다 => contentView
    @ObservedObject var navModel : NavModel
    //클릭했을 때
    var body: some View {
        TabView {
            
            Any1View()
                .tabItem{
                    Label("Any1",systemImage:"house")
                }
            Any2View()
                .tabItem{
                    Label("Any2",systemImage:"bag")
                }
        }
        .navigationBarTitle("EXAMPLE", displayMode:
                                    .inline)
        .navigationBarItems(
            leading:
                Button(action: {
                withAnimation{
                    navModel.isShowMenu.toggle()
                }
            }){
                Image(systemName: "line.horizontal.3")
                    .foregroundColor(Color.blue)
                    .imageScale(.large)
            },
            trailing:
                Button(action:{
                    withAnimation{
                        print("click trailing")
                    }
                }){
                    Image(systemName:"gearshape")
                        .foregroundColor(Color.blue)
                        .imageScale(.large)
                }
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(navModel: NavModel())   //navmodel하면 오류남.. 왜지? 받아올 때 생성자로 받아야하나보다
    }
}

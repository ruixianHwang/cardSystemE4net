//
//  MenuView.swift
//  example
//
//  Created by net e4 on 2022/12/19.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var navModel : NavModel
    
    //@StateObject 해주면 나중에 변경되었을 떄 자동으로 적용된다.
    let menuModelList : [MenuModel] = [
        MenuModel(systemName: "person", title: "Profile"),
        MenuModel(systemName: "envelope", title: "Messages"),
        MenuModel(systemName: "gear", title: "setting")
    ] 

    var body: some View {
        NavigationView{
            ZStack{
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading){
                        Divider().background(Color(.white))
                        //top Padding이라 Menu랑 오버랩됨
                            .padding(.top,100)
//                        MenuModel(systemName: "person", title: "Profile")
//                        MenuModel(systemName: "envelope", title: "Messages")
//                        MenuModel(systemName: "gear", title: "setting")
//
                        ForEach(Array(menuModelList.enumerated()),
                                id:\.offset) { i, menuModel in
                            MenuItemView(menuModel : menuModel)
                        }
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color.blue)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Menu", displayMode: .inline)
            .navigationBarItems(
                leading:
                    Button(action: {
                        withAnimation{
                            navModel.isShowMenu.toggle()
                        }
                    }){
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                    }
            )
        }
    }
}

//sf-symbols

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(navModel :NavModel())
    }
}

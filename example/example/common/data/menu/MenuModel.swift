//
//  MenuModel.swift
//  example
//
//  Created by net e4 on 2022/12/20.
//

import SwiftUI

struct MenuModel :View{
    
    var systemName : String
    var title: String
    
    var body: some View {
        HStack {
            // 이거는 여기화면에서만 변하는데 어차피 MenuView에서는 안 변하는데 무슨 의미가 있나..
            Image(systemName: systemName)
                .foregroundColor(.white)
                .imageScale(.large)
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
        }
        .padding(.leading, 10)
        Divider().background(Color(.white))
    }
}

struct MenuModel_Previews: PreviewProvider {
    static var previews: some View {
        MenuModel(systemName: "person", title: "Profile")
    }
}

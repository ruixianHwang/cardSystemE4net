//
//  NavuView.swift
//  example
//
//  Created by net e4 on 2022/12/19.
//

import SwiftUI

//navView가 있어야 intent가능
struct NavView: View {
    
    @ObservedObject var navModel : NavModel
    
    var body: some View {
        NavigationView{
            MainView(navModel: navModel)
        }
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView(navModel :NavModel())
    }
}


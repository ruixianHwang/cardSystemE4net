//
//  NavModel.swift
//  example
//
//  Created by net e4 on 2022/12/19.
//

import Foundation

//관찰대상이 되겠다 선언 , 값이 바뀌면 따른 곳에서 알아차릴 수 있으
class NavModel: ObservableObject{
    @Published var isShowMenu = false
}

//
//  ResAny1.swift
//  example
//
//  Created by net e4 on 2022/12/19.
//

import Foundation

//responseEntity vo 로 해서 code, message 이런거 따로 하는게 원래는 맞다

//원래는 제네릭으로 받는다고 하셨느데 어떻게 하더라..
struct ResAny1: Decodable {
    var items: [Any1Model]
    var hasMorePages: Bool
}



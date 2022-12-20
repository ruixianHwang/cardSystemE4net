//
//  HttpClient.swift
//  example
//
//  Created by net e4 on 2022/12/20.
//

import Foundation
import Alamofire

class HttpClient<T: Decodable> : ObservableObject {
    
    
    //useEffect 랑 같다고 볼 수 있다.
    //들어오는 인자가 t 이면 success
    typealias onSuccess = (T) -> ()
    typealias onFailure = () -> ()
    
    let headers: HTTPHeaders = [
        //요청할때 어떤 형태로 줘라(json)
        .accept("application/json"),
        //응답할 때 서버에 이런 형태로 던져라
        .contentType("application/json")
    ]
    
    func alamofireNetworking(url: String, onSuccess :@escaping onSuccess , onFailure: @escaping onFailure) {
        print("alamofireNetworking(url: \(url)")
        print("alamofireNetworking")
       
        
//        pId pPw  => 회원가입할 때
//        guard let pId = Id else {
//    alert("아이디가 일치하지 않습니다.")
//    return 적는지는 모르겠다...
//    }
                
        //nill 아니면 return 해서 탈출
        guard let sessionUrl = URL(string: url)else{
            print("Invalid URL")
            return
        }
        
        print("sessionURL : \(sessionUrl)")
        AF.request(sessionUrl,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self){ response in
                print("response: \(response)")
                switch response.result {
                case .success(let value):
                    onSuccess(value)
                case .failure(let error):
                    print(error)
                    onFailure()
                }
            }
    }
    
    //이거 예시임
//    func regUser(){
//        //userInfo에서 가져오기
//        getJoinUrl()
//    }
    
    
    
    
    
}

//pacakage, bundle, module  용어 익숙해지기 = 찾아보기

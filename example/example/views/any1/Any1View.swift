//
//  any1.swift
//  example
//
//  Created by net e4 on 2022/12/19.
//

import SwiftUI

struct Any1View: View {
    
    @ObservedObject var pageModel = PageModel()
    @State var any1ItemList :[Any1Model] = []
    @State var showingAlert = false
    //위의 Bool은 false가 default라서 안 써도 되고, 써도 된다.
    
    
    var body: some View {
        
        //한글만 남기고 나중에 다시 swift로 써보기 - 연습
        //구글링 할 때도 http libarary in swift => 여러개 검색 적어도 3개는 보자
        //중요한거는 통신을 어떻게 하느냐, 클래스 하나 가지고 어떻게 유용하게 다 쓸수 있는지 재사용 가능하게 코드를 작성하자.
        
        //GeometryReader 라는 struct에 클로저로 geometry 라는 함수를 받으면
        GeometryReader { geometry in
            //let으로 columns라는 변수명에 [GridItem]형으로 [GridItem()]생성해서
            let columns: [GridItem] = [GridItem()]
            //View 형인 ScroollView 에 인자값으로 .vertical , showsIndicators 는 false로 생성하여
            ScrollView(.vertical, showsIndicators: false){
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(Array(any1ItemList.enumerated()), id:\.offset){ i, item in
                        Any1ItemView(item: item)
                            .onAppear(){
                                if(pageModel.maxCnt < i + 1){
                                    pageModel.maxCnt = i + 1
                                    if(pageModel.maxCnt % 10 == 0){
                                        tryLoadItem()
                                    }
                                }
                            }
                    }
                }
            }.onAppear(){
                print("onAppear")
                tryLoadItem()
            }
        }
        .alert("네트워크 통신 오류", isPresented: $showingAlert){
            Button("재시도", role: .cancel){
                loadItems()
            }
            Button("취소", role: .destructive){
                pageModel.current -= 1
            }
        }message : {
            Text("네트워크가 원활하지 않습니다. 재요청 하시겠습니까?")
        }
    }
    
    func tryLoadItem(){
        if(pageModel.hasMorePages){
            pageModel.current += 1
            loadItems()
        }
    }
    
    func loadItems(){
        print("loadItems")
        //안드로이드의 retrofit 역할을 함
        //        HttpClient<ResAny1>().alamofireNetworking(
        //            url: URLInfo.getItemListUrl(currentPage: pageModel.current),
        //            onSuccess: { (resData) in
        //                print("resData : \(resData)")
        //                pageModel.hasMorePages = resData.hasMorePages
        //                let loadItems = resData.items
        //                loadItems.forEach{ loadItem in
        //                    print("loadItem : \(loadItem)")
        //                    any1ItemList.append(loadItem)
        //                }
        //            },
        //            onFailure: {
        //                showingAlert = true
        //            }
        //        )
    }
}
struct Any1View_Previews: PreviewProvider {
    static var previews: some View {
        //위에 초기화가 되어있으므로 안에 비어져있어도 된다.
        Any1View()
    }
}

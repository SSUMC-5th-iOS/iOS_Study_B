//
//  FeedDataManager.swift
//  iOS_Study_B
//
//  Created by 정민지 on 11/29/23.
//

import Alamofire

class FeedDataManager {
    func feedDataManager(_ parameters: FeedAPIInput, _ viewController: HomeViewController) {
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable (of: [FeedModel].self) {response in
            switch response.result {
            case .success(let result):
                viewController.sucessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

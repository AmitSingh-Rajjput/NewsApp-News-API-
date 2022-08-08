//
//  WebServices.swift
//  NewsApp(With API)
//
//  Created by Amit Kumar Singh on 08/08/22.
//

import Foundation

class WebServices {
    
    func getArticles(url:URL,completion:@escaping ([NewsModel]?)->()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                print(String(data: data, encoding: .utf8) as Any)
                let articleList = try? JSONDecoder().decode(NewsModelList.self, from: data)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
}

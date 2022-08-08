//
//  NewsModel.swift
//  NewsApp(With API)
//
//  Created by Amit Kumar Singh on 08/08/22.
//

import Foundation
import UIKit

struct NewsModelList: Decodable {
    let articles: [NewsModel]?
}

struct NewsModel: Decodable {
    let title: String?
    let articleDescription: String?
    let urlToImage:String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case articleDescription = "description"
        case urlToImage
    }
}

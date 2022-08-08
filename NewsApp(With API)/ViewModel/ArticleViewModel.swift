//
//  ArticleViewModel.swift
//  NewsApp(With API)
//
//  Created by Amit Kumar Singh on 08/08/22.
//

import Foundation
import UIKit

struct NewsModelListViewModel {
    let articles : [NewsModel]
}

extension NewsModelListViewModel {
    var articleSection: Int{
        return 1
    }
    
    func numberOfRowInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index:Int) -> NewsModelViewModel {
        let article = self.articles[index]
        return NewsModelViewModel(article)
    }
}

struct NewsModelViewModel {
    private let article: NewsModel
}

extension NewsModelViewModel {
    init(_ article: NewsModel) {
        self.article = article
    }
}

extension NewsModelViewModel {
    var title : String {
        return self.article.title ?? "No Title"
    }
    
    var articleDescription : String {
        return self.article.articleDescription ?? "No Description"
    }
    
    var urlToImage : String {
        return self.article.urlToImage ?? "None"
    }
}

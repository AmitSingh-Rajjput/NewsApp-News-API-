//
//  NewsListTableVC.swift
//  NewsApp(With API)
//
//  Created by Amit Kumar Singh on 08/08/22.
//

import UIKit

class NewsListTableVC: UITableViewController {
    
    private var articleListVM:NewsModelListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lightGray
        
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance

        
        
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=05e919107079457b9590d1dbac33cdda")!
        WebServices().getArticles(url:url) { articles in
            if let articles = articles {
                self.articleListVM = NewsModelListViewModel(articles: articles)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.articleListVM == nil ? 0 : self.articleListVM.articleSection
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.articleListVM.numberOfRowInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell",for :indexPath) as? NewsTableViewCell   else {
            fatalError("Could Not found!!")
        }
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        let url = URL(string: articleVM.urlToImage)!

        DispatchQueue.global().async {
                // Fetch Image Data
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        // Create Image and Update Image View
                        cell.imageOfNews.image = UIImage(data: data)
                    }
                }
            }
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.articleDescription
        return cell
    }
}

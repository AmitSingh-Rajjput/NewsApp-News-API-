//
//  NewsTableViewCell.swift
//  NewsApp(With API)
//
//  Created by Amit Kumar Singh on 08/08/22.
//

import Foundation
import UIKit

class NewsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    @IBOutlet weak var imageOfNews:UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        descriptionLabel.text = ""
        imageOfNews.image = UIImage()
    }
    
}


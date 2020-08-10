//
//  RepositoryDetailsTableViewCell.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/3/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoryDetailsTableViewCell: UITableViewCell {
    
    static let identifier = "RepositoryDetailsTableViewCell"

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    
    var makeSeeUserInfoAction: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = Color.white.value
        self.avatarImageView.layer.cornerRadius = 20
        self.repoNameLabel?.font = Font(.installed(.regular), size: .standard(.h2)).instance
        self.repoNameLabel.textColor = Color.black.value
        
        let recognizeravatarImageView = UITapGestureRecognizer(target: self, action: #selector(userInfoTouched(_:)))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(recognizeravatarImageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(item: Item) {
        
        avatarImageView.sd_setImage(with: URL(string: (item.owner?.avatarURL) ?? ""), placeholderImage: UIImage(named: "GitHub"))
        repoNameLabel.text = item.name
    }
    
    @IBAction func userInfoTouched(_ sender: Any) {
        makeSeeUserInfoAction?()
    }
}

//
//  ArticleTableViewCell.swift
//  VRGSoftTestApp
//
//  Created by Stanislav on 24.02.2021.
//

import UIKit

protocol ArticleTableViewCellProtocol {
    func didTapFavoritesButton(cell: ArticleTableViewCell)
}
class ArticleTableViewCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addFaforitesButton: UIButton!
    
    private let articleStorageModel = ArticleStorageModel()
    
    var delegate: ArticleTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func tapFavoritesButton(_ sender: UIButton) {
        animationButton(button: addFaforitesButton)
        delegate?.didTapFavoritesButton(cell: self)
    }
}

extension ArticleTableViewCell {
    func animationButton(button: UIButton) {
        UIView.animate(withDuration: 0.2,
                       animations: {
                        button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.2) {
                            button.transform = CGAffineTransform.identity
                        }
                       })
    }
}

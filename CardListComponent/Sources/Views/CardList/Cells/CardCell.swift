//
//  CardCell.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/14/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet var content: UIView!
    
    var identifier: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
        subtitleLabel.text = nil
        descriptionLabel.text = nil
        thumbnail.image = nil
    }
    
    func provide(formatter: CardListDataFormattable, data: CardListDataObject) {
        identifier = data.id
        
        titleLabel.text = formatter.formatTitle(for: data)
        subtitleLabel.text = data.subtitle
        descriptionLabel.text = data.description
        
        let bundle = Bundle(for: CardCell.self)
        let image = data.thumbnail ?? UIImage(named: "noPhoto", in: bundle, compatibleWith: nil)
        thumbnail.image = image
    }
    
}

// MARK: - Private methods

private extension CardCell {
    
    func setup() {
        thumbnail.layer.cornerRadius = 4.0
        thumbnail.clipsToBounds = true
    }
    
}

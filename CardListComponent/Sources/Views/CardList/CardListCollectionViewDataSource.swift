//
//  CardListCollectionViewDataSource.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/20/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

class CardListCollectionViewDataSource: NSObject {
    
    fileprivate var presenter: CardListComponentPresentation
    fileprivate var cardListSections: CardListSections
    
    init(presenter: CardListComponentPresentation, cardListSections: CardListSections) {
        self.presenter = presenter
        self.cardListSections = cardListSections
    }
    
}

extension CardListCollectionViewDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.dataSource.cardListDataObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = cardListSections.row(at: indexPath)
        let cellInfo = row.info
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellInfo.cellType.rawValue, for: indexPath)
        
        switch cellInfo.cellType {
        case .card:
            guard let cardCell = cell as? CardCell else { return cell }
            cardCell.configure(cellInfo.dataObject)
            return cardCell
        }
    }
    
}

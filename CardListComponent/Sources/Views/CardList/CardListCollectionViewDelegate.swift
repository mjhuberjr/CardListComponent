//
//  CardListCollectionViewDelegate.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/20/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation
import UIKit

class CardListCollectionViewDelegate: NSObject, CardListEvents {
    
    var interactor: CardListInteraction
    var cardSelected: CardListEventClosure?
    
    init(interactor: CardListInteraction, cardListConfiguration: CardListConfigurable) {
        self.interactor = interactor
        
        let cardListEvents = cardListConfiguration.cardListEvents
        self.cardSelected = cardListEvents.cardSelected
        
        super.init()
    }
    
}

extension CardListCollectionViewDelegate: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = collectionView.cellForItem(at: indexPath) as! CardCell
        if let identifier = item.identifier {
            cardSelected?(identifier)
        }
    }
    
}

extension CardListCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width
        let height: CGFloat = 360.0
        return CGSize(width: width, height: height)
    }
    
}

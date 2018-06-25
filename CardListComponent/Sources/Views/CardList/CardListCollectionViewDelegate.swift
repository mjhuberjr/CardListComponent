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
    var didScrollFromTop: CardListScrollEventClosure?
    var didScrollToTop: CardListScrollEventClosure?
    
    init(interactor: CardListInteraction, cardListConfiguration: CardListConfigurable) {
        self.interactor = interactor
        
        let cardListEvents = cardListConfiguration.cardListEvents
        self.cardSelected = cardListEvents.cardSelected
        self.didScrollFromTop = cardListEvents.didScrollFromTop
        self.didScrollToTop = cardListEvents.didScrollToTop
        
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
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offset = scrollView.contentOffset
        offset.y <= 0 ? didScrollToTop?() : didScrollFromTop?()
    }
    
}

extension CardListCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width
        let height: CGFloat = 360.0
        return CGSize(width: width, height: height)
    }
    
}

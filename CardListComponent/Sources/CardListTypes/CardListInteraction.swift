//
//  CardListInteraction.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/14/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

protocol CardListInteraction: class {
    
    func focus(on identifier: CardIdentifier)
    
}

class CardListInteractor {
    
    var presenter: CardListComponentPresentation
    var collectionView: UICollectionView
    
    init(presenter: CardListComponentPresentation, collectionView: UICollectionView) {
        self.presenter = presenter
        self.collectionView = collectionView
    }
    
}

extension CardListInteractor: CardListInteraction {
    
    func focus(on identifier: CardIdentifier) {
        let data = presenter.dataSource.data
        var object: CardListDataObject?
        var index = -1
        // Have to find the index of the dataSource because a protocol cannot currently conform to Equatable and still use polymorphism.
        for (idx, obj) in data.enumerated() {
            if obj.id == identifier {
                object = obj
                index = idx
                break
            }
        }
        guard index != -1 else { fatalError("That object doesn't exist therefore should not be selectable.") }
        presenter.selectedObject = object
        
        let indexPath = IndexPath(row: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
}

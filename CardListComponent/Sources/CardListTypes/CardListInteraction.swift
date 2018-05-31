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
    
    private func getDirection() -> UICollectionViewScrollPosition {
        let direction = presenter.configuration.type
        switch direction {
        case .horizontal:
            return .left
        case .vertical:
            return .top
        }
    }
    
    func focus(on identifier: CardIdentifier) {
        let data = presenter.dataSource.cardListDataObjects
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
        let direction = getDirection()
        collectionView.scrollToItem(at: indexPath, at: direction, animated: true)
    }
    
    func deselect() {
        presenter.selectedObject = nil
        
        let indexPath = IndexPath(row: 0, section: 0)
        let direction = getDirection()
        collectionView.scrollToItem(at: indexPath, at: direction, animated: true)
    }
    
}

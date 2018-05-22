//
//  CardListCollectionViewDelegate.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/20/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

class CardListCollectionViewDelegate: NSObject, CardListEvents {
    
    
}

extension CardListCollectionViewDelegate: UICollectionViewDelegate {
    

    
}

extension CardListCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width
        let height: CGFloat = 360.0
        return CGSize(width: width, height: height)
    }
    
}

//
//  CardListCollectionView.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/14/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import UIKit

class CardListCollectionView: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    fileprivate var dataSource: CardListCollectionViewDataSource
    fileprivate var delegate: CardListCollectionViewDelegate
    
    init(dataSource: CardListCollectionViewDataSource, delegate: CardListCollectionViewDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: Bundle(for: CardListCollectionView.self))
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
    }
    
}

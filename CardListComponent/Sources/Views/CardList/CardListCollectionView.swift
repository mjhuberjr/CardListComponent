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
    
    fileprivate var dataSource: CardListCollectionViewDataSource!
    fileprivate var delegate: CardListCollectionViewDelegate!
    
    init() {
        super.init(nibName: nil, bundle: Bundle(for: CardListCollectionView.self))
    }
    
    func provide(dataSource: CardListCollectionViewDataSource, delegate: CardListCollectionViewDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        
        setupCollectionView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        registerCells()
    }
    
}

// MARK: - Private methods

private extension CardListCollectionView {
    
    func setupCollectionView() {
        collectionView.backgroundColor = .clear
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
    }
    
    func registerCells() {
        let nib = UINib(nibName: "CardCell", bundle: Bundle(for: CardCell.self))
        collectionView.register(nib, forCellWithReuseIdentifier: "CardCell")
    }
    
}

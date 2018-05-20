//
//  CardListViewController.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/14/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

class CardListViewController: UIViewController {
    
    private var presenter: CardListComponentPresentation
    
    init(presenter: CardListComponentPresentation) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: Bundle(for: CardListViewController.self))
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
}

// MARK: - Private methods

private extension CardListViewController {
    
    func setupCollectionView() {
        let dataSource = presenter.dataSource
        let cardListSections = CardListSections(dataSource: dataSource)
        let collectionDataSource = CardListCollectionViewDataSource(presenter: presenter, cardListSections: cardListSections)
        let collectionDelegate = CardListCollectionViewDelegate()
        let collectionViewController = CardListCollectionView(dataSource: collectionDataSource, delegate: collectionDelegate)
        embed(collectionViewController)
    }
    
}

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
    var interactor: CardListInteraction!
    var collectionViewController: CardListCollectionView!
    
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
        
        view.backgroundColor = .clear
        
        setupCollectionView()
        setupInteractor()
    }
    
}

// MARK: - Private methods

private extension CardListViewController {
    
    func setupCollectionView() {
        let dataSource = presenter.dataSource
        let cardListSections = CardListSections(dataSource: dataSource)
        let collectionDataSource = CardListCollectionViewDataSource(presenter: presenter, cardListSections: cardListSections)
        let collectionDelegate = CardListCollectionViewDelegate()
        collectionViewController = CardListCollectionView(dataSource: collectionDataSource, delegate: collectionDelegate)
        let padding = presenter.configuration.padding
        embed(collectionViewController, with: padding)
    }
    
    func setupInteractor() {
        guard let collectionView = collectionViewController.collectionView else { fatalError("No collectionView set, something is seriously wrong") }
        let interactor = CardListInteractor(presenter: presenter, collectionView: collectionView)
        self.interactor = interactor
    }
    
}

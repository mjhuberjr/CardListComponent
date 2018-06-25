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
        
        setupCollectionView(with: false)
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        roundTopCorners(view: view)
    }
    
}

// MARK: - Private methods

private extension CardListCollectionView {
    
    func setupCollectionView(with transparency: Bool) {
        collectionView.backgroundColor = transparency ? .clear : .white
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
    }
    
    func roundTopCorners(view: UIView) {
        let maskPath1 = UIBezierPath(roundedRect: view.bounds,
                                     byRoundingCorners: [.topLeft , .topRight],
                                     cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = view.bounds
        maskLayer1.path = maskPath1.cgPath
        view.layer.mask = maskLayer1
    }
    
    func registerCells() {
        let nib = UINib(nibName: "CardCell", bundle: Bundle(for: CardCell.self))
        collectionView.register(nib, forCellWithReuseIdentifier: "CardCell")
    }
    
}

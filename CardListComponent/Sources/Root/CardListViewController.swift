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
    
}

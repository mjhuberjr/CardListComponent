//
//  CardListCoordinator.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/14/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

public protocol CardListComponentCoordination: class {
    
    func cardListComponentViewController() -> UIViewController
    
    // MARK: - Interactions
    func scrollTo(_ identifier: String)
    func disableScrolling()
    func enableScrolling()
    
}

// MARK: - Default implementations if not passed in from consumer of CardListComponent

class CardListFormattableImpl: CardListDataFormattable { init() { } }
class CardListConfigurableImpl: CardListConfigurable { init() { } }

public class CardListComponentCoordinator: CardListComponentCoordination {
    
    fileprivate let rootViewController: CardListViewController
    fileprivate var interactor: CardListInteraction? {
        if rootViewController.isViewLoaded {
            return rootViewController.interactor
        }
        return nil
    }
    
    public init(dataSource: CardListDataSource?, dataFormattable: CardListDataFormattable? = nil, cardListConfigurable: CardListConfigurable? = nil) {
        let dataFormatter = dataFormattable ?? CardListFormattableImpl()
        let cardListConfiguration = cardListConfigurable ?? CardListConfigurableImpl()
        let dataSource = dataSource ?? PrototypeData()
        let presenter = CardListPresenter(dataSource: dataSource, dataFormatter: dataFormatter, configuration: cardListConfiguration)
        rootViewController = CardListViewController(presenter: presenter)
    }
    
    public func cardListComponentViewController() -> UIViewController {
        return rootViewController
    }
    
}

// MARK: - CardList Interactions

extension CardListComponentCoordinator {
    
    public func scrollTo(_ identifier: String) {
        interactor?.focus(on: identifier)
    }
    
    public func disableScrolling() {
        interactor?.disableScrolling()
    }
    
    public func enableScrolling() {
        interactor?.enableScrolling()
    }
    
}

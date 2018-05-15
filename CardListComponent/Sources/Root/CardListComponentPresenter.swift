//
//  CardListComponentPresenter.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/14/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

protocol CardListComponentPresentation: class {
    
    var dataSource: CardListDataSource { get }
    var dataFormatter: CardListDataFormattable { get }
    var configuration: CardListConfigurable { get }
    
}

class CardListPresenter: CardListComponentPresentation {
    
    var dataSource: CardListDataSource
    var dataFormatter: CardListDataFormattable
    var configuration: CardListConfigurable
    
    init(dataSource: CardListDataSource, dataFormatter: CardListDataFormattable, configuration: CardListConfigurable) {
        self.dataSource = dataSource
        self.dataFormatter = dataFormatter
        self.configuration = configuration
    }
    
}

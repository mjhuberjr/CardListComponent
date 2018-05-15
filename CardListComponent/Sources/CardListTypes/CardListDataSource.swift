//
//  CardListDataSource.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/14/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

public protocol CardListDataSource {
    
    var data: [CardListDataObject] { get }
    
}

public protocol CardListDataObject {
    
    var id: String { get }
    var title: String? { get }
    var subtitle: String? { get }
    
}

class PrototypeData: CardListDataSource {
    
    var data: [CardListDataObject]
    
    init() {
        data = []
    }
    
}

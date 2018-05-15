//
//  CardListDataFormattable.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/14/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

public protocol CardListDataFormattable {
    
    func formatTitle(for object: CardListDataObject) -> String?
    
}

extension CardListDataFormattable {
    
    func formatTitle(for object: CardListDataObject) -> String? { return object.title }
    
}

//
//  CardListEvents.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/14/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

public protocol CardListEvents {
    
    var cardSelected: CardListEventClosure? { get }
    
}

extension CardListEvents {
    
    var cardSelected: CardListEventClosure? { return nil }
    
}

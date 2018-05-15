//
//  CardListConfigurable.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/14/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

public enum CardListDirection {
    case vertical
    case horizontal
}

class CardListEventsImpl: CardListEvents { init() { } }

public protocol CardListConfigurable {
    
    var cardListEvents: CardListEvents { get }
    var type: CardListDirection { get }
    
}

extension CardListConfigurable {
    
    var cardListEvents: CardListEvents { return CardListEventsImpl() }
    var type: CardListDirection { return .vertical }
    
}

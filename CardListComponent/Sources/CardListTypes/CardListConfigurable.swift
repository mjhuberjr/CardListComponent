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
    var padding: UIEdgeInsets { get }
    var isScrollingEnabled: Bool { get }
    
}

extension CardListConfigurable {
    
    var cardListEvents: CardListEvents { return CardListEventsImpl() }
    var type: CardListDirection { return .vertical }
    var padding: UIEdgeInsets { return UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0) }
    var isScrollingEnabled: Bool { return false }
    
}

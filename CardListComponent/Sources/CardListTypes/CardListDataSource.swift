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
    var description: String? { get }
    var thumbnail: UIImage? { get }
    
}

class PrototypeData: CardListDataSource {
    
    var data: [CardListDataObject]
    
    struct PrototypeObject: CardListDataObject {
        var id: String
        var title: String?
        var subtitle: String?
        var description: String?
        var thumbnail: UIImage?
        
        init(id: String, title: String? = nil, subtitle: String? = nil, description: String? = nil, thumbnail: UIImage? = nil) {
            self.id = id
            self.title = title
            self.subtitle = subtitle
            self.description = description
            self.thumbnail = thumbnail
        }
    }
    
    init() {
        let object1 = PrototypeObject(id: "1", title: "4300", subtitle: "123 E. Main Street, Somewhere, UT", description: "3 bed • 2 bath • 1,675 sqft")
        let object2 = PrototypeObject(id: "2", title: "2700", subtitle: "456 E. Main Street, Somewhere, UT", description: "4 bed • 2 bath • 1,945 sqft")
        let object3 = PrototypeObject(id: "3", title: "3500", subtitle: "789 E. Main Street, Somewhere, UT", description: "2 bed • 2 bath • 3,675 sqft")
        let object4 = PrototypeObject(id: "4", title: "3700", subtitle: "147 E. Main Street, Somewhere, UT", description: "5 bed • 2 bath • 2,675 sqft")
        data = [object1, object2, object3, object4]
    }
    
}

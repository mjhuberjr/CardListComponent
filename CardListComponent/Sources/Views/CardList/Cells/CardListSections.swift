//
//  CardListSections.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/20/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

struct CardListSections {
    
    enum CellType: String {
        case card = "CardCell"
    }
    
    enum Row {
        case property(CardListDataObject)
        
        struct Info {
            var dataObject: CardListDataObject
            var cellType: CellType
            
            init(dataObject: CardListDataObject, type: CellType) {
                self.dataObject = dataObject
                self.cellType = type
            }
        }
        
        var info: Info {
            switch self {
            case .property(let property):
                return Info(dataObject: property, type: .card)
            }
        }
    }
    
    enum Section: Int {
        case propertyList
        
        func rows(dataSource: CardListDataSource) -> [Row] {
            var rows: [Row] = []
            for object in dataSource.data {
                rows.append(.property(object))
            }
            return rows
        }
    }
    
    // MARK: - Sections
    
    private var dataSource: CardListDataSource
    private var sections: [Section] = []
    
    init(dataSource: CardListDataSource) {
        self.dataSource = dataSource
        configureRows()
    }
    
    func section(at index: Int) -> Section {
        return sections[index]
    }
    
    func row(at indexPath: IndexPath) -> Row {
        let section = self.section(at: indexPath.section)
        return section.rows(dataSource: dataSource)[indexPath.row]
    }
    
}

// MARK: - Private methods

private extension CardListSections {
    
    mutating func configureRows() {
        let section: Section = .propertyList
        sections = [section]
    }
    
}

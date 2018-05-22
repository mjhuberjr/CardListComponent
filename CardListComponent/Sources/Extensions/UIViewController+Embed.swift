//
//  UIViewController+Embed.swift
//  CardListComponent
//
//  Created by Michael J. Huber Jr. on 5/20/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

extension UIViewController {
    
    func embed(_ vc: UIViewController) {
        addChildViewController(vc)
        vc.didMove(toParentViewController: self)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vc.view)
        
        pinConstraints(vc.view)
    }
    
    private func pinConstraints(_ view: UIView) {
        view.pinToEdges(of: self.view)
    }
    
}

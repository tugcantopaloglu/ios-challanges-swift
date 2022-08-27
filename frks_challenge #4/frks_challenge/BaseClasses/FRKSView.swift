//
//  FRKSView.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 17.08.2022.
//

import UIKit

@IBDesignable
class FRKSView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyShadow()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyShadow()
    }
    
    
    private func applyShadow(){
        self.layer.cornerRadius = 10
        self.backgroundColor = .purple
    }
}

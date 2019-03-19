//
//  PigeonView.swift
//  CarrerPigeon
//
//  Created by Régis Melgaço de Andrade on 19/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import UIKit

class PigeonView: UIView {

    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("PigeonView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }

}
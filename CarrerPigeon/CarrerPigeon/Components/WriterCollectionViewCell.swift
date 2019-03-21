//
//  WriterCollectionViewCell.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 20/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import UIKit

class WriterCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		self.layer.cornerRadius = 10
		self.layer.masksToBounds = true
    }

}

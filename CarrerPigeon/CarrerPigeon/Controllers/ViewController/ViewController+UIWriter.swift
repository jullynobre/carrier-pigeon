//
//  ViewController+UIWriter.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 17/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UIWriter {
	
	func isBoxFull() -> Bool {
		return true
	}
	
	func increaseBoxMessagesCounter(quantity: Int) {
		boxView.addToBox(quantity: 1)
	}
	
    func updateWriter(writerIndex: Int) {
        self.writersView.collectionView.reloadItems(at: [IndexPath(row: writerIndex, section: 0)])
    }
}

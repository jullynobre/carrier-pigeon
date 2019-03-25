//
//  WriterViewControllerProtocol.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 16/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

protocol UIWriter {
    
	func isBoxFull() -> Bool
	func increaseBoxMessagesCounter(quantity: Int)
    
    func updateWriter(writerIndex: Int)
}

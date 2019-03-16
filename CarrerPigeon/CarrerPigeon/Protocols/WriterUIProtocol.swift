//
//  WriterViewControllerProtocol.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 16/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

protocol WriterUI {
	
	func updateWriterToWaitingState()
	func updateWriterToWritingState()
	func updateWriterToPuttingMessagesIntoBox()
	
	func getBoxMessagesCounter() -> Int
	func decreaseBoxMessagesCounter(quantity: Int)
	
}

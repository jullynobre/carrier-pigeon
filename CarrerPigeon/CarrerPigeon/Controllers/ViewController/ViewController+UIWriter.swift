//
//  ViewController+UIWriter.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 17/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

extension ViewController: UIWriter {
	
	func updateWriterToWaitingState() {
		print("W Waiting")
	}
	
	func updateWriterToWritingState() {
		print("W Writing")
	}
	
	func updateWriterToPuttingMessagesIntoBox() {
		print("W Putting messages into box")
	}
	
	func isBoxFull() -> Bool {
		return true
	}
	
	func increaseBoxMessagesCounter(quantity: Int) {
		print(quantity)
	}
	
	
}

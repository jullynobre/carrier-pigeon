//
//  UserThread.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 14/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

class Writer {
	
	let id: String
	
	let boxMessages: DispatchSemaphore
	let boxCapacity: DispatchSemaphore
	
	let timeToWrite: Int
	
	var isFired = false
	
	let thread = DispatchQueue.global()
	
	init (boxMessagesSemaphore: DispatchSemaphore,
		 boxCapacitySemaphore: DispatchSemaphore,
		 timeToWrite: Int,
		 id: String) {
		
		self.boxMessages = boxMessagesSemaphore
		self.boxCapacity = boxCapacitySemaphore
		self.timeToWrite = timeToWrite
		self.id = id
	}
	
	func run (viewController: UIWriter) {
		thread.async {
			while(!self.isFired) {
				
				if(viewController.isBoxFull()) {
					viewController.updateWriterToWaitingState()
				}
				
				self.boxCapacity.wait()
                
				let endWrintig = Date().addingTimeInterval(Double(self.timeToWrite))
                
				viewController.updateWriterToWritingState()
				viewController.increaseBoxMessagesCounter(quantity: 1)
                
                while (Date() < endWrintig) {sleep(1)}
                
				self.boxMessages.signal()
				
				viewController.updateWriterToPuttingMessagesIntoBox()
				
			}
		}
	}
	
	func dismissWriter() {
		self.isFired = true
	}
}

//
//  UserThread.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 14/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

class Writer {
	let boxMessages: DispatchSemaphore
	let boxCapacity: DispatchSemaphore
	
	let timeToWrite: Int
	
	var isFired = false
	
	let thread = DispatchQueue.global()
	
	init (boxMessagesSemaphore: DispatchSemaphore,
		 boxCapacitySemaphore: DispatchSemaphore,
		 timeToWrite: Int) {
		
		self.boxMessages = boxMessagesSemaphore
		self.boxCapacity = boxCapacitySemaphore
		self.timeToWrite = timeToWrite
	}
	
	func run (viewController: UIWriter) {
		thread.async {
			while(!self.isFired) {
				
				if(viewController.isBoxFull()) {
					viewController.updateWriterToWaitingState()
				}
				
				self.boxCapacity.wait()
				//calcuar timer final para escrever
				viewController.updateWriterToWritingState()
				viewController.increaseBoxMessagesCounter(quantity: 1)
				//verificar timer e esperar caso necessario
				self.boxMessages.signal()
				
				viewController.updateWriterToPuttingMessagesIntoBox()
				
			}
		}
	}
	
	func dismissWriter() {
		self.isFired = true
	}
}

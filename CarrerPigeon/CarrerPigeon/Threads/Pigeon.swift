//
//  PigeonThread.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 14/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

class Pigeon {
	let boxMessages: DispatchSemaphore
	let boxCapacity: DispatchSemaphore
	
	let capacity: Int
	
	let timeToLoad: Int
	let timeToTravel: Int
	let timeToUnload: Int
	
	var isFree = false
	
	let thread = DispatchQueue.global()
	
	init (boxMessagesSemaphore: DispatchSemaphore,
		 boxCapacitySemaphore: DispatchSemaphore,
		 pigeonCapacity: Int,
		 timeToLoad: Int, timeToTravel: Int, timeToUnload: Int) {
		
		self.boxMessages = boxMessagesSemaphore
		self.boxCapacity = boxCapacitySemaphore
		
		self.capacity = pigeonCapacity
		
		self.timeToLoad = timeToLoad
		self.timeToTravel = timeToTravel
		self.timeToUnload = timeToUnload
	
	}
	
	func run (viewController: UIPigeon) {
		thread.async {
			while(!self.isFree) {
				
				if !viewController.boxHas(quantityOfMessages: self.capacity){
					viewController.updatePigeonToWaitingState()
				}
				
				for _ in 1...self.capacity { self.boxMessages.wait() }
                
                var endAction = Date().addingTimeInterval(Double(self.timeToLoad))
                
				viewController.updatePigeonToLoadingState()
				viewController.decreaseBoxMessagesCounter(quantity: self.capacity)
                
                while(Date() < endAction) {sleep(<#T##UInt32#>)}
                
				for _ in 1...self.capacity { self.boxCapacity.signal() }
				
                endAction = Date().addingTimeInterval(Double(self.timeToTravel))
                
				viewController.updatePigeonToFlingState()
                
                while(Date() < endAction){sleep(1)}
				
                endAction = Date().addingTimeInterval(Double(self.timeToUnload))
                
				viewController.updatePigeonToUnloadingState()
				
                while(Date() < endAction) {sleep(1)}
				
				endAction = Date().addingTimeInterval(Double(self.timeToTravel))
                
				viewController.updatePigeonToFlingBackState()
				
                while(Date() < endAction) {sleep(1)}
			}
		}
	}
	
	func releasePigeon() {
		self.isFree = true
	}
}

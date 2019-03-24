//
//  PigeonThread.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 14/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation
import UIKit

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
//                if !viewController.boxHas(quantityOfMessages: self.capacity){
//                    viewController.updatePigeonToWaitingState()
//                }
//
//                for _ in 1...self.capacity { self.boxMessages.wait() }

                var endAction = Date().addingTimeInterval(Double(self.timeToLoad))

                viewController.updatePigeonToLoadingState()
//                viewController.decreaseBoxMessagesCounter(quantity: self.capacity)

                while(Date() < endAction) {}

//                for _ in 1...self.capacity { self.boxCapacity.signal() }
        
                endAction = Date().addingTimeInterval(Double(self.timeToTravel))
                
                viewController.updatePigeonToFlyingState()
                
                while(Date() < endAction){self.flapWings(viewController: viewController)}
				
                endAction = Date().addingTimeInterval(Double(self.timeToUnload))
                
				viewController.updatePigeonToUnloadingState()
			
                while(Date() < endAction) {}
				
				endAction = Date().addingTimeInterval(Double(self.timeToTravel))
                
				viewController.updatePigeonToFlyingBackState()
				
                while(Date() < endAction){self.flapWings(viewController: viewController)}
			}
		}
	}
    
	func releasePigeon() {
		self.isFree = true
	}
    
    func flapWings(viewController: UIPigeon) {
        let timeToFlap = Date().addingTimeInterval(0.2)
        while(Date() < timeToFlap) {}
        
        DispatchQueue.main.async{
            viewController.flapWings()
        }
    }
}

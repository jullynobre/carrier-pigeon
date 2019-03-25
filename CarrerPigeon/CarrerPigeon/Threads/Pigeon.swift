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
	
	let capacity: Int
	
	let timeToLoad: Int
	let timeToTravel: Int
	let timeToUnload: Int
	
	var isFree = false
	
	let thread = DispatchQueue.global()
	
	init (pigeonCapacity: Int,
		 timeToLoad: Int,
		 timeToTravel: Int,
		 timeToUnload: Int) {
		
		self.capacity = pigeonCapacity
		
		self.timeToLoad = timeToLoad
		self.timeToTravel = timeToTravel
		self.timeToUnload = timeToUnload
	}
	
	func run (viewController: UIPigeon) {
        
        DispatchQueue.main.async{
            viewController.flapWings()
        }
        
		thread.async {
			while(!self.isFree) {
                if !viewController.boxHas(quantityOfMessages: self.capacity){
                    viewController.updatePigeonToWaitingState()
                }

                for _ in 1...self.capacity { boxMessagesSemaphore!.wait() }

                var endAction = Date().addingTimeInterval(Double(self.timeToLoad))

                viewController.updatePigeonToLoadingState()
                
                DispatchQueue.main.async {
                    viewController.decreaseBoxMessagesCounter(quantity: self.capacity)
                }

                while(Date() < endAction) {self.stepLabelLoading(viewController: viewController)}

                for _ in 1...self.capacity { boxCapacitySemaphore!.signal() }
        
                endAction = Date().addingTimeInterval(Double(self.timeToTravel))
                
                viewController.updatePigeonToFlyingState()
                
                while(Date() < endAction){self.flapWings(viewController: viewController)}
				
                endAction = Date().addingTimeInterval(Double(self.timeToUnload))
                
				viewController.updatePigeonToUnloadingState()
			
                while(Date() < endAction) {self.stepLabelLoading(viewController: viewController)}
				
				endAction = Date().addingTimeInterval(Double(self.timeToTravel))
                
				viewController.updatePigeonToFlyingBackState()
				
                while(Date() < endAction){self.flapWings(viewController: viewController)}
			}
            DispatchQueue.main.async{
                viewController.updatePigeonToFreeState()
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
    
    func stepLabelLoading(viewController: UIPigeon) {
        let timeToFlap = Date().addingTimeInterval(0.3)
        while(Date() < timeToFlap) {}
        
        DispatchQueue.main.async{
            viewController.stepLabelLoading()
        }
    }
}

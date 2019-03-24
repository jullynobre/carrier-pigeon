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
	
	let timeToWrite: Int
	
	var isFired = false
	
	let thread = DispatchQueue.global()
	
	init (timeToWrite: Int,
		 id: String) {
		
		self.timeToWrite = timeToWrite
		self.id = id
	}
	
	func run (viewController: UIWriter) {
		thread.async {
			while(!self.isFired) {
				
				if(viewController.isBoxFull()) {
					viewController.updateWriterToWaitingState()
				}
				
				//self.boxCapacity.wait()
                
				let endWrintig = Date().addingTimeInterval(Double(self.timeToWrite))
                
				viewController.updateWriterToWritingState()
				viewController.increaseBoxMessagesCounter(quantity: 1)
                
                while (Date() < endWrintig) {self.stepLabelLoading(viewController: viewController)}
                
				//self.boxMessages.signal()
				
				viewController.updateWriterToPuttingMessagesIntoBox()
				
			}
		}
	}
    
    func stepLabelLoading(viewController: UIWriter) {
        let timeToFlap = Date().addingTimeInterval(0.3)
        while(Date() < timeToFlap) {}
        
        DispatchQueue.main.async{
            viewController.stepLabelLoading()
        }
    }
	
	func dismissWriter() {
		self.isFired = true
	}
}

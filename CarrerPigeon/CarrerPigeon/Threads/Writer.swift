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
    
    var statusTextIndex = 0
    let statusTexts = ["DORMINDO", "ESCREVENDO"]
    
    var imageAnimationIndex = 0
    let imagesNames = ["writer-left", "writer-right"]
	
	init (timeToWrite: Int, id: String) {
		self.timeToWrite = timeToWrite
		self.id = id
	}
	
	func run (viewController: UIWriter, writerIndex: Int) {
		thread.async {
			while(!self.isFired) {
                boxCapacitySemaphore!.wait()
                
				let endWrintig = Date().addingTimeInterval(Double(self.timeToWrite))
                
                self.changeStatus(viewController: viewController, writerIndex: writerIndex)
                
                while (Date() < endWrintig) {self.movePencil(viewController: viewController, writerIndex: writerIndex)}
                
                DispatchQueue.main.async {
                    viewController.increaseBoxMessagesCounter(quantity: 1)
                }
                
                boxMessagesSemaphore!.signal()
				
                self.changeStatus(viewController: viewController, writerIndex: writerIndex)
			}
		}
	}
    
    func movePencil(viewController: UIWriter, writerIndex: Int) {
        let timeToMove = Date().addingTimeInterval(0.2)
        while(Date() < timeToMove) {}
        
        imageAnimationIndex = imageAnimationIndex == 0 ? 1:0
        
        DispatchQueue.main.async{
            viewController.updateWriter(writerIndex: writerIndex)
        }
    }
    
    func changeStatus(viewController: UIWriter, writerIndex: Int) {
        statusTextIndex = statusTextIndex == 0 ? 1:0
        
        DispatchQueue.main.async{
            viewController.updateWriter(writerIndex: writerIndex)
        }
    }
	
	func dismissWriter() {
		self.isFired = true
	}
}

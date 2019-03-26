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
    var endJob = false
	
	let thread = DispatchQueue.global()
    
    var statusTextIndex = 0
    let statusTexts = ["DORMINDO", "ESCREVENDO"]
    
    var imageAnimationIndex = 0
    let imagesNames = ["writer-left", "writer-right"]
    
    var writerCellIndex: Int?
	
	init (timeToWrite: Int, id: String) {
		self.timeToWrite = timeToWrite
		self.id = id
	}
	
	func run (viewController: UIWriter, writerIndex: Int) {
        writerCellIndex = writerIndex
		thread.async {
			while(!self.isFired) {
                // Down no semaphoro boxCapacitySemaphore
                boxCapacitySemaphore!.wait()
                // Calcula tempo de termino de escrita
				let endWrintig = Date().addingTimeInterval(Double(self.timeToWrite))
                // Muda estatus do pombo para escrevendo
                self.changeStatus(viewController: viewController, writerIndex: writerIndex)
                // Move lapis enquanto não chegar a hora de terminar escrita
                while (Date() < endWrintig) {self.movePencil(viewController: viewController, writerIndex: writerIndex)}
                // Atualiza interface da caixa
                DispatchQueue.main.async {
                    viewController.increaseBoxMessagesCounter(quantity: 1)
                }
                // Up no semaforo boxMessagesSemaphore
                boxMessagesSemaphore!.signal()
				// Muda Status para dormindo
                self.changeStatus(viewController: viewController, writerIndex: writerIndex)
			}
			
            self.endJob = true
			DispatchQueue.main.async {
				viewController.updateWriter(writerIndex: writerIndex)
			}
		}
	}
    
    func rerun(viewController: UIWriter) {
        isFired = false
        endJob = false
        run(viewController: viewController, writerIndex: writerCellIndex!)
    }
    
    func movePencil(viewController: UIWriter, writerIndex: Int) {
        let timeToMove = Date().addingTimeInterval(0.75)
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
}

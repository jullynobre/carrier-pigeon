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
			
			
			DispatchQueue.main.async {
				viewController.writersView.writers.remove(at: writerIndex)
				viewController.writersView.collectionView.deleteItems(at: [IndexPath(item: writerIndex, section: 0)])
			}
		}
		
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
	
	func dismissWriter() {
		self.isFired = true
	}
}

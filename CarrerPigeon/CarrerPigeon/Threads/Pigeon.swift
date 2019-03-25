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
        
		thread.async {
            DispatchQueue.main.async {
                viewController.flapWings()
            }
			while(!self.isFree) {
                // Pombo fica no modo esperando enquanto não houver cartas suficientes
                if !viewController.boxHas(quantityOfMessages: self.capacity){
                    DispatchQueue.main.async {
                        viewController.updatePigeonToWaitingState()
                    }
                }
                // Down n vezes no semaforo boxMessagesSemaphore, onde n é a capacidade do pombo
                for _ in 1...self.capacity { boxMessagesSemaphore!.wait() }
                
                //Calcula hora em que termina o tempo de carregamento
                var endAction = Date().addingTimeInterval(Double(self.timeToLoad))
                // Carregando pombo (UI)
                DispatchQueue.main.async {
                    viewController.updatePigeonToLoadingState()
                    viewController.decreaseBoxMessagesCounter(quantity: self.capacity)
                }
                // Mostra carregamento enquanto não atingir a hora de fim do carregamento
                while(Date() < endAction) { self.stepLabelLoading(viewController: viewController) }
                
                // Up n vezes no semaforo boxCapacitySemaphore, onde n é a capacidade do pombo
                for _ in 1...self.capacity { boxCapacitySemaphore!.signal() }
                
                // Calcula hora em que termina o tempo da viagem
                endAction = Date().addingTimeInterval(Double(self.timeToTravel))
                // Pombo voando (UI)
                DispatchQueue.main.async {
                    viewController.updatePigeonToFlyingState()
                }
                // Enquanto não tiver terminado o tempo de viagem, o pombo bate asa
                while(Date() < endAction){self.flapWings(viewController: viewController)}
				
                // Calcula hora em que termina o tempo de descarregamento
                endAction = Date().addingTimeInterval(Double(self.timeToUnload))
                // Pombo descarregando (UI)
                DispatchQueue.main.async {
                    viewController.updatePigeonToUnloadingState()
                }
                // Mostra carregamento enquanto não atingir a hora de fim do descarregamento
                while(Date() < endAction) {self.stepLabelLoading(viewController: viewController)}
				// Calcula tempo de volta
				endAction = Date().addingTimeInterval(Double(self.timeToTravel))
                // atualiza texto de estatus do pombo para voltando
                DispatchQueue.main.async {
                    viewController.updatePigeonToFlyingBackState()
                }
				// Enquanto não tiver terminado o tempo de volta, o pombo bate asa
                while(Date() < endAction){self.flapWings(viewController: viewController)}
			}
            // mostra o pombo livre
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

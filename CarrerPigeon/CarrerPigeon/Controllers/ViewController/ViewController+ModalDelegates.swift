//
//  ViewController+ModalDelegate.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 24/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

extension ViewController: PigeonModalDelegate {
	func createPigeon(pigeon: Pigeon) {
		pigeonThread = pigeon
        pigeon.run(viewController: self)
	}
}

extension ViewController: WriterModalDelegate {
	func createWriter(writer: Writer) {
		self.writersView.writers.append(writer)
		self.writersView.collectionView.reloadData()
		
		//writer.run()
	}
}

extension ViewController: BoxModalDelegate {
	func setBoxCapacity(capacity: Int) {
		self.boxView.setCapacity(capacity: capacity)
		
		boxCapacitySemaphore = DispatchSemaphore(value: capacity)
		
		self.addPigeonButton.isEnabled = true
		self.addWriterButton.isEnabled = true
		self.configureBoxButton.isEnabled = false
		self.runButton.isEnabled = true
		
		print("Recived Box capacity")
	}
}

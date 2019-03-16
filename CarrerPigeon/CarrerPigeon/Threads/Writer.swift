//
//  UserThread.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 14/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

class Writer {
	let mutex: DispatchSemaphore
	let boxMessages: DispatchSemaphore
	let boxCapacity: DispatchSemaphore
	
	let timeToWrite: Int
	
	var isFired = false
	
	init (mutexSemaphore: DispatchSemaphore,
		 boxMessagesSemaphore: DispatchSemaphore,
		 boxCapacitySemaphore: DispatchSemaphore,
		 timeToWrite: Int) {
		
		self.mutex = mutexSemaphore
		self.boxMessages = boxMessagesSemaphore
		self.boxCapacity = boxCapacitySemaphore
		self.timeToWrite = timeToWrite
	}
	
	func run () {
		
	}
}

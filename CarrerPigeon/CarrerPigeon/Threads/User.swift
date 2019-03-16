//
//  UserThread.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 14/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

class User {
	let mutex: DispatchSemaphore
	let boxMessages: DispatchSemaphore
	let boxCapacity: DispatchSemaphore
	
	init(mutexSemaphore: DispatchSemaphore,
		 boxMessagesSemaphore: DispatchSemaphore,
		 boxCapacitySemaphore: DispatchSemaphore) {
		self.mutex = mutexSemaphore
		self.boxMessages = boxMessagesSemaphore
		self.boxCapacity = boxCapacitySemaphore
	}
}

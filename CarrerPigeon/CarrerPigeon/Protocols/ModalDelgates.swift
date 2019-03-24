//
//  ModalDelgates.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 24/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

protocol PigeonModalDelegate {
	func createPigeon(pigeon: Pigeon)
}

protocol WriterModalDelegate {
	func createWriter(writer: Writer)
}

protocol BoxModalDelegate {
	func setBoxCapacity(capacity: Int)
}

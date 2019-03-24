//
//  WriterModalViewController.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 24/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import UIKit

class WriterModalViewController: UIViewController {
	@IBOutlet weak var idTextField: UITextField!
	@IBOutlet weak var timeToWriteTextField: UITextField!
	
	let delegate: WriterModalDelegate? = nil
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
	@IBAction func didTapBackButton(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func didTapLoadButton(_ sender: Any) {
		let writer = Writer(timeToWrite: Int(self.timeToWriteTextField.text!)!, id: self.idTextField.text!)
		
		if self.delegate != nil {
			delegate?.createWriter(writer: writer)
		}
	}
	
}

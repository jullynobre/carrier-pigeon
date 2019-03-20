//
//  WritersView.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 20/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import UIKit

class WritersView: UIView {

	@IBOutlet var contentView: UIView!
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	let cellIdentifier = "WriterCell"
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit() {
		Bundle.main.loadNibNamed("WritersView", owner: self, options: nil)
		addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
		
		configureCollectionView()
	}
	
	func configureCollectionView() {
		self.collectionView.dataSource = self
		self.collectionView.register(UINib(nibName: "WriterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
	}
}

extension WritersView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! WriterCollectionViewCell
		return cell
	}
	
	
}

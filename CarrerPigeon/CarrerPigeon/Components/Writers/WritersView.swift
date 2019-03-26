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
	
	var writers: [Writer] = []
	
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
	
	func cellForWriter(writerIndex: Int) -> WriterCollectionViewCell {
		return self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: IndexPath(row: writerIndex, section: 0)) as! WriterCollectionViewCell
	}
}

extension WritersView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.writers.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! WriterCollectionViewCell
		let writer = self.writers[indexPath.row]
		
        if (writer.endJob) {
            cell.statusLabel.text = "DEMITIDO"
            cell.image.image = UIImage()
        } else {
            cell.image.image = UIImage(named:  writer.imagesNames[writer.imageAnimationIndex])
            cell.statusLabel.text = writer.statusTexts[writer.statusTextIndex]
        }
        cell.identifierLabel.text = writer.id
		return cell
	}
}

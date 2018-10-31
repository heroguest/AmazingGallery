//
//  PhotoCollectionViewCell.swift
//  Amazing Gallery
//

import UIKit
import BlackBox

class PhotoCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var imageCell: UIImageView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.backgroundColor = UIColor.red
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    //hide or reset anything you want hereafter, for example
    imageCell.image = nil
    
  }
  
  func setImage(blackBox: BlackBox, index: Int) {
    
    DispatchQueue.global(qos: .userInitiated).async { [weak self] in
      guard case let self = self else {
        return
      }
      let imageBox = blackBox.downloadImage(at: index)
      
      DispatchQueue.main.async { [weak self] in
        self?.imageCell.image = imageBox
      }
    }
  }
  
}


//
//  DetailViewcontroller.swift
//  Amazing Gallery
//
//  Created by Luis Arturo Gutiérrez on 10/31/18.
//  Copyright © 2018 Pablo Gomez Basanta. All rights reserved.
//

import Foundation
import UIKit
import BlackBox

class DetailViewController: UIViewController {
  
  fileprivate lazy var detailPresenter: DetailPresenter = {
    return DetailPresenter(view: self)
  }()
  @IBOutlet weak var coverImageView: UIImageView!
  @IBOutlet weak var sizeLabel: UILabel!
  @IBOutlet weak var cameraLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var apertureLabel: UILabel!
  var index = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    detailPresenter.getCoverImage(index: index)
    detailPresenter.getData(index: index)
    title = "Photo Details"
    
  }
}

extension DetailViewController: DetailView {
  func showData(size: String!, camera: String!, location: String!, aperture: String!) {
    sizeLabel.text = "\(sizeLabel.text!) \(size!)"
    cameraLabel.text = "\(cameraLabel.text!) \(camera!)"
    locationLabel.text = "\(locationLabel.text!) \(location!)"
    apertureLabel.text = "\(apertureLabel.text!) \(aperture!)"
  }
  
  func setCoverImage(image: UIImage?) {
    coverImageView.image = image
  }

  
  
}

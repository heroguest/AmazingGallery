//
//  DetailPresenter.swift
//  Amazing Gallery
//
//  Created by Luis Arturo Gutiérrez on 10/31/18.
//  Copyright © 2018 Pablo Gomez Basanta. All rights reserved.
//

import Foundation
import UIKit
import BlackBox

protocol DetailView: NSObjectProtocol {
  func showData(size: String!, camera: String!, location: String!, aperture: String!)
  func setCoverImage(image: UIImage?)
}

class DetailPresenter {
  
  weak fileprivate var detalView: DetailView?
  let blackBox = BlackBox()
  let imageDetail: ImageDetails? = nil
  
  init(view: DetailView) {
    detalView = view
  }
  
  func getData(index: Int) {
    let details = blackBox.imageDetails(for: index)
  
    let dimensions = details.exifInfo.data["dimensions"] as! Dictionary<String, Int>
    let lensInfo = details.exifInfo.data["lensInfo"] as! Dictionary<String, Any>
    
    let size = "\(dimensions["height"] ?? 0) X \(dimensions["width"] ?? 0)"
    let camera = "\(details.camera.make) \(details.camera.model)"
    let location = "\(details.location.city) (\( details.location.coords.0), \( details.location.coords.1))"
    let aperture = "\(lensInfo["aperture"] ?? "1.3")"
    self.detalView?.showData(size: size, camera: camera, location: location, aperture: aperture)
  }
  
  func getCoverImage(index: Int) {
     self.detalView?.setCoverImage(image: blackBox.downloadImage(at: index))
    
  }
  
}

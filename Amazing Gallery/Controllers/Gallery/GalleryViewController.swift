//
//  GalleryViewController.swift
//  Amazing Gallery
//

import UIKit
import BlackBox

class GalleryViewController: UICollectionViewController {
  let blackBox = BlackBox()
  private let cellReuseIdentifier = "collectionCell"


  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView?.register(UINib.init(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return blackBox.imageCount
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
    cell.setImage(blackBox: blackBox, index: indexPath.item)

    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    viewController.index = indexPath.item
    self.navigationController?.pushViewController(viewController, animated: true)
  }
  
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width / 3.0 , height: 100.0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
  {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
}


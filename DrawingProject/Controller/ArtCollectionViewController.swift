//
//  ArtCollectionViewController.swift
//  DrawingProject
//
//  Created by Larson, David on 11/7/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "artIdentifier"

public class ArtCollectionViewController: UICollectionViewController
{
    
    //MARK: Data members for Creativity Screen
    
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRowCompact : CGFloat = 4
    private let itemsPerRowNormal : CGFloat = 6
    
    private let creativeCS : [UIImage?] =
    {
        return [
            UIImage(named: "octocat"),
            UIImage(named: "octocat"),
            UIImage(named: "octocat"),
            UIImage(named: "octocat"),
            UIImage(named: "octocat"),
            UIImage(named: "octocat"),
            UIImage(named: "octocat"),
            UIImage(named: "octocat"),
            UIImage(named: "octocat"),
            UIImage(named: "octocat"),
            
        ]
    }()
    
    private lazy var labels : [String] =
    {
        return [
            "This",
            "needs",
            "to",
            "be",
            "one",
            "to",
            "one",
            "with",
            "creativeCS",
            "above"
        ]
    }()
    
    
    
    //MARK: - Lifecycle

    public override func viewDidLoad() -> Void
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }
    
    /*
 // Mark: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 ovveride func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using [segue destinationViewController].
    // pass the selected object to the new view controller.
 }
 */
    
    // MARK: UICollectionViewDataSource

    public override func collectionView(_ collctionView: UICollectionView, numberOfItemsInSection section: Int) ->Int
    {
        return creativeCS.count
    }
    
    //MARK: UICollectionViewDataSource
    public override func collectionView(_ collectionView: UICollectionView,
                                         cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCell
        
            artCell.backgroundColor = .blue
            artCell.artImage.image = creativeCS[indexPath.row]
            artCell.artLabel.text = labels[indexPath.row]
        
            return artCell
    }
    
    // Mark UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView,
                                layout collectionViewLayout: UICollectionViewLayout,
                                sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let paddingSpace = sectionInsets.left * (itemsPerRowCompact * 1)
        let avaliableWidth = view.frame.width - paddingSpace
        let widthPerItem = avaliableWidth / itemsPerRowCompact
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return sectionInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collcectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return sectionInsets.left
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

   

  

    // MARK: UICollectionViewDelegate
    
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        let imageView = UIImageView(image: creativeCS[indexPath.row])
        imageView.frame = self.view.frame
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        
        self.view.addSubview(imageView)
    }
    
    // Use to go back from full mode
    @objc
    private func dismissFullscreenImage(_ sender: UITapGestureRecognizer)
    {
            sender.view?.removeFromSuperview()
    }
    
   

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

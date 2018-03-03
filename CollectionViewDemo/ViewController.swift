//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Abhishek Mitra on 27/02/18.
//  Copyright © 2018 Abhishek Mitra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableViewInVC: UITableView!
    
    var storedOffsets = [Int: CGFloat]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableViewInVC.delegate = self
        tableViewInVC.dataSource = self
        
        tableViewInVC.tableFooterView = UIView(frame: .zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell1 = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else { fatalError() }
        
        
        return cell1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        
        /*if indexPath.row == 0{
            
            tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        }
        else{
            
            if let flowLayout = tableViewCell.collectionViewInTVCell.collectionViewLayout as? UICollectionViewFlowLayout {
                flowLayout.scrollDirection = .vertical
                
                tableViewCell.collectionViewInTVCell.isScrollEnabled = false
            }
            
        }*/
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
        
        /*if indexPath.row == 0{
            
            return 300
        }
        else{
            
            return 2150
        }*/
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // MARK: - UICollectionView Delegates
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        if indexPath.item % 2 == 0{
            
            collectionCell.backgroundColor = .red
        }
        else{
            
            collectionCell.backgroundColor = .blue
        }
        
       // print(indexPath.item)
        
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 0{
            
            print("First Cell Index: \(indexPath.item)")
            
        }
        else{
            
            print("Second Cell Index: \(indexPath.item)")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        print(collectionView.tag)
        
        return CGSize(width: collectionView.frame.size.width / 2 - 10, height: collectionView.frame.size.height)

        
//        return CGSize(width: 180 , height: 200)
        
      
        
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 5, 0, 5) //UIEdgeInsetsMake(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat)
    }
}


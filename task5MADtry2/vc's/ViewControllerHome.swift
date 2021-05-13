//
//  ViewControllerHome.swift
//  task5MADtry2
//
//  Created by KriDan on 13.05.2021.
//

import Foundation
import UIKit
class ViewControllerHome: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSetCollectionView: [Data]! = []
    

    
    func initCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func initTableView(){}
    
    func requestFeelings(){
        ApiClient().getFeelings{ response in
            self.dataSetCollectionView = response.data!
            self.dataSetCollectionView.sort{x, y in
                return x.position! > y.position!
            }
            self.initCollectionView()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestFeelings()
        
    }
}

extension ViewControllerHome: UICollectionViewDelegate{}

extension ViewControllerHome: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSetCollectionView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCollection", for: indexPath) as! CollectionViewCell
        cell.data = dataSetCollectionView[indexPath.item]
        return cell
    }
}

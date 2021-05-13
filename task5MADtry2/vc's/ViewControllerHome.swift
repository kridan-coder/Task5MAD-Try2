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
    
    func initCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func initTableView(){}
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewControllerHome: UICollectionViewDelegate{}

extension ViewControllerHome: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

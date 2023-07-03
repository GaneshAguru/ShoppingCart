//
//  HomeScreenVC.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 09/06/23.
//

import UIKit

class HomeScreenVC: UIViewController,UICollectionViewDelegate {
    
    var fetchedProductsData : [ProductEntity] = []
    
    var productVM = ProductUtilityViewModel()
    
    @IBOutlet weak var imagePageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var productsTableView: UITableView!
    
    let images = [UIImage(named: "banner_01"), UIImage(named: "banner_02"), UIImage(named: "banner_03"), UIImage(named: "banner_04"), UIImage(named: "banner_05"), UIImage(named: "banner_06")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imagePageControl.numberOfPages = images.count
        
        collectionView.delegate=self
        productsTableView.delegate = self
        productsTableView.dataSource = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
        
        productsTableView.separatorColor = UIColor.black
        productsTableView.separatorInset = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
        
        
        
        fetchedProductsData = productVM.getProductListVM()
        
        
        if fetchedProductsData.isEmpty{
            
            
            productVM.addProductListVM(item: "Bread", desc: "Fresh bread", image: "bread2", price: "40",id: "101")
            
            productVM.addProductListVM(item: "Milk", desc: "Farm milk", image: "milk", price: "50",id: "102")
            productVM.addProductListVM(item: "Cake", desc: "Special chessy cake", image: "cake", price:"240",id: "103")
            productVM.addProductListVM(item: "Bun", desc: "Readymade", image: "bun", price: "20",id: "104")
            productVM.addProductListVM(item: "Rice", desc: "With polishing", image: "rice", price: "2500",id: "105")
            productVM.addProductListVM(item: "Salt", desc: "Iodized", image: "salt", price: "10",id: "106")
            
            fetchedProductsData = productVM.getProductListVM()
            
            productsTableView.reloadData()
            
            
            
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    

    
    // this function is for scrolling the banners
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        imagePageControl.currentPage = Int(pageIndex)
        
    }
    
    
}


extension HomeScreenVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "productDetailsScreen") as! ProductDetailsScreenVC
        let sendData = fetchedProductsData[indexPath.row]
        vc.itemDetails = sendData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeScreenVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedProductsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeScreenProductsCell
        
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 1
        let data = fetchedProductsData[indexPath.row]
        
        cell.itemL.text = data.item
        
        cell.priceL.text = "Rs. \(data.price ?? "")"
        cell.imageL.image = UIImage(named: data.image!)
        
        
        return cell
        
        
    }
    
    
}
extension HomeScreenVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionCell
        cell.imageView.image = images[indexPath.item]
        return cell
    }
}

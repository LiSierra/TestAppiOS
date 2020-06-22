//
//  ViewController.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/20/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    var postsViewModel: PostsViewModel!
    
    @IBOutlet weak var tvPosts: UITableView!
    @IBOutlet weak var sPosts: UISearchBar!
    @IBOutlet weak var segPost: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let factory = FactoryCachePreference()
        CacheFactory.getIntance().setCurrent(cacheFactory: factory)
        // Do any additional setup after loading the view.
        postsViewModel = PostsViewModel()
       
        self.postsViewModel.getListPosts{ () in
            self.tvPosts.reloadData()
        }
        self.tvPosts.delegate = self
        self.tvPosts.dataSource = self
        self.tvPosts.register(UINib(nibName: "PostViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    
        
    }
    
    
    @IBAction func tapItems(_ sender: Any) {
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberCells = self.postsViewModel.numberOfItemsInTable(section: section)
        print(numberCells)
        return numberCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.tvPosts.register(UINib(nibName: "PostViewCell", bundle: nil), forCellReuseIdentifier: "Cell")

        let cell = self.tvPosts.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostViewCell        
        cell.setTitle(text:self.postsViewModel.collectionPosts?.collection?.items![indexPath.row].data?[0].title ?? "")
        
        if let url = URL(string:
            self.postsViewModel.collectionPosts?.collection?.items![indexPath.row].links?[0].href ?? "") { //
            ProcessImage.shareClient.downloadImage(imageView: cell.imgPost, from: url)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // ...
        
    }
}

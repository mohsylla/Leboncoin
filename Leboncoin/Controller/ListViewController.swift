//
//  ViewController.swift
//  Leboncoin
//
//  Created by Sylla on 22/04/2022.
//

import UIKit

class ListViewController: UIViewController {

    var annonce: [Annonce]?
    
    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        listTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
}
extension ListViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return annonce?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "annonceCell", for: indexPath) as? ItemTableViewCell else{
            return UITableViewCell()
    
            
        }
        
        return cell
    }
    
    
    
}
extension ListViewController: UITableViewDelegate{
    
}



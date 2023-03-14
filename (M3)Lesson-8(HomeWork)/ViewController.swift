//
//  ViewController.swift
//  (M3)Lesson-8(HomeWork)
//
//  Created by Ahmed Muvaza on 14/3/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
     private let idCell = "idCell"
     private let searchBar = UISearchBar()
     private let tableView = UITableView()
     
     private var friend: [String] = []
     private var filteredfriend: [String] = []
     
     private var isFiltered: Bool = false
     
     override func viewDidLoad() {
         super.viewDidLoad()

         configure()
         initUI()
         initData()
     }
     private func configure(){
         view.backgroundColor = .white
         navigationItem.title = "Profile"
         navigationItem.titleView = searchBar
         
         tableView.delegate = self
         tableView.dataSource = self
         tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell )
         
         searchBar.delegate = self
         searchBar.placeholder = " Search..."
            
     }
     
     private func initUI(){
         
         
         view.addSubview(tableView)
         
         tableView.snp.makeConstraints { make in
             make.top.trailing.bottom.leading.equalToSuperview()
         }
         
         
     }
     
     private func initData(){
        friend = ["Nurlan Seitov", "Erzhan", "Datkayim", "Bektur", "Kaira", "Indira", "Ahmed", "Nurjamal", "Raul", "Muhammed",
                     "Nurdin bayke", "Nurlan Talasbekov", "Daniel"]
     }
 }


 extension ViewController: UITableViewDataSource, UITableViewDelegate {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         isFiltered ? filteredfriend.count : friend.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
         cell.textLabel?.text = isFiltered ? filteredfriend[indexPath.row] : friend[indexPath.row]
         return cell
     }
 }

 extension ViewController: UISearchBarDelegate {
     
     func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         print("searchText: \(searchText)")
         
         if searchText.isEmpty {
             isFiltered = false
         } else {
             isFiltered = true
             filteredfriend = friend.filter{ $0.lowercased().contains(searchText.lowercased()) }
         }
         
         tableView.reloadData()
     }
}


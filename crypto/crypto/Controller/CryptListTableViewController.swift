//
//  CryptListTableViewController.swift
//  crypto
//
//  Created by Nurzhan Ababakirov on 17/9/21.
//

import UIKit

class CryptListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var cryptList: [CryptListStruct] = [CryptListStruct]()
    var filteredArr = Array<CryptListStruct>()
    var searching:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getCryptList { CryptListStruct in
            
            self.cryptList = CryptListStruct
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.reloadData()
            self.searchBar.delegate = self
            
        } _: { (error) in
            if error == Constants.Network.ErrorMessage.NO_INTERNET_CONNECTION{
                let alert = UIAlertController(title: "Crypto", message: "No Internet Connection", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            print(error)
        }
    }
    

    @IBAction func refresh(_ sender: UIRefreshControl) {
        viewDidLoad()
        sender.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searching ?? false){
            return filteredArr.count
        }else{
            return cryptList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       

        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptListCell", for: indexPath) as! CryptListTableViewCell
        if !(searching ?? false){
            let cryptList = cryptList[indexPath.row]
            cell.configure(cryptsList: cryptList)
        }else{
            let cryptList = filteredArr[indexPath.row]
            cell.configure(cryptsList: cryptList)
        }
        
        return cell
    }


}

extension CryptListTableViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          
        if(searchText.isEmpty){
            filteredArr = cryptList
        }else{

            filteredArr = cryptList.filter{$0.name.contains(searchText)}
        }
        searching = true
        tableView.reloadData()
    }
     
}

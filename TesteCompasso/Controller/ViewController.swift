//
//  ViewController.swift
//  TesteCompasso
//
//  Created by Fernando Crelick on 19/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let parser = Parser()
    var event = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parser.Parse{
            data in
            self.event = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        self.configTableView()
       
    }
    func configTableView(){
        tableView.dataSource = self
        let nib = InitialTableViewCell.nibName
        self.tableView.register(UINib(nibName: nib, bundle: nil), forCellReuseIdentifier: nib)
        
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return event.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: InitialTableViewCell? = self.tableView.dequeueReusableCell(withIdentifier: InitialTableViewCell.nibName, for: indexPath) as? InitialTableViewCell
        cell?.setup(event: self.event[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
}


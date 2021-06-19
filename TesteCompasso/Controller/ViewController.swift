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
        parser.automatedParse{
            data in
            self.event = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return event.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = event[indexPath.row].title
        return cell
    }
    
    
}

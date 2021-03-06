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
                self.tableView?.reloadData()
            }
        }
        self.configDelegates()
        self.registerCell()
        
    }
    
    
    
    func configDelegates(){
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    func registerCell(){
        self.tableView?.register(UINib(nibName: "InitialTableViewCell", bundle: nil), forCellReuseIdentifier: "InitialTableViewCell")
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return event.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: InitialTableViewCell? = self.tableView.dequeueReusableCell(withIdentifier: "InitialTableViewCell", for: indexPath) as? InitialTableViewCell
        cell?.setup(event: self.event[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let chosenEvent = self.event[indexPath.row]
        
        performSegue(withIdentifier: "ViewToDetail", sender: chosenEvent)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let event = sender as? Event
        let vc = segue.destination as? DetailViewController
        vc?.selectedTitle = event?.title
        if let unwrapPrice = event?.price{
            vc?.selectedPrice = String(unwrapPrice)
        }
        vc?.selectedDescription = event?.description
    }
}


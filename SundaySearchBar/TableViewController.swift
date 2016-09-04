import UIKit
class TableViewController: UITableViewController, UISearchBarDelegate {
    var array = ["Chips", "Fried Chicken","Pizza",  "Burgers", "Sushi", "Fruit", "Chocolate", "Dessert", "Ice Cream", "Fruit"]
    
    var result = [String]()
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        result = array
        searchBar.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        searchBar.frame = (navigationController?.navigationBar.frame)!
        searchBar.placeholder = "Search for your favorite food here"
        navigationController?.navigationBar.backgroundColor = UIColor.yellowColor()
        navigationController?.navigationBar.addSubview(searchBar)
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("cell") else {
            assertionFailure("dequeue failed")
            return UITableViewCell()
        }
        cell.textLabel?.text = result[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print("search test is: \(searchText)")
        
        result.removeAll()
        for item in array {
            for word in item.componentsSeparatedByString(" ") {
                let lowered = word.lowercaseString
                if lowered.hasPrefix(searchText.lowercaseString) {
                    print(item)
                    result.append(item)
                }
            }
            if searchText.isEmpty {
                result = array
            }
            tableView.reloadData()
        }
    }
    
}
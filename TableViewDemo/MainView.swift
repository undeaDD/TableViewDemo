import UIKit

class MainView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // to remove the seperators inbetween cells
        tableView.separatorStyle = .none
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let isTitleCell = indexPath.row == 0
        guard let cell = tableView.dequeueReusableCell(withIdentifier: isTitleCell ? "demoCellA" : "demoCellB", for: indexPath) as? TitleCell else {
            fatalError()
        }
        
        if isTitleCell {
            cell.titleField.text = "Title \(indexPath.section + 1)"
            cell.borderView.hasTopBorder = true
        } else {
            let count = Int.random(in: 1...6)
            let content = String(repeating: "Dynamic content\n", count: count)
            cell.titleField.text = content
            cell.borderView.hasTopBorder = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 0 ? 45 : UITableView.automaticDimension
    }
}

class DemoCellA: TitleCell {

}

class DemoCellB: TitleCell {
    
}

class TitleCell: UITableViewCell {
    @IBOutlet weak var borderView: BorderView!
    @IBOutlet weak var titleField: UILabel!
}

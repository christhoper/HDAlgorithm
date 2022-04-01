//
//  ViewController.swift
//  HDAlgorithm
//
//  Created by bailun on 2020/12/4.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource: [(String, String)] {
        return [("数据结构", "DataStructViewController"),
                ("二叉树", "_TreeNodeViewController"),
                ("动态规划", "DynamicViewController"),
                ("回溯", "BacktractViewController"),
                ("广度优先搜索", "BFSViewController"),
                ("深度优先搜索", "DFSViewController"),
                ("二分查找", "BinarySearchViewController"),
                ("排序", "SourtViewController")]
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        tableView.rowHeight = 44
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        let title = dataSource[indexPath.row]
        cell.textLabel?.text = title.0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entity = dataSource[indexPath.row]
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else { return }
        
        let className: AnyObject.Type = NSClassFromString(clsName as! String + "." + entity.1)!
        guard let classType = className as? UIViewController.Type else { return }
        
        let controller = classType.init()
        controller.title = entity.0
        navigationController?.pushViewController(controller, animated: true)
    }
}


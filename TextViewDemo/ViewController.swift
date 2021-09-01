//
//  ViewController.swift
//  TextViewDemo
//
//  Created by Eden on 2021/8/31.
//

import UIKit

public class ViewController: UIViewController
{
    public override var inputAccessoryView: UIView? {
        
        self.accessoryView
    }
    
    @IBOutlet fileprivate weak var accessoryView: DTInputAccessoryView!
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    // MARK: View Live Cycle
    
    public override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
    }
    
    public override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
    }
    
    public override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
    }
    
    public override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        
    }
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.accessoryView.doneActionHandler = {
            
            [unowned self] in
            
            self.view.endEditing(true)
        }
        
        self.tableView.register(TextViewCell.self)
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    deinit
    {
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    //MARK: - UITableView DataSource Methods
    
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(TextViewCell.self, for: indexPath) else {
            
            return UITableViewCell()
        }
        
        cell.delegate = self
        
        return cell
    }
}

extension ViewController: TextViewCellDelegate
{
    public func cellTextDidChange(_ cell: TextViewCell)
    {
        self.tableView.performBatchUpdates(nil, completion: nil)
        
        self.accessoryView.subviews.forEach {
            
            print("\(type(of: $0)): \($0.frame.height)")
        }
    }
}

//
//  ViewController.swift
//  WaterMarkDemo
//
//  Created by 叶佳骏 on 2017/11/14.
//  Copyright © 2017年 Mr.JJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var backgroundLabel: JJWaterMarkLabel = {
        let label = JJWaterMarkLabel(frame: self.view.frame)
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "JJ1886710XXXX"
        label.lineSpacing = 40
        label.textSpacing = 8
        label.rotationAngle = -30
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame)
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(backgroundLabel)
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = "标题\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


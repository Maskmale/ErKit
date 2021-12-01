//
//  ViewController.swift
//  ErKit
//
//  Created by Erbash on 11/29/2021.
//  Copyright (c) 2021 Erbash. All rights reserved.
//

import UIKit
import ErKit

//class ViewController: UIViewController, UITableViewDataSource {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let v = UITableView(frame: self.view.frame, style: .plain)
//        view.addSubview(v)
//        v.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        v.dataSource = self
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.separatorInset = UIEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 50)
//        cell.textLabel?.text = "第\(indexPath.row + 1)行"
//        return cell
//    }
//}
        
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        UIApplication.shared.userInterfaceLayoutDirection

//        testUIButtonExtension()
//        let b = UIView()
//        b.backgroundColor = .black
//        b.ERH = 300
//        b.ERW = b.ERH
//        b.center = view.center
//        view.addSubview(b)
//
//        let v = UIView()
//        v.backgroundColor = .white
//        v.ERH = 100
//        v.ERW = v.ERH
//        v.center = b.center
//        b.addSubview(v)
//        let b = UIBarButtonItem(imageName: "icon_newFile", highlightedImageName: nil, selectedImageName: nil, target: self, action: #selector(click))
//        self.navigationItem.leftBarButtonItem = b
        
        let u = UILabel()
        u.text = "123"
        u.textAlignment = .trailing
        u.sizeToFit()
        u.ERW = view.ERW
        u.center = view.center
        u.textColor = .black
        view.addSubview(u)
    }

    @objc func click() {
        ERLog("click")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func testUIButtonExtension () {
        let b = UIButton()
        b.setImage(UIImage(named: "icon_newFile"), for: .normal)
        b.setTitle("New File", for: .normal)
        b.backgroundColor = .white
        b.setERLayer(cRadius: 12, bWidth: 5, bColor: .blue)
        b.setTitleColor(.blue, for: .normal)
        b.ERH = 300
        b.ERW = b.ERH
        b.center = view.center
        view.addSubview(b)
        b.setERTitlePosition(.leading, spacing: 0)

//        b.semanticContentAttribute = UIApplication.shared
//            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
    }
}


//
//  DetailsViewController.swift
//  TableViewPractice
//
//  Created by 今野　奈菜 on 2020/10/07.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    //表示する画像名の受け取り用
    var imageName: String = ""

    var detail: String = ""
    var name: String = ""

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 画像を表示する
        imageView.image = UIImage(named: imageName)
        detailLabel.text = detail
        nameLabel.text = name
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

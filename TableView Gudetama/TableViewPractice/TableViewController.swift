//
//  TableViewController.swift
//  TableViewPractice
//
//  Created by 今野　奈菜 on 2020/10/06.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    //テーブルに表示するデータの配列
    var items:[(text:String,detail:String,imageName:String)] = [
        ("うどん","しがらみが多い","1"),
        ("エッグベネディクト","エッグべデーベネディー","2"),
        ("オムライス","順位とかど〜でもいい","3"),
        ("ゴーヤチャンプル","人生にがい","4"),
        ("食パン","なけなしのやる気がすわれていく…","5"),
        ("ステーキ","やめれ〜","6"),
        ("バームクーヘン","芯がないからブレブレっしょー","7"),
        ("ベーコンこたつ","自分に勝てない","8"),
        ("ベーコン布団","ねてたい…。","9"),
        ("レインコート","天気とかカンケーないし外出ないし","10"),
        ("桜もち","ぱんつくいこむ…","11"),
        ("親子丼","色気より食い気だね","12"),
        ("卵かけご飯","穴があったら入りたい…","13"),
        ("卵だらけ","なんか…ごめ…","14"),
        ("卵ベーコン","まだ狩んの〜？","15"),


    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //ここのコメントアウトを外すことで右上にEditボタンが表示されて押すと左側にマイナスボタンが表示される
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    //numberofsectionsは、セクションの数を返すことができる。今回は、セクションがないから1にする。
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //numberOfRowsInSectionではセクションごとの行数を返す。今回は、配列の要素数分にしたい(15行ってこと)から配列の要素数を取得する。
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }

    //cellForRowAtで
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //再利用できるセルがあれば取得する
        //第一引数には、ストーリーボードで設定したセルのidetifireを指定する
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // セルの内容を指定
        let item = items[indexPath.row]
        cell.textLabel?.text = item.text
        cell.detailTextLabel?.text = item.detail
        cell.imageView?.image = UIImage(named: item.imageName)

        return cell
    }

//    //セルを押すと画面遷移する
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //遷移先のstoryboardIDをnameに書く！！
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        //遷移先のviewをインスタンス化して、withidentifireにstoryboardIDを書く！！
        let nextVC = storyboard.instantiateViewController(withIdentifier: "Details") as! DetailsViewController

        //presenterがここら辺の処理を持っている
        //[indexPath.row]これでセルの何個目が選択されたかを識別できるitemsってやると、その中身を指定できる
        nextVC.imageName = items[indexPath.row].imageName
        nextVC.name = items[indexPath.row].text
        nextVC.detail = items[indexPath.row].detail
        navigationController?.pushViewController(nextVC, animated: true)


////        self.navigationController?.pushViewController(secondVC, animated: true)
//        //        let nextView = UIStoryboard(name: "Details", bundle: nil).instantiateInitialViewController() as! DetailsViewController
//                present(secondVC,animated: true,completion: nil)
    }

    //コメントアウトされていたやつを外すと、エディットボタンが表示されるようになる
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        //もし第二引数のeditingがdeleteできたら、-ぼたんを押すとdeleteボタンが表示されるようになる
        if editingStyle == .delete {
            // Delete the row from the data source
            //この1文を足さないとエラーが出るから注意
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }








    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */



    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

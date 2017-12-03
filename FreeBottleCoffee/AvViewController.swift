//
//  ViewController.swift
//  FreeBottleCoffee
//
//  Created by Hisafumi Kikkawa on 2017/12/02.
//  Copyright © 2017年 shinjukujohnny. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

var start_count = 0

class AvViewController: AVPlayerViewController {
    //@IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.playMovieFromProjectBundle()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.movieEnd(_:)),
            name: Notification.Name("AVPlayerItemDidPlayToEndTimeNotification"),
            object: nil)

        /*
        // ボタン設置
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.addTarget(self, action: #selector(self.playMovieFromProjectBundle), for: .touchUpInside)
        
        // Documentディレクトリから動画を読み込む場合はこちら
        // button.addTarget(self, action: #selector(self.playMovieFromLocalFile), for: .touchUpInside)
        
        button.sizeToFit()
        button.center = self.view.center
        self.view.addSubview(button)
 */
    }
    
    // アプリ内に組み込んだ動画ファイルを再生
    func playMovieFromProjectBundle() {
        
        var file_name = "IMG_5822"
        /* ソース公開用に動画は削除済み
        // 初期ローテーション
        if start_count == 1 {
            file_name = "sabon01_1080_1920"
        } else if start_count == 2 {
            file_name = "hirosesuzu"
        } else if start_count == 3 {
            file_name = "charmy"
        } else {
            file_name = "aoziru_9sec"
        }
        // 全動画再生後のランダム表示
        if start_count > 3 {
            let random = arc4random() % 4
            print(random)
            
            if random == 0 {
                file_name = "hirosesuzu"
            } else if random == 1 {
                file_name = "sabon01_1080_1920"
            } else if random == 2 {
                file_name = "aoziru_9sec"
            } else {
                file_name = "charmy"
            }
        }
 */
        
        if let bundlePath = Bundle.main.path(forResource: file_name, ofType: "MOV") {
            let videoPlayer = AVPlayer(url: URL(fileURLWithPath: bundlePath))
            //let videoPlayer = AVPlayer(url: URL(string:"https://www.youtube.com/watch?v=iIQN8Bqy5AM")!)
            
            // 動画プレイヤーの用意
            let playerController = AVPlayerViewController()
            playerController.player = videoPlayer
            self.present(playerController, animated: true, completion: {
            videoPlayer.play()})
            start_count += 1
            print(start_count)
        } else {
            print("no such file")
        }
    }
    
    /*
    @IBAction func goNext(_ segue:UIStoryboardSegue) {
        
    }
 */
    
    func movieEnd(_ notification: Notification) {
        print("MovieEnd!")
        
        NotificationCenter.default.removeObserver(self)
        performSegue(withIdentifier: "toWebView", sender: self)
        
        /*
        performSegue(withIdentifier: "toViewController2",sender: nil)
        let secondViewController: ViewController2 = self.storyboard?.instantiateViewController(withIdentifier: "toViewController") as! ViewController2
        // アニメーションを設定する.
        //secondViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        // 値渡ししたい時 hoge -> piyo
        //secondViewController.piyo = self.hoge
        // Viewの移動する.
        self.present(secondViewController, animated: true, completion: nil)
 */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
     }


}


//
//  HomeViewController.swift
//  iOS_Study_B
//
//  Created by 정민지 on 2023/10/12.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var arrayCat : [FeedModel] = []
    
    let imagePickerViewController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
        // Do any additional setup after loading the view.
        
        let input = FeedAPIInput(limit: 30, page: 10)
        FeedDataManager().feedDataManager(input, self)
        
        imagePickerViewController.delegate = self
    }
    
    @IBAction func buttonGoAlbum(_ sender: Any) {
        self.imagePickerViewController.sourceType = .photoLibrary
        self.present(imagePickerViewController, animated: true, completion: nil)
    }
    
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCat.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else {
                return UITableViewCell()
            }
            return cell
        
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
                return UITableViewCell()
            }
            if let urlString = arrayCat[indexPath.row - 1].url {
                let url = URL(string: urlString)
                cell.imageViewFeed.kf.setImage(with: url)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        } else {
            return 600
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? StoryTableViewCell else {
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as?
                StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }
}

extension HomeViewController {
    func sucessAPI(_ result: [FeedModel]) {
        arrayCat = result
        tableView.reloadData()
    }
}

extension HomeViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                let imageString = "gs://catstagram-d7fbf.appspot.com/Cat1"
                let input = FeeduploadInput(content: "저희집 고양이입니다. 귀엽지 않나요?", postImgsUrl: [imageString])
                FeedUploadDataManager().posts(self, input)
                
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

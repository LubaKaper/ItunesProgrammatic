//
//  DetailViewController.swift
//  ItunesProgrammatic
//
//  Created by Liubov Kaper  on 12/9/20.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    
    
    private var selectedPodcast: Podcast
    
    init(_ selectedPodcast: Podcast){
        self.selectedPodcast = selectedPodcast
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
//    init(_ selectedPodcast: Podcast) {
//        self.selectedPodcast = selectedPodcast
//        super.init(nibName: nil, bundle: nil)
//    }
//    required init?(coder: NSCoder) {
//        fatalError("error")
//    }
    
    private var podcastImage: UIImageView!
    
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
       updateUI()
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "photoCell")
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    private func configureImageView() {
        podcastImage = UIImageView(frame: view.bounds)
        view.addSubview(podcastImage)
    }

    private func updateUI() {
        podcastImage.kf.setImage(with: URL(string: selectedPodcast.artworkUrl600))
    }

}

extension DetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        <#code#>
    }
}

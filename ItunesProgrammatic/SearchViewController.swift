//
//  ViewController.swift
//  ItunesProgrammatic
//
//  Created by Liubov Kaper  on 12/9/20.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    
    private var apiClient = APIClient()
    
    private var podcasts = [Podcast]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureColledtionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        getPodcasts(for: "swift")
    }
    
    private func getPodcasts(for query: String) {
        apiClient.fetchPodcasts(for: query) { [weak self](result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let podcasts):
                self?.podcasts = podcasts
            }
        }
    }
    
    private func configureColledtionView() {
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(PodcastCell.self, forCellWithReuseIdentifier: "podcastCell")
        view.addSubview(collectionView)
        
    }


}


extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "podcastCell", for: indexPath) as? PodcastCell else {
            fatalError("could not dequeue PodcastCell")
        }
        
        let podcast = podcasts[indexPath.row]
        cell.configureCell(for: podcast)
        cell.backgroundColor = .systemYellow
        return cell
    }
    
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxWidth = UIScreen.main.bounds.width - 20
        let numberOfItems: CGFloat = 2
        let width = maxWidth / numberOfItems
        return CGSize(width: width, height: width)
    }
    
}

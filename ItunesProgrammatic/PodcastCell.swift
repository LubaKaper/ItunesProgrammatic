//
//  PodcastCell.swift
//  ItunesProgrammatic
//
//  Created by Liubov Kaper  on 12/9/20.
//

import UIKit
import Kingfisher

class PodcastCell: UICollectionViewCell {
    
    public var podcastNAmeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public var podcastImage: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        labelConstraints()
        imageConstarints()
    }
    
    private func labelConstraints() {
        addSubview(podcastNAmeLabel)
        podcastNAmeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            podcastNAmeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            podcastNAmeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            podcastNAmeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    
    private func imageConstarints() {
        addSubview(podcastImage)
        podcastImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            podcastImage.topAnchor.constraint(equalTo: podcastNAmeLabel.bottomAnchor, constant: 10),
            podcastImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            podcastImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            podcastImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    public func configureCell(for podcast: Podcast) {
        podcastNAmeLabel.text = podcast.collectionName
        podcastImage.kf.setImage(with: URL(string: podcast.artworkUrl600))
    }
    
}

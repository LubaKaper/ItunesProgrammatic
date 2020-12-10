//
//  PhotoCell.swift
//  ItunesProgrammatic
//
//  Created by Liubov Kaper  on 12/10/20.
//

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell {
    
    public var photoView: UIImageView = {
        let photo = UIImageView()
        return photo
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
        photoConstarints()
    }
    
    private func photoConstarints() {
        addSubview(photoView)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            photoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            photoView.trailingAnchor.constraint(equalTo: leadingAnchor, constant: -10),
            photoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    public func configurePhotoCell(for photo: Podcast) {
        photoView.kf.setImage(with: URL(string: photo.artworkUrl600))
    }
    
}

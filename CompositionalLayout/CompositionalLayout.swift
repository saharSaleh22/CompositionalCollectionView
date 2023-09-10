//
//  CompositionalLayout.swift
//  CompositionalLayout
//
//  Created by K on 10/09/2023.
//

import UIKit
enum CompositionalLayoutAlignment{
    case vertical
    case horizantal
}
struct CompositionalLayout {
    static func createItem(width : NSCollectionLayoutDimension, height : NSCollectionLayoutDimension ,spacing : CGFloat ) -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height))
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        return item

    }
    
    static func createGroup(alignment : CompositionalLayoutAlignment,width : NSCollectionLayoutDimension , height : NSCollectionLayoutDimension , items : [NSCollectionLayoutItem] ) -> NSCollectionLayoutGroup{
        switch alignment{
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
            
        case .horizantal:
            return  NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
        }
    }
    static func createGroup(alignment: CompositionalLayoutAlignment,
                                width: NSCollectionLayoutDimension,
                                height: NSCollectionLayoutDimension,
                                item: NSCollectionLayoutItem,
                                count: Int
        ) -> NSCollectionLayoutGroup {
            switch alignment {
            case .vertical:
                return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width,
                                                                                           heightDimension: height),
                                                        subitem: item,
                                                        count: count)
            case .horizantal:
                return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width,
                                                                                             heightDimension: height),
                                                          subitem: item,
                                                          count: count)
            }
        }

}

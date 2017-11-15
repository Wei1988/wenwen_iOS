//
//  LoopCollectionViewLayout.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/15.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit

//环形布局样式
class LoopCollectionViewLayout: UICollectionViewLayout {
    
    //元素尺寸
    var itemSize:CGFloat = WWSpecs.windowWidth()*0.22
    
    //元素个数
    private var _itemCount:Int?
    //整个collection view视图尺寸
    private var _viewSize:CGSize?
    //整个collection view视图中心点位置
    private var _center:CGPoint?
    //圆环路径的半径
    private var _radius:CGFloat?
    
    private var insertIndexPaths = [IndexPath]()
    
    //设定一些必要的layout的结构和初始需要的参数
    override func prepare() {
        super.prepare()
        _viewSize = self.collectionView?.frame.size
        _itemCount = self.collectionView?.numberOfItems(inSection: 0)
        _center = CGPoint(x: _viewSize!.width / 2.0, y: _viewSize!.height / 2.0)
        _radius = (min(_viewSize!.width, _viewSize!.height) - itemSize) / 2
    }
    
    //所有单元格位置属性
    override func layoutAttributesForElements(in rect: CGRect)
        -> [UICollectionViewLayoutAttributes]? {
            var attributesArray = [UICollectionViewLayoutAttributes]()
            if let count = self._itemCount {
                for i in 0 ..< count{
                    //这里利用layoutAttributesForItem方法来获取attributes
                    let indexPath = IndexPath(item: i, section: 0)
                    let attributes =  self.layoutAttributesForItem(at: indexPath)
                    attributesArray.append(attributes!)
                }
            }
            return attributesArray
    }
    
    //这个方法返回每个单元格的位置和大小
    override func layoutAttributesForItem(at indexPath: IndexPath)
        -> UICollectionViewLayoutAttributes? {
            let attrs = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attrs.size = CGSize(width: itemSize, height: itemSize)
            let x = Double(_center!.x) + Double(_radius!)
                * cos(Double(2 * indexPath.item) * Double.pi/Double(_itemCount!))
            let y = Double(_center!.y) + Double(_radius!)
                * sin(Double(2 * indexPath.item) * Double.pi/Double(_itemCount!))
            attrs.center = CGPoint(x: CGFloat(x), y: CGFloat(y))
            return attrs
    }
    
    
    //插入或者删除 item的时候，collection view将会通知布局对象它将调整布局
    override func prepare(forCollectionViewUpdates
        updateItems: [UICollectionViewUpdateItem]) {
        super.prepare(forCollectionViewUpdates: updateItems)
        self.insertIndexPaths = [IndexPath]()
        //这里我们将新插入IndexPath存储起来，后面设置动画效果要用
        for update in updateItems{
            if update.updateAction == UICollectionUpdateAction.insert{
                self.insertIndexPaths.append(update.indexPathAfterUpdate!)
            }
        }
    }
    
    //删除或添加item时该方法会调用,返回开始的布局信息（在prepareforCollectionViewUpdates后调用）
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath)
        -> UICollectionViewLayoutAttributes? {
            var attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath)
            //如果时插入元素，插入时设置最开始的一些属性（插入过程中自动会有动画效果）
            if self.insertIndexPaths.contains(itemIndexPath) {
                
                if let _ = attributes{
                    attributes = self.layoutAttributesForItem(at: itemIndexPath)
                }
                
                //动画开始时该元素是全透明的，位置在视图中央
                attributes!.alpha = 0.0
                attributes!.center =  _center!
            }
            return attributes
    }
}

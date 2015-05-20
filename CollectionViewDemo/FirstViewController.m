//
//  FirstViewController.m
//  CollectionViewDemo
//
//  Created by Luther Baker on 5/19/15.
//  Copyright (c) 2015 Fuzzy Bearings. All rights reserved.
//

#import "FirstViewController.h"
#import "CollectionViewCell.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

static NSString *const kCellIdentifier = @"FirstCellIdentifier";

- (id)init {
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:collectionViewLayout];
    return self;
}

- (void)loadView {
    [super loadView];
    
    // set one time sizes directly on flow layout
    [self flowLayout].itemSize = CGSizeMake(60.0, 60.0);
    [self flowLayout].sectionInset = UIEdgeInsetsMake(16.0, 32.0, 16.0, 32.0);
    [self flowLayout].scrollDirection = UICollectionViewScrollDirectionVertical;
    
    // standard delegat
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // cells
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    
    // just a ui thing
    self.collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
}

// sections
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 16;
}

// rows
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 16;
}

// cells
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    if (indexPath.section % 2 > 0) {
        cell.backgroundColor = [UIColor greenColor];
    }
    return cell;
}

#pragma mark - Selection

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Private

- (UICollectionViewFlowLayout *)flowLayout {
    return (UICollectionViewFlowLayout *)self.collectionViewLayout;
}

@end

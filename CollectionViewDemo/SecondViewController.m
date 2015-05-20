//
//  SecondViewController.m
//  CollectionViewDemo
//
//  Created by Luther Baker on 5/19/15.
//  Copyright (c) 2015 Fuzzy Bearings. All rights reserved.
//

#import "SecondViewController.h"
#import "CollectionViewCell.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

static NSString *const kCellIdentifier = @"SecondCellIdentifier";

- (id)init {
    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:collectionViewLayout];
    if (self) {
        self.useLayoutToLayoutNavigationTransitions = YES;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    // set one time sizes directly on flow layout
    [self flowLayout].itemSize = CGSizeMake(30.0, 30.0);
    [self flowLayout].sectionInset = UIEdgeInsetsMake(8.0, 8.0, 8.0, 8.0);
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
    cell.backgroundColor = [UIColor blueColor];
    if (indexPath.section % 2 > 0) {
        cell.backgroundColor = [UIColor yellowColor];
    }
    return cell;
}

#pragma mark - Private

- (UICollectionViewFlowLayout *)flowLayout {
    return (UICollectionViewFlowLayout *)self.collectionViewLayout;
}

@end

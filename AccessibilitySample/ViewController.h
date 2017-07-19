//
//  ViewController.h
//  AccessibilitySample
//
//  Created by Dan Maor on 17/07/2017.
//  Copyright © 2017 Dan Maor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end


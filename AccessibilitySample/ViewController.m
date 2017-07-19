//
//  ViewController.m
//  AccessibilitySample
//
//  Created by Dan Maor on 17/07/2017.
//  Copyright © 2017 Dan Maor. All rights reserved.
//

#import "ViewController.h"
#import "PerfectoCollectionViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Generating Data
    NSMutableArray * cellsArray = [[NSMutableArray alloc] init];
    for (int i=0; i<30; i++)
        [cellsArray addObject:[NSString stringWithFormat:@"Cell #%d",i]];
    
    [self.myCollectionView registerClass:[PerfectoCollectionViewCell class] forCellWithReuseIdentifier:@"perCell"];
    
    self.dataArray = [cellsArray mutableCopy];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(110, 150)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.myCollectionView setCollectionViewLayout:flowLayout];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [self.descriptionLabel setText:[NSString stringWithFormat:@"Selected %@", self.dataArray[indexPath.row]]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"perCell";
    
    PerfectoCollectionViewCell *cell = (PerfectoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell.cellTitle setText:[self.dataArray objectAtIndex:indexPath.row]];
    
    
    // The following section is responsible for exposing the Image Object to Automation
    // Without it the object will not be exposed
    
    UIImage * cellImage = (UIImage *)[cell viewWithTag:99];
    [cellImage setIsAccessibilityElement:YES];
        
    // To allow the usage of a simple XPath Expression the Image must have an accessibility label set.
    // Without it the object will either remain hidden or may not have a direct and simple XPath expression
    
    [cellImage setAccessibilityLabel:[NSString stringWithFormat:@"Image #%ld", (long) indexPath.row]];
    
    
    return cell;
}

@end

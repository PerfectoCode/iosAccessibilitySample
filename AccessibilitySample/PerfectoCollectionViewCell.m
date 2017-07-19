//
//  PerfectoCellCollectionViewCell.m
//  AccessibilitySample
//
//  Created by Dan Maor on 18/07/2017.
//  Copyright © 2017 Dan Maor. All rights reserved.
//

#import "PerfectoCollectionViewCell.h"

@implementation PerfectoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@synthesize cellTitle = _cellTitle;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"PerfectoCollectionViewCell" owner:self options:nil];
        self = [arrayOfViews objectAtIndex:0];
        
    }
    
    return self;
    
}

@end

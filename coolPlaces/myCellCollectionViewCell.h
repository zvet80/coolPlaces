//
//  myCellCollectionViewCell.h
//  coolPlaces
//
//  Created by z on 2/6/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myCellCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *smallLabel;

@property (weak, nonatomic) IBOutlet UIImageView *smallImage;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *effect;

@end

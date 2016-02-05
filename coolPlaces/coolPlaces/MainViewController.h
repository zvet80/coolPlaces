//
//  ViewController.h
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"

@interface MainViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate>

//@property (weak, nonatomic) IBOutlet UICollectionView *collectionCoolest;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionLatest;

@property (weak, nonatomic) Place *addedPlace;

- (IBAction)logout:(UIBarButtonItem *)sender;

- (IBAction)goToMapView:(UIButton *)sender;
//@property (weak, nonatomic) IBOutlet UITableViewCell *cellImage;
//@property (weak, nonatomic) IBOutlet UILabel *celllable;
@property (weak, nonatomic) IBOutlet UITableView *placesTableView;

@end


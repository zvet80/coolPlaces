//
//  ViewController.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "MainViewController.h"
#import "Place.h"
#import "Place_initWithDicts.h"
#import "HttpData.h"
#import <Parse/Parse.h>
#import "AddViewController.h"
#import "CustomCollectionViewCell.h"
#import "PlaceService.h"
#import "AppDelegate.h"
//#import "LaunchViewController.swift"
//#import <coolPLaces/coolPlaces-Swift>

@interface MainViewController (){
    NSMutableArray *places;
    CGFloat picSize;
    CGFloat indent;
}

@property NSInteger slectedPlaceIndex;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    picSize = 150;
    indent = 5;
    places = [[NSMutableArray alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:[Place parseClassName]];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        [objects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Place *place = obj;
            [places addObject:place];
        }];
        
                dispatch_async(dispatch_get_main_queue(), ^{
//                    [self.placesTableView reloadData];
//                    [self.collectionLatest reloadData];
                    
                    [self.collectionLatest reloadData];
                });
    }];
    
    [self.collectionLatest setDataSource:self];
    [self.collectionLatest setDelegate:self];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return places.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize size = CGSizeMake(picSize, picSize);
    return size;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(indent, indent, indent, indent);
}

-(UICollectionViewCell*) collectionView: (UICollectionView*)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"collectionCell";
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell==nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil] objectAtIndex:0];
        cell = [[CustomCollectionViewCell alloc] init];
    }
    
    Place *place = [places objectAtIndex:indexPath.item];
    
    cell.smallLabel.text = place.placeName;
    PFFile *placeImage = place.image;
    
    [placeImage getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        UIImage *imageToShow = [UIImage imageWithData:data];
        
        if (imageToShow==nil) {
            imageToShow = [UIImage imageNamed:@"cliff"];
        }
        
        cell.smallImage.image = imageToShow;
    }];
    
    return cell;
}


-(IBAction)unwind:(UIStoryboardSegue*)sender{
    
}

-(void)showAdd{
    NSString *storyBoardId = @"addScene";
    AddViewController *addVC = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    [self.navigationController pushViewController:addVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logout:(UIBarButtonItem *)sender {
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser];
}

-(void) navigateToLaunch{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    LaunchView *launchVC = [storyboard instantiateViewControllerWithIdentifier:@"Launch"] as! UIViewController;
//    [self presentViewController:launchVC animated:YES completion:nil];
}
- (IBAction)goToMapView:(UIButton *)sender {
}
@end

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
#import "ListWithPLaces.h"
//#import "LaunchViewController.swift"
//#import <coolPLaces/coolPlaces-Swift>

@interface MainViewController (){
    //NSMutableArray *places;
}

@property NSInteger slectedPlaceIndex;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSLog([NSString stringWithFormat:@"%lu",(unsigned long)placesLoadedfromDb.count]);

    
    //places = [[PlaceService alloc] getAllPlaces];
    
//    places = [[NSMutableArray alloc] init];
//    PFQuery *query = [PFQuery queryWithClassName:[Place parseClassName]];
//    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
//        [objects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            Place *place = obj;
//            NSLog(place.placeName);
//            [places addObject:place];
//            NSLog([NSString stringWithFormat:@"%lu",(unsigned long)places.count]);
//        }];
//        [self.collectionCoolest setDataSource:self];
//        [self.collectionCoolest setDelegate:self];
//        
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [self.collectionCoolest reloadData];
//                });
//    }];
//
//    NSLog([NSString stringWithFormat:@"%lu",(unsigned long)places.count]);

    [self.collectionLatest setDataSource:self];
    [self.collectionLatest setDelegate:self];
    
    [self.placesTableView setDataSource:self];
    [self.placesTableView setDelegate:self];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return places.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableCell"];
    }
    
    cell.textLabel.text = [places[indexPath.row] placeName];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return places.count;
}

-(UICollectionViewCell*) collectionView: (UICollectionView*)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"collectionCell";
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil] objectAtIndex:0];
    }
    
    
    Place *place = [places objectAtIndex:indexPath.item];
    
    cell.cellTitle.text = place.placeName;
    
    PFFile *placeImage = place.image;
    //UIImage *imageToShow;
    
    [placeImage getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        UIImage *imageToShow = [UIImage imageWithData:data];
        
        if (imageToShow==nil) {
            imageToShow = [UIImage imageNamed:@"cliff"];
        }
        
        cell.cellImageView.image = imageToShow;
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

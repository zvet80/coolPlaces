//
//  ViewController.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "MainViewController.h"
#import "Place.h"
#import <Parse/Parse.h>
#import "AddViewController.h"
#import "myCellCollectionViewCell.h"
#import "PlaceService.h"
#import "AppDelegate.h"
#import "DetailsViewController.h"
//#import "coolPlaces-Swift.h"
//#import "LaunchView.swift"
//#import "LaunchView.swift"
//#import <coolPLaces/coolPlaces-Swift>

@interface MainViewController ()

@property NSInteger selectedPlaceIndex;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionLatest reloadData];
    [self.collectionLatest layoutIfNeeded];
    [self.collectionLatest setDataSource:self];
    [self.collectionLatest setDelegate:self];
}

-(void)viewDidAppear{
    
        [self.collectionLatest reloadItemsAtIndexPaths:@[@0]];
        [self.collectionLatest reloadSections:[NSIndexSet indexSetWithIndex:0]];
        [self.collectionLatest layoutIfNeeded];
        [self.collectionLatest reloadData];
    }

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return places.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = CGRectGetWidth(self.view.frame)/4.0f;
    CGSize size = CGSizeMake(width, (width*1.1f));
    return size;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGFloat indent=10;
    return UIEdgeInsetsMake(indent, indent, indent, indent);
}

-(UICollectionViewCell*) collectionView: (UICollectionView*)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UINib *nib =[UINib nibWithNibName:@"myCellCollectionViewCell" bundle:nil];
    [self.collectionLatest registerNib:nib forCellWithReuseIdentifier:@"mycell"];
        NSString *cellIdentifier = @"mycell";
    
    myCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell==nil) {
        cell = [[myCellCollectionViewCell alloc] init];
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

-(void)performBatchUpdates:(void(^)(void))updates
                completion:(void (^ _Nullable)(BOOL))completion{
    
}

-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    //UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    //cell.contentView.backgroundColor = [UIColor blueColor];
}

-(void)collectionView:(UICollectionView *)collectionView didUnHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = nil;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selectedPlaceIndex = indexPath.item;
    
    [self performSegueWithIdentifier:@"detailSegue" sender:collectionView];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSString* detailSegueIdentifier = @"detailSegue";
    
    if ([segue.identifier isEqualToString:detailSegueIdentifier]) {
        DetailsViewController* toVC = segue.destinationViewController;
        Place *placeToShow = places[self.selectedPlaceIndex];
        toVC.selectedPlace = placeToShow;
    }
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
    currentUser = nil;
}

-(void) navigateToLaunch{
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    LaunchView *launchVC = [storyboard instantiateViewControllerWithIdentifier:@"Launch"] as UIViewController;
//    [self presentViewController:launchVC animated:YES completion:nil];
}
@end

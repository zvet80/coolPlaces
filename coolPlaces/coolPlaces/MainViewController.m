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

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HttpData *httpData = [[HttpData alloc] init];
    [httpData getAt:@"http://" withCompletionHandler:^(NSDictionary * _Nullable dict) {
        Place *place = [Place placeWithDict:dict];
    }];
    //[self getAll];
    
    
}

-(void) getAll{
    NSString *urlStr=@"";
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@",error);
            return;
        }
        NSError *err;
        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:&err];
                                         
        NSArray *placesDicts = [dataDict objectForKey:@"result"];
        NSMutableArray *places= [NSMutableArray array];
                                         for (int i=0; i<placesDicts.count; i++) {
                                             NSDictionary *placeDict = [placesDicts objectAtIndex:i];
                                             Place *place = [Place placeWithDict: placeDict];
                                         }
        
        NSLog(@"Data: %@",dataDict);
    }]
     resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

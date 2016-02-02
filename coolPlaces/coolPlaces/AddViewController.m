//
//  AddViewController.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "AddViewController.h"
#import "Place_initWithDicts.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlStr=@"";
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //NSDictionary *body = @{@"name":@".."};
    //NSData *bodyData = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:nil];
    Place *place = [Place placeWithName:@"somewhere"];
    NSData *bodyData = [place toNSData];
    
    [request setHTTPMethod:@"POST"];
        [request setHTTPBody:bodyData];
    [request addValue:@"application/json"
   forHTTPHeaderField:@"content-type"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@",error);
            return;
        }
        NSError *err;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        NSLog(@"Data: %@",dict);
    }]
     resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onButtonTapSave:(id)sender {
}
@end

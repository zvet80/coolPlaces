//
//  HttpData.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "HttpData.h"

@implementation HttpData

//-(void)getAt:(NSString *)urlStr withCompletionHandler:(void (^)(NSDictionary * _Nullable))completionHandler{
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    [[[NSURLSession sharedSession]
//    dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        completionHandler(dict);
//    }]
//     resume];
//}

@end
//main



//    HttpData *httpData = [[HttpData alloc] init];
//    [httpData getAt:@"http://" withCompletionHandler:^(NSDictionary * _Nullable dict) {
//        Place *place = [Place placeWithDict:dict];
//    }];
//[self getAll];




//-(void) getAll{
//    NSString *urlStr=@"";
//
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request
//                                     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//                                         if (error) {
//                                             NSLog(@"Error: %@",error);
//                                             return;
//                                         }
//                                         NSError *err;
//                                         NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data
//                                                                                                  options:NSJSONReadingAllowFragments
//                                                                                                    error:&err];
//
//                                         NSArray *placesDicts = [dataDict objectForKey:@"result"];
//                                         NSMutableArray *places= [NSMutableArray array];
//                                         for (int i=0; i<placesDicts.count; i++) {
//                                             NSDictionary *placeDict = [placesDicts objectAtIndex:i];
//                                             Place *place = [Place placeWithDict: placeDict];
//                                         }
//
//                                         NSLog(@"Data: %@",dataDict);
//                                     }]
//     resume];
//}
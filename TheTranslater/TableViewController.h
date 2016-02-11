//
//  TableViewController.h
//  TheTranslater
//
//  Created by Brian Chen on 2/10/16.
//  Copyright © 2016 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property (nonatomic, strong) NSString * titleOfTableView;
@property (nonatomic, strong) NSDictionary * responseData;

@property (nonatomic, strong) NSArray * listAry;
@property (nonatomic, strong) NSArray * numberAry;
@property (nonatomic, strong) NSArray * yearAry;
@property (nonatomic, strong) NSMutableArray * tableAray;


@end

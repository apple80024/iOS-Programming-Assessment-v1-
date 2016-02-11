//
//  TableViewCell.h
//  TheTranslater
//
//  Created by Brian Chen on 2/10/16.
//  Copyright © 2016 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_fullform;
@property (weak, nonatomic) IBOutlet UILabel *lbl_number;
@property (weak, nonatomic) IBOutlet UILabel *lbl_year;

@end

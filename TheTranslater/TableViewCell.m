//
//  TableViewCell.m
//  TheTranslater
//
//  Created by Brian Chen on 2/10/16.
//  Copyright © 2016 Brian Chen. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
@synthesize lbl_fullform = _lbl_fullform;
@synthesize lbl_number = _lbl_number;
@synthesize lbl_year = _lbl_year;

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

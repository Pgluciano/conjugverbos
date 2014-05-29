//
//  MyCell.m
//  conjugverbos
//
//  Created by Peterson Guimarães Luciano on 10/17/13.
//  Copyright (c) 2013 Peterson Guimarães Luciano. All rights reserved.
//

#import "MyCell.h"
#import "ViewVerbosController.h"

@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];

    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

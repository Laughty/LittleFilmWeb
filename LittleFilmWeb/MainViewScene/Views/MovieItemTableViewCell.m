//
//  MovieItemTableViewCell.m
//  LittleFilmWeb
//
//  Created by Piotr Rola on 28/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import "MovieItemTableViewCell.h"

@implementation MovieItemTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)favoriteButtonSwitched:(id)sender {
    UISwitch* switchButton = sender;
    [_delegate stateChangeTo:switchButton.on forCell: self];
}

@end

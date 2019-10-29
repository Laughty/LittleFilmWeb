//
//  MovieItemTableViewCell.h
//  LittleFilmWeb
//
//  Created by Piotr Rola on 28/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MovieItemTableViewProtocol <NSObject>

- (void)stateChangeTo: (BOOL)isFavorite forCell: (UITableViewCell *)cell;

@end

@interface MovieItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISwitch *switchButton;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) id <MovieItemTableViewProtocol> delegate;

@end

NS_ASSUME_NONNULL_END

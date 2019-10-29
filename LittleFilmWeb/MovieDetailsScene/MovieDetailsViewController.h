//
//  MovieDetailsViewController.h
//  LittleFilmWeb
//
//  Created by Piotr Rola on 25/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailsViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetailsViewController : UIViewController<MovieDetailsViewModelProtocol>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (nonatomic, strong) MovieDetailsViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END

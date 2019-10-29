//
//  MovieDetailsViewController.m
//  LittleFilmWeb
//
//  Created by Piotr Rola on 25/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import "MovieDetailsViewController.h"

@interface MovieDetailsViewController ()

@end

@implementation MovieDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel.delegate = self;
    [_viewModel fetchMoviesDetails];
}

- (void)showErrorMessage:(nonnull NSString *)errorMessage {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                   message:errorMessage
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showMovieDetail {
    [_viewModel fetchMovieImageFromURL:_viewModel.movieDetails.imageURL];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.titleLabel.text = self.viewModel.movieDetails.name;
        self.descriptionLabel.text = self.viewModel.movieDetails.shortDescription;
    });
}

- (void)showMovieImage:(nonnull UIImage *)image {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.imageView setImage:image];
    });
}

@end

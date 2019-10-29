//
//  MovieDetailsViewModel.h
//  LittleFilmWeb
//
//  Created by Piotr Rola on 24/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractService.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MovieDetailsViewModelProtocol <NSObject>

- (void)showMovieDetail;
- (void)showMovieImage: (UIImage *)image;
- (void)showErrorMessage:(NSString *)errorMessage;

@end

@interface MovieDetailsViewModel : NSObject

@property (nonatomic, weak) id <MovieDetailsViewModelProtocol> delegate;
@property (nonatomic, strong) MovieDetails* movieDetails;
@property (nonatomic, strong) NSString* movieId;
@property (nonatomic, strong) AbstractService* service;

- (instancetype)initWithService:(AbstractService *)service movieId:(NSString *)movieId;

- (void) fetchMovieImageFromURL:(NSURL *)url;
- (void) fetchMoviesDetails;

@end

NS_ASSUME_NONNULL_END

//
//  MovieDetailsViewModel.m
//  LittleFilmWeb
//
//  Created by Piotr Rola on 24/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import "MovieDetailsViewModel.h"

@implementation MovieDetailsViewModel

- (instancetype)initWithService:(AbstractService *)service movieId:(NSString *)movieId {
    self = [super init];
    if (!self) return nil;

    _service = service;
    _movieId = movieId;

    return self;
}

- (void) fetchMoviesDetails {
    [_service fetchMovie:_movieId success:^(MovieDetails* movie) {
        self.movieDetails = movie;
        [self.delegate showMovieDetail];
    } failure:^(NSString* error){
        [self.delegate showErrorMessage:error];
    }];
}

- (void) fetchMovieImageFromURL:(NSURL *)url {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: self.movieDetails.imageURL];
        if ( data == nil )
            return;
        UIImage* movieImage = [UIImage imageWithData: data];
        [self.delegate showMovieImage:movieImage];
    });
};


@end

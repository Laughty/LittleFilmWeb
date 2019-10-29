//
//  MovieDetails.m
//  LittleFilmWeb
//
//  Created by Piotr Rola on 25/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import "MovieDetails.h"

@implementation MovieDetails

- (instancetype)initWithName:(NSString *)name shortDescription:(NSString *)shortDescription imageURL:(NSURL *)image releaseDate:(NSString *)releaseDate rating:(NSDecimalNumber *)rating movieId:(NSString *)movieId {
    self = [super init];
    if (!self) return nil;

    _name = [name copy];
    _shortDescription = [shortDescription copy];
    _imageURL = [image copy];
    _releaseDate = [releaseDate copy];
    _rating = [rating copy];
    _movieId = [movieId copy];

    return self;
}


@end

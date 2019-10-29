//
//  Movies.m
//  LittleFilmWeb
//
//  Created by Piotr Rola on 25/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import "Movies.h"

@implementation Movies

- (instancetype)initWithMovies:(NSArray *)movies {
    self = [super init];
    if (!self) return nil;

    _movies = [movies copy];

    return self;
}


@end

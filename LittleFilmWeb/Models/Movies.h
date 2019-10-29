//
//  Movies.h
//  LittleFilmWeb
//
//  Created by Piotr Rola on 25/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movies : NSObject


@property (nonatomic, copy) NSArray *movies;

- (instancetype)initWithMovies:(NSArray *)movies;

@end

NS_ASSUME_NONNULL_END

//
//  MovieDetails.h
//  LittleFilmWeb
//
//  Created by Piotr Rola on 25/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetails : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *shortDescription;
@property (nonatomic, copy, readonly) NSURL *imageURL;
@property (nonatomic, copy, readonly) NSString *releaseDate;
@property (nonatomic, copy, readonly) NSDecimalNumber *rating;
@property (nonatomic, copy, readonly) NSString *movieId;

- (instancetype)initWithName:(NSString *)name shortDescription:(NSString *)shortDescription imageURL:(NSURL *)image releaseDate:(NSString *)releaseDate rating:(NSDecimalNumber *)rating movieId:(NSString *)movieId;

@end

NS_ASSUME_NONNULL_END

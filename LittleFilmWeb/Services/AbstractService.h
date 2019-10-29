//
//  AbstractService.h
//  LittleFilmWeb
//
//  Created by Piotr Rola on 25/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface AbstractService : NSObject

-(void) searchWithQuery:(NSString *)searchQuery success:(void (^)(NSArray*))results failure:(void (^)(NSString*))failure;
-(void) fetchMovie:(NSString *)movieId success:(void (^)(MovieDetails*))results failure:(void (^)(NSString*))failure;
-(void) fetchMostPopularWithSuccess:(void (^)(NSArray*))results failure:(void (^)(NSString*))failure;

@end

NS_ASSUME_NONNULL_END

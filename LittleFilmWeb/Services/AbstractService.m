//
//  AbstractService.m
//  LittleFilmWeb
//
//  Created by Piotr Rola on 25/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import "AbstractService.h"

@implementation AbstractService

-(void) searchWithQuery:(NSString *)searchQuery success:(void (^)(NSArray*))results failure:(void (^)(NSString*))failure {}
-(void) fetchMovie:(NSString *)movieId success:(void (^)(NSArray*))results failure:(void (^)(NSString*))failure {}
-(void) fetchMostPopularWithSuccess:(void (^)(NSArray*))results failure:(void (^)(NSString*))failure {}

@end

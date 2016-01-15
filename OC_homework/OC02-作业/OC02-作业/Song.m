//
//  Song.m
//  OC02-作业
//
//  Created by dllo on 15/12/1.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "Song.h"

@implementation Song
-(instancetype)initWithName:(NSString *)name
                     singer:(NSString *)singer
                       date:(NSString *)date {
    self = [super init];
    if (self) {
        _name = name;
        _singer = singer;
        _date = date;
    }
    return self;
}
+(instancetype)songWithName:(NSString *)name
                     singer:(NSString *)singer
                       date:(NSString *)date {

    Song *mysong = [[Song alloc] initWithName:name singer:singer date:date];
    return mysong;

}

@end

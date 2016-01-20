//
//  Model.m
//  UI19_homework_afn_sdimg
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Model.h"

@implementation Model

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

/** 归档时会自动调用此方法*/
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.url forKey:@"url"];
    [aCoder encodeObject:self.digest forKey:@"digest"];
    [aCoder encodeObject:self.docid forKey:@"docid"];
    [aCoder encodeObject:self.imgsrc forKey:@"imgsrc"];
}

/** 反归档 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.url = [aDecoder decodeObjectForKey:@"url"];
        self.digest = [aDecoder decodeObjectForKey:@"digest"];
        self.docid = [aDecoder decodeObjectForKey:@"docid"];
        self.imgsrc = [aDecoder decodeObjectForKey:@"imgsrc"];
    }
    
    return self;
}


- (void)dealloc {
    [_title release];
    [_digest release];
    [_url release];
    [_imgsrc release];
    [_docid release];
    [super dealloc];
}
@end

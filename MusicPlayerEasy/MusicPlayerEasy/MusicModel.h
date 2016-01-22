//
//  MusicModel.h
//  MusicPlayerEasy
//
//  Created by JiangChile on 16/1/22.
//  Copyright (c) 2016年 JiangChile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicModel : NSObject

@property (nonatomic, copy)NSString *album;
@property (nonatomic, copy)NSString *artists_name;
@property (nonatomic, copy)NSString *blurPicUrl;
@property (nonatomic, assign)NSInteger duration;
@property (nonatomic, assign)NSInteger ID;
@property (nonatomic, copy)NSString *lyric;
@property (nonatomic, copy)NSString *mp3Url;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *picUrl;
@property (nonatomic, copy)NSString *singer;

- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)musicModelWithDic:(NSDictionary *)dic;


@end

//
//  SongsView.h
//  MusicPlayerEasy
//
//  Created by JiangChile on 16/1/22.
//  Copyright (c) 2016年 JiangChile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicModel.h"

@interface SongsView : UIView

typedef void(^MyBlock)(MusicModel *);
@property (nonatomic, copy) MyBlock myBlock;

- (instancetype)initWithFrame:(CGRect)frame Array:(NSMutableArray *)array;


@end

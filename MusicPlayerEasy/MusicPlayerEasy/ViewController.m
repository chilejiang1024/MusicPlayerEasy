//
//  ViewController.m
//  MusicPlayerEasy
//
//  Created by JiangChile on 16/1/22.
//  Copyright (c) 2016年 JiangChile. All rights reserved.
//

#import "ViewController.h"
#import "SongsView.h"
#import "PlayViewController.h"
#import "MusicModel.h"


@interface ViewController ()

@property (nonatomic, retain) NSMutableArray *listArray;

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (NSMutableArray *)listArray {
    if (_listArray == nil) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"歌单";
    
    __block UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.frame = CGRectMake(0, 0, 100, 100);
    indicator.center = self.view.center;
    indicator.color = [UIColor blackColor];
    indicator.backgroundColor = [UIColor lightGrayColor];
    [indicator startAnimating];
    [self.view addSubview:indicator];
    
    //多线程操作，耗时操作放子线程，关于UI的操作主线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.listArray = [self requestWithUrlString:@"http://project.lanou3g.com/teacher/UIAPI/MusicInfoList.plist"];
        NSLog(@".........%@", self.listArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            // main queue
            [indicator stopAnimating];
            [self createView];
        });
    });
    
    
}

- (NSMutableArray *)requestWithUrlString:(NSString *)urlStr
{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSArray *array = [NSArray arrayWithContentsOfURL:url];
    NSLog(@"--------%@", array); // 接收请求的结果
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSDictionary *item in array) {
        MusicModel *model = [MusicModel musicModelWithDic:item];
        [dataArray addObject:model];
    }
    return dataArray;
}


- (void)createView {
    SongsView *songsView = [[SongsView alloc] initWithFrame:CGRectMake(0, 64, 375, 667 - 64) Array:self.listArray];
    songsView.myBlock = ^(MusicModel *model){
        PlayViewController *playVC = [[PlayViewController alloc] init];
        playVC.model = model;
        [self.navigationController pushViewController:playVC animated:YES];
    };
    [self.view addSubview:songsView];
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

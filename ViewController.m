//
//  ViewController.m
//  libTest
//
//  Created by 黄博闻 on 16/5/26.
//  Copyright (c) 2016年 黄博闻. All rights reserved.
//

#import "ViewController.h"
#import "imageScroll.h"

@interface ViewController ()
@property(nonatomic,strong)UIScrollView *sv;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url1 = [NSURL URLWithString:@"http://imgsrc.baidu.com/forum/pic/item/f451570c7cc855b38cb10dfc.jpg"];
    NSURL *url2 = [NSURL URLWithString:@"http://imgsrc.baidu.com/forum/w%3D580/sign=c99f99b06709c93d07f20effaf3cf8bb/1945d5cec3fdfc0392cd3006d43f8794a5c22614.jpg"];
    NSURL *url3 = [NSURL URLWithString:@"http://imgsrc.baidu.com/forum/w%3D580/sign=7b7f335b5bb5c9ea62f303ebe538b622/93d81624ab18972b9be3059ae6cd7b899c510ad6.jpg"];
    NSURL *url4 = [NSURL URLWithString:@"http://imgsrc.baidu.com/forum/w%3D580/sign=8bf147894134970a47731027a5cbd1c0/ea7e893df8dcd10099837787728b4710b8122fb6.jpg"];
    NSURL *url5 = [NSURL URLWithString:@"http://imgsrc.baidu.com/forum/w%3D580/sign=d21c9022a40f4bfb8cd09e5c334e788f/277f9e2f070828384f2e23a9b899a9014c08f168.jpg"];
    NSURL *url6 = [NSURL URLWithString:@"http://imgsrc.baidu.com/forum/pic/item/d4628535e5dde7115f9bcc50a7efce1b9c1661cf.jpg"];
    NSMutableArray *urlArray = [NSMutableArray arrayWithObjects:url1,url2,url3, url4,url5,url6,nil];
//    http://imgsrc.baidu.com/forum/pic/item/f451570c7cc855b38cb10dfc.jpg
//    http://imgsrc.baidu.com/forum/w%3D580/sign=c99f99b06709c93d07f20effaf3cf8bb/1945d5cec3fdfc0392cd3006d43f8794a5c22614.jpg
//    http://imgsrc.baidu.com/forum/w%3D580/sign=7b7f335b5bb5c9ea62f303ebe538b622/93d81624ab18972b9be3059ae6cd7b899c510ad6.jpg
//
//    http://imgsrc.baidu.com/forum/w%3D580/sign=8bf147894134970a47731027a5cbd1c0/ea7e893df8dcd10099837787728b4710b8122fb6.jpg
//    http://imgsrc.baidu.com/forum/w%3D580/sign=d21c9022a40f4bfb8cd09e5c334e788f/277f9e2f070828384f2e23a9b899a9014c08f168.jpg
//    http://imgsrc.baidu.com/forum/pic/item/d4628535e5dde7115f9bcc50a7efce1b9c1661cf.jpg
    
    NSLog(@"ok1");
    imageScroll *sv = [[imageScroll alloc]init];
    _sv = [sv carouseIImageWithURLArray:urlArray width:200 height:200];
    NSLog(@"ok2");
    [_sv setFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:_sv];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

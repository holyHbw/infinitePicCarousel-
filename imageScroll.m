//
//  imageScroll.m
//  carouselImageLib
//
//  Created by 黄博闻 on 16/5/26.
//  Copyright (c) 2016年 黄博闻. All rights reserved.
//

#import "imageScroll.h"

@implementation imageScroll
BOOL firstScroll = YES;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(UIScrollView *)carouseIImageWithURLArray:(NSMutableArray *)urlArray width:(CGFloat)width height:(CGFloat)height{

    NSLog(@"carouseIImageWithURLArray");
    _currentIndex = 0;
    _numofimage = [urlArray count];
    _urlArray = urlArray;
    _width = width;
    _height = height;
    self.delegate = self;
    self.pagingEnabled = YES;
    
    NSLog(@"1");
    [self setFramOfImageViewWidth:width height:height];
    NSLog(@"2");
    [self initImageWithArray:(NSMutableArray *)_urlArray];
    NSLog(@"3");
    [self setSVContentSizeForArray];
    NSLog(@"4");
    
    return self;
}

-(UIScrollView *)carouseIImageWithURLArray:(NSMutableArray *)urlArray withDetialArray:(NSMutableArray *)detialArray width:(CGFloat)width height:(CGFloat)height{

    _currentIndex = 0;
    _numofimage = [urlArray count];
    _urlArray = urlArray;
    _detialArray = detialArray;
    _width = width;
    _height = height;
    self.delegate = self;
    self.pagingEnabled = YES;
    
    [self setFramOfImageViewWidth:width height:height];
    [self initImageWithArray:(NSMutableArray *)_urlArray];
    [self setSVContentSizeForArray];
    
    return self;
}

-(UIScrollView *)carouseIImageWithURLDict:(NSMutableDictionary *)urlDict width:(CGFloat)width height:(CGFloat)height{
    
    _currentIndex = 0;
    _numofimage = [urlDict count];
    _urlDict = urlDict;
    _width = width;
    _height = height;
    self.delegate = self;
    self.pagingEnabled = YES;
    
    [self setFramOfImageViewWidth:width height:height];
    [self initImageWithDict:(NSMutableDictionary *)_urlDict];
    [self setSVContentSizeForDict];
    
    return self;
}


-(UIScrollView *)carouseIImageWithURLDict:(NSMutableDictionary *)urlDict withDetialDict:(NSMutableDictionary *)detialDict width:(CGFloat)width height:(CGFloat)height{
    
    _currentIndex = 0;
    _numofimage = [urlDict count];
    _urlDict = urlDict;
    _detialDict = detialDict;
    _width = width;
    _height = height;
    self.delegate = self;
    self.pagingEnabled = YES;
    
    [self setFramOfImageViewWidth:width height:height];
    [self initImageWithDict:(NSMutableDictionary *)_urlDict];
    [self setSVContentSizeForDict];
    
    return self;
}

-(void)setFramOfImageViewWidth:(CGFloat)width height:(CGFloat)height{

    CGRect rect1 = CGRectMake(0, 0, _width, _height);
    CGRect rect2 = CGRectMake(_width, 0, _width, _height);
    CGRect rect3 = CGRectMake(_width*2, 0, _width, _height);
    _leftImageView = [[UIImageView alloc]initWithFrame:rect1];
    _centerImageView = [[UIImageView alloc]initWithFrame:rect2];
    _rightImageView = [[UIImageView alloc]initWithFrame:rect3];
    [self addSubview:_leftImageView];
    [self addSubview:_centerImageView];
    [self addSubview:_rightImageView];
}

-(void)initImageWithArray:(NSMutableArray *)array{

    _leftIndex = 0;
    _currentIndex =1;
    _rightIndex = 2;
    NSString *urlStr1 =[NSString stringWithFormat:@"%@", [array objectAtIndex:_leftIndex]];
    NSURL *url1 = [NSURL URLWithString:urlStr1];
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    NSString *urlStr2 =[NSString stringWithFormat:@"%@", [array objectAtIndex:_currentIndex]];
    NSURL *url2 = [NSURL URLWithString:urlStr2];
    NSData *data2 = [NSData dataWithContentsOfURL:url2];
    NSString *urlStr3 =[NSString stringWithFormat:@"%@", [array objectAtIndex:_rightIndex]];
    NSURL *url3 = [NSURL URLWithString:urlStr3];
    NSData *data3 = [NSData dataWithContentsOfURL:url3];

    [_leftImageView setImage:[UIImage imageWithData:data1]];
    [_centerImageView setImage:[UIImage imageWithData:data2]];
    [_rightImageView setImage:[UIImage imageWithData:data3]];

}

-(void)initImageWithDict:(NSMutableDictionary *)dict{
    
    _leftIndex = 0;
    _currentIndex =1;
    _rightIndex = 2;
    NSString *str1 = [NSString stringWithFormat:@"%ld",_leftIndex];
    NSString *urlstr1 = [NSString stringWithFormat:@"%@",[dict objectForKey:str1]];
    NSURL *url1 = [NSURL URLWithString:urlstr1];
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    
    NSString *str2 = [NSString stringWithFormat:@"%ld",_currentIndex];
    NSString *urlstr2 = [NSString stringWithFormat:@"%@",[dict objectForKey:str2]];
    NSURL *url2 = [NSURL URLWithString:urlstr2];
    NSData *data2 = [NSData dataWithContentsOfURL:url2];
    
    NSString *str3 = [NSString stringWithFormat:@"%ld",_rightIndex];
    NSString *urlstr3 = [NSString stringWithFormat:@"%@",[dict objectForKey:str3]];
    NSURL *url3 = [NSURL URLWithString:urlstr3];
    NSData *data3 = [NSData dataWithContentsOfURL:url3];
    
    [_leftImageView setImage:[UIImage imageWithData:data1]];
    [_centerImageView setImage:[UIImage imageWithData:data2]];
    [_rightImageView setImage:[UIImage imageWithData:data3]];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    //当scrollView停止滚动的时候，更新三个imageView的图片，并将centerImageView重新置于中间，也就是设置scrollView的contentOffset为（width，0）
    //要永远保持下面的状态
    //                   初始0              初始1               初始2
    //                 leftImage    |      screen      |    rightImage
    //                 leftImage    | centerImage |    rightImage

        [self reloadImage];
    
    
}

-(void)reloadImage{
    
    CGPoint offset = self.contentOffset;
    if (firstScroll) {
        if (offset.x == _width) {
             //说明是往左划了一格,改变index
            _currentIndex = 1;
            firstScroll = NO;
            NSLog(@"first");
        }
    }else if (offset.x == 2*_width) {
        //说明是往左划了一格,改变index
        NSLog(@"left");
        _leftIndex = _currentIndex;
        _currentIndex = (_currentIndex+1+_numofimage)%_numofimage;
        _rightIndex = (_rightIndex+1+_numofimage)%_numofimage;
        NSLog(@"%ld %ld %ld",(long)_leftIndex,(long)_currentIndex,(long)_rightIndex);
        //重新设置imageView的url，并复位
        NSString *urlstr1 = [NSString stringWithFormat:@"%@",_urlArray[_leftIndex]];
        NSURL *url1 = [NSURL URLWithString:urlstr1];
        NSData *data1 = [NSData dataWithContentsOfURL:url1];
        
        NSString *urlstr2 = [NSString stringWithFormat:@"%@",_urlArray[_currentIndex]];
        NSURL *url2 = [NSURL URLWithString:urlstr2];
        NSData *data2 = [NSData dataWithContentsOfURL:url2];
        
        NSString *urlstr3 = [NSString stringWithFormat:@"%@",_urlArray[_rightIndex]];
        NSURL *url3 = [NSURL URLWithString:urlstr3];
        NSData *data3 = [NSData dataWithContentsOfURL:url3];
        [_leftImageView setImage:[UIImage imageWithData:data1]];
        [_centerImageView setImage:[UIImage imageWithData:data2]];
        [_rightImageView setImage:[UIImage imageWithData:data3]];
        
        [self setContentOffset:CGPointMake(_width, 0)];
    }else if (offset.x == 0){
        //说明是往右划了一格,改变index
        NSLog(@"right");
        _rightIndex = _currentIndex;
        _currentIndex = (_currentIndex-1+_numofimage)%_numofimage;
        _leftIndex = (_leftIndex-1+_numofimage)%_numofimage;;
        
        //重新设置imageView的url，并复位
        NSString *urlstr1 = [NSString stringWithFormat:@"%@",_urlArray[_leftIndex]];
        NSURL *url1 = [NSURL URLWithString:urlstr1];
        NSData *data1 = [NSData dataWithContentsOfURL:url1];
        
        NSString *urlstr2 = [NSString stringWithFormat:@"%@",_urlArray[_currentIndex]];
        NSURL *url2 = [NSURL URLWithString:urlstr2];
        NSData *data2 = [NSData dataWithContentsOfURL:url2];
        
        NSString *urlstr3 = [NSString stringWithFormat:@"%@",_urlArray[_rightIndex]];
        NSURL *url3 = [NSURL URLWithString:urlstr3];
        NSData *data3 = [NSData dataWithContentsOfURL:url3];
        
        [_leftImageView setImage:[UIImage imageWithData:data1]];
        [_centerImageView setImage:[UIImage imageWithData:data2]];
        [_rightImageView setImage:[UIImage imageWithData:data3]];
        
        [self setContentOffset:CGPointMake(_width, 0)];
    }
}

-(void)setSVContentSizeForArray{

    [self setContentSize:CGSizeMake([_urlArray count]*_width, 0)];
}
-(void)setSVContentSizeForDict{
    
    [self setContentSize:CGSizeMake([_urlDict count]*_width, 0)];
}


@end

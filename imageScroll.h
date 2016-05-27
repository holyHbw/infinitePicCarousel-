//
//  imageScroll.h
//  carouselImageLib
//
//  Created by 黄博闻 on 16/5/26.
//  Copyright (c) 2016年 黄博闻. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imageScroll : UIScrollView<UIScrollViewDelegate>

@property(nonatomic,strong)UIImageView *leftImageView;
@property(nonatomic,strong)UIImageView *centerImageView;
@property(nonatomic,strong)UIImageView *rightImageView;

//数据源：数组1，2
@property(nonatomic,strong)NSMutableArray *urlArray;
@property(nonatomic,strong)NSMutableArray *detialArray;

//数据源：字典1，2
@property(nonatomic,strong)NSMutableDictionary *urlDict;
@property(nonatomic,strong)NSMutableDictionary *detialDict;

//每张图片的尺寸,width,height
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;

//中间图片的index
@property(nonatomic,assign)NSInteger leftIndex;
@property(nonatomic,assign)NSInteger currentIndex;
@property(nonatomic,assign)NSInteger rightIndex;
//图片总数量
@property(nonatomic,assign)NSInteger numofimage;

//function
-(UIScrollView *)carouseIImageWithURLArray:(NSMutableArray *)urlArray width:(CGFloat)width height:(CGFloat)height;

-(UIScrollView *)carouseIImageWithURLArray:(NSMutableArray *)urlArray withDetialArray:(NSMutableArray *)detialArray width:(CGFloat)width height:(CGFloat)height;

-(UIScrollView *)carouseIImageWithURLDict:(NSMutableDictionary *)urlDict width:(CGFloat)width height:(CGFloat)height;

-(UIScrollView *)carouseIImageWithURLDict:(NSMutableDictionary *)urlDict withDetialDict:(NSMutableDictionary *)detialDict width:(CGFloat)width height:(CGFloat)height;


@end

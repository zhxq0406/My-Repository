//
//  PhotoCell.m
//  ZXQHomeOfTheCar
//
//  Created by zxq on 16/4/12.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "PhotoCell.h"
#import "photos.h"

@implementation PhotoCell

-(void)setModel:(ImageModel *)model{

    _model = model;
    NSMutableArray *UrlArray = [[NSMutableArray alloc]init];
    NSArray *photoModels = _model.photos;
    for (int i=0; i<photoModels.count; i++) {
        photos *photoModel = photoModels[i];
        [UrlArray addObject:photoModel.smallPath];
    }
    
    //NSLog(@"model====%@",photoModel.smallPath);
    //NSLog(@"model====%@",photoModel.smallPath);
    
    
    NSLog(@"%@",UrlArray);
    [self.photo1 setImageWithURL:[NSURL URLWithString:UrlArray[0]]];
    [self.photo2 setImageWithURL:[NSURL URLWithString:UrlArray[1]]];
    [self.photo3 setImageWithURL:[NSURL URLWithString:UrlArray[2]]];
    [self.photo4 setImageWithURL:[NSURL URLWithString:UrlArray[3]]];
    [self.photo5 setImageWithURL:[NSURL URLWithString:UrlArray[4]]];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

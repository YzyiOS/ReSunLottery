//
//  RSNarBtnCollectionCell.h
//  RedSunLottery
//
//  Created by haozhong on 2017/11/21.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol ProtocolDelegate
- (void)backSelectBtn:(NSInteger)num;

@end

@interface RSNarBtnCollectionCell : UICollectionViewCell

- (void)setUIIndepathNum:(NSInteger)row;
@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, assign) BOOL selectBtn;
@property (nonatomic, weak) id<ProtocolDelegate> delegate;

@end

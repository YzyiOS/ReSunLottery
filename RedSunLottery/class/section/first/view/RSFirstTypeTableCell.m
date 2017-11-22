//
//  RSFirstTypeTableCell.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/17.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSFirstTypeTableCell.h"
#import "RSFirstTypeCell.h"
#import "RSSSQVC.h"

@interface RSFirstTypeTableCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,assign) CGFloat cellHei;

@property (nonatomic, strong) UICollectionView *collectionView;
@end


@implementation RSFirstTypeTableCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUI];
    }
    return self;
    
}
+ (instancetype)deque:(UITableView *)tableView Style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellHei:(CGFloat)cellHei{
    RSFirstTypeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[RSFirstTypeTableCell alloc] initWithStyle:style reuseIdentifier:reuseIdentifier];
        
    }
    return  cell;
}
- (void)setLotteryArr:(NSArray *)lotteryArr{
    _lotteryArr = lotteryArr;
    _collectionView.height = lotteryArr.count/ 3 * 145;
    [_collectionView reloadData];
    
}
- (void)setUI{
    float w_width = (k_WIDTH) / 3;
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize =CGSizeMake(w_width, w_width + 20);
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    _collectionView  = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, 450) collectionViewLayout:layout];
    _collectionView.scrollEnabled = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RSFirstTypeCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"RSFirstTypeCell"];
    [self.contentView addSubview:_collectionView];
}
#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.lotteryArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RSFirstTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RSFirstTypeCell" forIndexPath:indexPath];
    cell.model = self.lotteryArr[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    RSSSQVC *vc = [[RSSSQVC alloc] init];
    
    [[RSTools getTopVC].navigationController pushViewController:vc animated:YES];
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  RSNarBtnCollectionView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/21.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSNarBtnCollectionView.h"
#import "RSNarBtnCollectionCell.h"

@interface RSNarBtnCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,ProtocolDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) NSInteger selectNum;//记录选中的按钮

@end

@implementation RSNarBtnCollectionView

//#pragma mark - 创建单例
//+ (RSNarBtnCollectionView *)sharedInstance{
//    static RSNarBtnCollectionView *vc;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        vc = [[RSNarBtnCollectionView alloc] init];
//    });
//
//    return vc;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    _selectNum = 1;
//    self.view.frame = CGRectMake(0, 64, k_WIDTH, k_HEIGHT);
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        [self.view removeFromSuperview];
    }];
    
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}
- (void)tapClick:(UITapGestureRecognizer *)tap{
    
    
}
- (void)setModelArr:(NSArray *)modelArr{
    _modelArr = modelArr;
    
    [self.view addSubview:self.collectionView];
    
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        float w_width = (k_WIDTH - 45) / 3;
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize =CGSizeMake(w_width, 41);
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 20);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        _collectionView  = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, k_WIDTH, _modelArr.count * 45) collectionViewLayout:layout];
        _collectionView.scrollEnabled = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RSNarBtnCollectionCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"RSNarBtnCollectionCell"];
    }
    
    return _collectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.modelArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RSNarBtnCollectionCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"RSNarBtnCollectionCell" forIndexPath:indexPath];
    if (indexPath.row + 1 == _selectNum ) {
        cell.selectBtn = YES;
    }else{
        cell.selectBtn = NO;
    }
    
    [cell setUIIndepathNum:indexPath.row + 1];
    
    cell.titleStr = self.modelArr[indexPath.row];
    cell.delegate = self;
    return cell;
}
- (void)backSelectBtn:(NSInteger)num{
    _selectNum = num;
    [self.delegate backSelectNum:num];
    [self.collectionView reloadData];
    
    [self.view removeFromSuperview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  RSNarBtnCollectionView.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/21.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSNarBtnCollectionView.h"
#import "RSNarBtnCollectionCell.h"

@interface RSNarBtnCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation RSNarBtnCollectionView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
}
- (void)setModelArr:(NSArray *)modelArr{
    _modelArr = modelArr;
    
    [self.collectionView reloadData];
    
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        float w_width = (k_WIDTH - 45) / 3;
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize =CGSizeMake(w_width, 41);
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 20);
        layout.minimumInteritemSpacing = 15;
        layout.minimumLineSpacing = 14;
        _collectionView  = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, 450) collectionViewLayout:layout];
        _collectionView.scrollEnabled = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
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
    
    return cell;
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

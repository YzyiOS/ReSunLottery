//
//  RSFirstTypeCollectionVC.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/17.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSFirstTypeCollectionVC.h"
#import "RSFirstTypeCell.h"

@interface RSFirstTypeCollectionVC ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation RSFirstTypeCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLoadView];
    // Do any additional setup after loading the view.
}
- (void)setLoadView{
    float w_width = (k_WIDTH) / 3;
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置collectionView滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置headerView的尺寸大小
    //    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 100);
    //该方法也可以设置itemSize
    layout.itemSize =CGSizeMake(w_width, w_width);
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 0;
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = K_GRAY_BG_COLOR;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = NO;
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RSFirstTypeCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"RSFirstTypeCell"];
    [self.view addSubview:self.collectionView];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RSFirstTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RSFirstTypeCell" forIndexPath:indexPath];
    
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

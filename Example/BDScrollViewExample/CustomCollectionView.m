//
//  CustomCollectionView.m
//  BDScrollViewExample
//

#import "CustomCollectionView.h"

#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height
#define RGBColor(r,g,b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface CustomCollectionView () <BDCollectionViewDataSource, BDCollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray * itemSizes;
@property (nonatomic, assign) NSInteger numberOfItems;

@end

@implementation CustomCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)_layout {
    self = [super initWithFrame:frame collectionViewLayout:_layout];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    BDCollectionViewFlowLayout * layout = self.bd_collectionViewLayout;
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.bdDelegate = self;
    self.bdDataSource = self;
    [self registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"item"];
}

- (void)refreshView {
    _numberOfItems = 30;
    [self reloadData];
}

- (NSMutableArray *)itemSizes {
    if (nil == _itemSizes) {
        _itemSizes = [NSMutableArray array];
        [_itemSizes addObject:[NSValue valueWithCGSize:CGSizeMake(100, 100)]];
        [_itemSizes addObject:[NSValue valueWithCGSize:CGSizeMake(100, 80)]];
        [_itemSizes addObject:[NSValue valueWithCGSize:CGSizeMake(100, 70)]];
        [_itemSizes addObject:[NSValue valueWithCGSize:CGSizeMake(100, 90)]];
    }
    return _itemSizes;
}

#pragma mark - BDCollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(BDCollectionViewFlowLayout *)layout numberOfColumnsInSection:(NSInteger)section {
    return 2;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.itemSizes objectAtIndex:indexPath.row % 4] CGSizeValue];
}

- (NSInteger)numberOfSectionsInBDCollectionView:(UICollectionView *)collectionView {
    if (_numberOfItems <= 0) {
        return 0;
    }
    return 1;
}

- (NSInteger)bdCollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _numberOfItems;
}

- (UICollectionViewCell *)bdCollectionView:(BDCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    cell.backgroundColor = RGBColor(150, 215, 200);
    // title
    UILabel * title = [cell viewWithTag:888];
    if (nil == title) {
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        title.tag = 888;
        title.textColor = [UIColor whiteColor];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont systemFontOfSize:16];
        [cell addSubview:title];
    }
    title.center = CGPointMake(cell.frame.size.width/2, cell.frame.size.height/2);
    title.text = [NSString stringWithFormat:@"Item %ld",indexPath.item];
    return cell;
}

@end

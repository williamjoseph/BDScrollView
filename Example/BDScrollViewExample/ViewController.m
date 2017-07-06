//
//  ViewController.m
//  BDScrollViewExample
//

#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import <BDScrollView/BDScrollView.h>
#import "CustomTableView.h"
#import "CustomCollectionView.h"
#import <objc/message.h>

@interface ViewController () <BDScrollViewDataSource, BDScrollViewDelegate>

@property (nonatomic, strong) BDScrollView *bdScrollView;
@property (nonatomic, strong) BDHeaderView *headerView;
@property (nonatomic, strong) BDSegmentView *segmenView;

@property (nonatomic, strong) CustomTableView *tableView;
@property (nonatomic, strong) CustomCollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bdScrollView = [[BDScrollView alloc]initWithFrame:self.view.bounds];
    _bdScrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _bdScrollView.delegate = self;
    _bdScrollView.dataSource = self;
    _bdScrollView.shouldAdjustContentSize = YES;
    _bdScrollView.headerView = self.headerView;
    _bdScrollView.headerBar = self.segmenView;
    _bdScrollView.headerTopInset = 0;
    [self.view addSubview:_bdScrollView];
    
    //navigationController
    //[_bdScrollView.contentView.panGestureRecognizer requireGestureRecognizerToFail:self.screenEdgePanGestureRecognizer];
}

- (UIScreenEdgePanGestureRecognizer *)screenEdgePanGestureRecognizer {
    UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer = nil;
    if (self.navigationController.view.gestureRecognizers.count > 0) {
        for (UIGestureRecognizer *recognizer in self.navigationController.view.gestureRecognizers) {
            if ([recognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
                screenEdgePanGestureRecognizer = (UIScreenEdgePanGestureRecognizer *)recognizer;
                break;
            }
        }
    }
    return screenEdgePanGestureRecognizer;
}

- (BDHeaderView *)headerView {
    if (!_headerView) {
        UIImage *headerImage = [UIImage imageNamed:@"bike"];
        _headerView = [[BDHeaderView alloc] init];
        _headerView.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth * (headerImage.size.height/headerImage.size.width));
        
        UIImageView *headerImageView = [[UIImageView alloc] initWithImage:headerImage];
        headerImageView.contentMode = UIViewContentModeScaleAspectFill;
        headerImageView.frame = _headerView.bounds;
        headerImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [_headerView addSubview:headerImageView];
    }
    return _headerView;
}

- (BDSegmentView *)segmenView {
    if (!_segmenView) {
        __weak typeof(self) weakSelf = self;
        _segmenView = [[BDSegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40) titles:@[@"Item0",@"Item1"] clickBlick:^(NSInteger index) {
            [weakSelf.bdScrollView scrollToItemAtIndex:index - 1 animated:NO];
            [weakSelf refreshView];
        }];
    }
    return _segmenView;
}

- (CustomTableView *)tableView {
    if (!_tableView) {
        _tableView = [[CustomTableView alloc]initWithFrame:_bdScrollView.bounds style:UITableViewStylePlain];
    }
    return _tableView;
}

- (CustomCollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[CustomCollectionView alloc] initWithFrame:_bdScrollView.bounds];
    }
    return _collectionView;
}

- (void)refreshView {
    ((void (*)(void *, SEL))objc_msgSend)((__bridge void *)(self.bdScrollView.currentItemView),@selector(refreshView));
}

#pragma mark - BDScrollView
- (NSInteger)numberOfItemsInBDScrollView:(BDScrollView *)bdScrollView {
    return 2;
}

- (UIScrollView *)bdScrollView:(BDScrollView *)bdScrollView viewForItemAtIndex:(NSInteger)index reusingView:(UIScrollView *)view {
    switch (index) {
        case 0: {
            CustomTableView *customTableView = self.tableView;
            [customTableView refreshView];
            view = customTableView;
            break;
        }
            
        case 1: {
            CustomCollectionView *customCollectionView = self.collectionView;
            [customCollectionView refreshView];
            view = customCollectionView;
            break;
        }
            
        default:
            break;
    }
    
    return view;
}

- (void)bdScrollViewCurrentItemIndexDidChange:(BDScrollView *)bdScrollView {
    _segmenView.defaultIndex = bdScrollView.currentItemIndex + 1;
}

- (void)bdScrollViewDidEndDecelerating:(BDScrollView *)bdScrollView {
    [self refreshView];
}

@end

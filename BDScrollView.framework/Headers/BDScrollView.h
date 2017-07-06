//
//  BDScrollView.h
//  BDScrollView
//

#import <UIKit/UIKit.h>
#import "BDHeaderView.h"
#import "BDSegmentView.h"

@protocol BDScrollViewDataSource;
@protocol BDScrollViewDelegate;
@interface BDScrollView : UIView

@property (nonatomic, weak) id<BDScrollViewDelegate>delegate;
@property (nonatomic, weak) id<BDScrollViewDataSource>dataSource;
@property (nonatomic, readonly, strong) UICollectionView * contentView;

#define BD_PULLTOREFRESH_HEADER_HEIGHT  MJRefreshHeaderHeight

@property (nonatomic, strong) UIView * headerView;
@property (nonatomic, strong) UIView * headerBar;
@property (nonatomic, assign) CGFloat headerTopInset;
@property (nonatomic, readonly) NSInteger currentItemIndex;
@property (nonatomic, readonly, strong) UIScrollView * currentItemView;
@property (nonatomic, assign) BOOL alwaysBounceHorizontal;
@property (nonatomic, assign) BOOL shouldAdjustContentSize;
@property (nonatomic, assign) BOOL headerBarScrollDisabled;
@property (nonatomic, assign) BOOL scrollEnabled;

- (void)reloadData;
- (void)scrollToItemAtIndex:(NSInteger)index animated:(BOOL)animated;

@end

@protocol BDScrollViewDataSource <NSObject>

- (NSInteger)numberOfItemsInBDScrollView:(BDScrollView *)bdScrollView;
- (UIScrollView *)bdScrollView:(BDScrollView *)bdScrollView viewForItemAtIndex:(NSInteger)index reusingView:(UIScrollView *)view;

@end

@protocol BDScrollViewDelegate <NSObject>

@optional
- (void)bdScrollViewDidScroll:(BDScrollView *)bdScrollView;
- (void)bdScrollViewCurrentItemIndexDidChange:(BDScrollView *)bdScrollView;
- (void)bdScrollViewWillBeginDragging:(BDScrollView *)bdScrollView;
- (void)bdScrollViewDidEndDragging:(BDScrollView *)bdScrollView willDecelerate:(BOOL)decelerate;
- (void)bdScrollViewWillBeginDecelerating:(BDScrollView *)bdScrollView;
- (void)bdScrollViewDidEndDecelerating:(BDScrollView *)bdScrollView;
- (void)bdScrollViewDidEndScrollingAnimation:(BDScrollView *)bdScrollView;
- (BOOL)bdScrollView:(BDScrollView *)bdScrollView shouldSelectItemAtIndex:(NSInteger)index;
- (void)bdScrollView:(BDScrollView *)bdScrollView didSelectItemAtIndex:(NSInteger)index;

- (BOOL)bdScrollView:(BDScrollView *)bdScrollView shouldPullToRefreshAtIndex:(NSInteger)index; // default is YES if defined BD_PULLTOREFRESH_HEADER_HEIGHT,otherwise is NO.
- (CGFloat)bdScrollView:(BDScrollView *)bdScrollView heightForRefreshHeaderAtIndex:(NSInteger)index; // default is BD_PULLTOREFRESH_HEADER_HEIGHT if defined BD_PULLTOREFRESH_HEADER_HEIGHT,otherwise is CGFLOAT_MAX(not set pull to refesh).

@end

/** Weak refrence of BDScrollView for UIScrollView */
@interface UIScrollView (BDScrollView)
@property (nonatomic, readonly, weak) BDScrollView * bdScrollView;
@end


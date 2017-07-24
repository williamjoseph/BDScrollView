//
//  BDHeaderView.h
//  BDScrollView
//

#import <UIKit/UIKit.h>

@class BDHeaderView;
@protocol BDHeaderViewDelegate <NSObject>

- (CGPoint)minHeaderViewFrameOrgin;
- (CGPoint)maxHeaderViewFrameOrgin;

@optional
- (void)headerViewDidFrameChanged:(BDHeaderView *)headerView;
- (void)headerView:(BDHeaderView *)headerView didPan:(UIPanGestureRecognizer *)pan;
- (void)headerView:(BDHeaderView *)headerView didPanGestureRecognizerStateChanged:(UIPanGestureRecognizer *)pan;

@end


/**
 采用 UIKitDynamics 实现自定的 headerView
 
 只有当`BDScrollView`的 headerView 是`BDHeaderView`或其子类的实例,拖拽`BDScrollView`的 headerView才能 同时滚动`BDScrollView`的 currentItemView.
 */
NS_CLASS_AVAILABLE_IOS(7_0) @interface BDHeaderView : UIView

@property (nonatomic, readonly, strong) UIPanGestureRecognizer * panGestureRecognizer;
@property (nonatomic, weak) id<BDHeaderViewDelegate> delegate;
@property (nonatomic, readonly, getter=isTracking)     BOOL tracking;
@property (nonatomic, readonly, getter=isDragging)     BOOL dragging;
@property (nonatomic, readonly, getter=isDecelerating) BOOL decelerating;

/**
 *  结束视图的 惯性减速 & 弹性回弹 等效果
 */
- (void)endDecelerating;

@end

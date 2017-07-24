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

NS_CLASS_AVAILABLE_IOS(7_0) @interface BDHeaderView : UIView

@property (nonatomic, readonly, strong) UIPanGestureRecognizer * panGestureRecognizer;
@property (nonatomic, weak) id<BDHeaderViewDelegate> delegate;
@property (nonatomic, readonly, getter=isTracking)     BOOL tracking;
@property (nonatomic, readonly, getter=isDragging)     BOOL dragging;
@property (nonatomic, readonly, getter=isDecelerating) BOOL decelerating;

- (void)endDecelerating;

@end

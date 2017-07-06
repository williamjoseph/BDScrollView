//
//  BDSegmentView.h
//  BDScrollView
//

#import <UIKit/UIKit.h>

typedef void(^btnClickBlock)(NSInteger index);

@interface BDSegmentView : UIView

@property (nonatomic,strong) UIColor *titleNomalColor;
@property (nonatomic,strong) UIColor *titleSelectColor;
@property (nonatomic,strong) UIFont  *titleFont;
@property (nonatomic,assign) NSInteger defaultIndex;
@property (nonatomic,copy)btnClickBlock block;

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray clickBlick:(btnClickBlock)block;

-(void)updateselectLineFrameWithoffset:(CGFloat)offsetx;

@end

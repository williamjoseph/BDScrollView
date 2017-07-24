//
//  BDSegmentScrollView.h
//  BDScrollView
//

#import <UIKit/UIKit.h>

@interface BDSegmentScrollView : UIView

-(instancetype)initWithFrame:(CGRect)frame
                  titleArray:(NSArray *)titleArray
            contentViewArray:(NSArray *)contentViewArray;

@end

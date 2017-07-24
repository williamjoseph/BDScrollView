//
//  BDCollectionView.h
//  BDScrollView
//
#import <UIKit/UIKit.h>


@class BDCollectionView;
@class BDCollectionViewFlowLayout;

@protocol BDCollectionViewDataSource <NSObject>

- (NSInteger)bdCollectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
- (UICollectionViewCell *)bdCollectionView:(BDCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (NSInteger)numberOfSectionsInBDCollectionView:(UICollectionView *)collectionView;
- (UICollectionReusableView *)bdCollectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;

@end

@protocol BDCollectionViewDelegate <UICollectionViewDelegate>
@end

@interface BDCollectionView : UICollectionView

@property (nonatomic, weak) id<BDCollectionViewDataSource>bdDataSource;
@property (nonatomic, weak) id<BDCollectionViewDelegate>bdDelegate;

@property (nonatomic, assign) CGSize minRequireContentSize;
@property (nonatomic, readonly, strong) UIView * collectionHeadView;
@property (nonatomic, readonly, strong) BDCollectionViewFlowLayout * bd_collectionViewLayout;

- (instancetype)initWithFrame:(CGRect)frame NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;

@end

@protocol BDCollectionViewFlowLayoutDelegate <UICollectionViewDelegateFlowLayout>

@required
- (NSInteger)collectionView:(UICollectionView *)collectionView
                     layout:(BDCollectionViewFlowLayout *)layout
   numberOfColumnsInSection:(NSInteger)section;

@end

@interface BDCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) CGFloat columnCount;
@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@property (nonatomic, assign) UIEdgeInsets sectionInset;
@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, readonly, assign) CGFloat topOffsetOfFirstAttributes;

@end


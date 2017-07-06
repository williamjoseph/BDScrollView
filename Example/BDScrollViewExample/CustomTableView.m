//
//  CustomTableView.m
//  BDScrollViewExample
//

#import "CustomTableView.h"

#define RGBColor(r,g,b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface CustomTableView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger numberOfRows;

@end

@implementation CustomTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorColor = RGBColor(175, 175, 175);
        [self registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
        self.tableFooterView = [UIView new];
    }
    return self;
}

- (void)refreshView {
    _numberOfRows = 30;
    [self reloadData];
}

#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = RGBColor(150, 215, 200);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"row at index: %ld", indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

@end

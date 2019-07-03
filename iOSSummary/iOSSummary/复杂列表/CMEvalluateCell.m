//
//  CMEvalluateCell.m
//  CMHitchhiking
//
//  Created by HeQin on 2018/11/25.
//  Copyright © 2018年 HeQin. All rights reserved.
//

#import "CMEvalluateCell.h"
#import "CMEvalluateFrame.h"
#import "CMEvaluateModel.h"

@interface CMEvalluateCell ()
@property (nonatomic, weak) UIImageView *headImg;
@property (nonatomic, weak) UILabel *nameLab;
@property (nonatomic, weak) UILabel *starLab;
@property (nonatomic, weak) UILabel *descLab;
@property (nonatomic, weak) UILabel *timeLab;
@property (nonatomic, weak) UIView *lineView;

@end

@implementation CMEvalluateCell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"CMEvalluateCell";
    CMEvalluateCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CMEvalluateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化动态
        [self setupOriginal];
    }
    return self;
}
- (void)setupOriginal {
    
    UIImageView *headImg = [[UIImageView alloc] init];
    [self.contentView addSubview:headImg];
    self.headImg = headImg;
    
    UILabel *nameLab = [[UILabel alloc] init];
    nameLab.font = nameFont;
    nameLab.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:nameLab];
    self.nameLab = nameLab;
    
    UILabel *starLab = [[UILabel alloc] init];
    starLab.font = [UIFont systemFontOfSize:14];
    starLab.textColor = [UIColor orangeColor];
    [self.contentView addSubview:starLab];
    self.starLab = starLab;
    
    UILabel *descLab = [[UILabel alloc] init];
    descLab.font = contentFont;
    descLab.textColor = [UIColor darkGrayColor];
    descLab.numberOfLines = 0;
    [self.contentView addSubview:descLab];
    self.descLab = descLab;
    
    UILabel *timeLab = [[UILabel alloc] init];
    timeLab.font = [UIFont systemFontOfSize:15];
    timeLab.textColor = [UIColor grayColor];
    [self.contentView addSubview:timeLab];
    self.timeLab = timeLab;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];
    self.lineView = lineView;
    
}
- (void)setStatusFrame:(CMEvalluateFrame *)statusFrame {
    _statusFrame = statusFrame;
    [self setupFrame];
    self.headImg.image = [UIImage imageNamed:@"head_hold_img"];
    self.nameLab.text =  [statusFrame.model getNameDesc];
    self.starLab.text = [statusFrame.model getStarDesc];
    self.descLab.text = statusFrame.model.content;
    self.timeLab.text = statusFrame.model.time;
}

- (void)setupFrame {
    self.headImg.frame = self.statusFrame.headImgF;
    self.nameLab.frame = self.statusFrame.nameLabF;
    self.starLab.frame = self.statusFrame.starLabF;
    self.descLab.frame = self.statusFrame.descLabF;
    self.timeLab.frame = self.statusFrame.timeLabF;
    self.lineView.frame = self.statusFrame.lineViewF;
}
@end

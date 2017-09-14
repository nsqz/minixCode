//
//  DetailsTableViewCell.h
//  minixCode
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "BaseTableViewCell.h"

typedef  void (^BtnClick)(UIButton *);
typedef void (^SetColor)();
@interface DetailsTableViewCell : BaseTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *bodyLbl;
@property (weak, nonatomic) IBOutlet UIButton *ControlBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnContraints;
@property (nonatomic, copy)BtnClick btnClick;
@property (nonatomic, copy)SetColor setColor;
@end

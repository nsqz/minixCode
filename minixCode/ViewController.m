//
//  ViewController.m
//  minixCode
//
//  Created by apple on 2016/11/2.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "ViewController.h"

#import "MenuCollectionViewCell.h"
//#import "CSView.h"
#import "MoveImageView.h"
#import "MoveLabel.h"
#import "MoveBaseView.h"
#import "MoveWMPlayer.h"
#import "UIView+Extension.h"
#import "DetailsTableViewCell.h"
#import "TVCModel.h"
#import "BaseTouchView.h"

#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#define KVideoUrlPath   \
[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"VideoURL"]
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,WMPlayerDelegate>

@property (nonatomic, strong)NSMutableArray *dataArray;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *CollectionViewWidth;
@property (weak, nonatomic) IBOutlet UIView *dataScrollView;


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewWidth;
@property (weak, nonatomic) IBOutlet BaseTouchView *removTVC;
@property (nonatomic, strong)NSMutableArray *TVCArray;


@property (nonatomic, strong)NSMutableArray *structureArray;

@property (nonatomic, assign)NSInteger i;

@property (nonatomic, retain)UIView *pointer;

@property (nonatomic, strong)UIImagePickerController *imagePickerController;

@property (nonatomic, assign)CGFloat r;
@property (nonatomic, assign)CGFloat g;
@property (nonatomic, assign)CGFloat b;

@end

@implementation ViewController


#pragma mark ------初始化------
-(void)setPointer:(UIView *)pointer {
    if(_pointer != pointer) {
        NSArray *VArr = [_pointer subviews];
        for (UIView *view in VArr) {
            NSString *classStr = NSStringFromClass([view class]);
            if ([classStr isEqualToString:@"BaseTouchView"]) {
                view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
            }
        }
    }
    
    _pointer = pointer;
    
    if (self.TVCArray !=nil) {
        [self.TVCArray removeAllObjects];
    }
    
    NSString *classStr = NSStringFromClass([pointer class]);
//    NSDictionary *classDic = @{@"class":classStr};
//    [self.TVCArray addObject:classDic];
    
//    pointer.bsf
    if ([classStr isEqualToString:@"MoveLabel"]) {
//        [self.TVCArray addObject:classDic];
        MoveLabel *label = (MoveLabel *)pointer;
        TVCModel *model = [[TVCModel alloc]init];
        model.body = [NSString stringWithFormat:@"top:%.2f  left:%.2f  right:%.2f",label.top.constant,label.left.constant,label.left.constant];
        model.btn1 = @"比例保存";
        model.btn2 = @"数值保存";
        [self.TVCArray addObject:model];
        
        TVCModel *model2 = [[TVCModel alloc]init];
        model2.body = [NSString stringWithFormat:@"text:%@",label.text];
        [self.TVCArray addObject:model2];
        
        TVCModel *model3 = [[TVCModel alloc]init];
        model3.body = [NSString stringWithFormat:@"font:%.2f",label.font.pointSize];
        [self.TVCArray addObject:model3];
        model3.btn1 = @"修改";
        
        TVCModel *model4 = [[TVCModel alloc]init];
        //    model3.body = [NSString stringWithFormat:@"%@",pointer.backgroundColor];
        model4.btn1  = @"color";
        model4.textFied = @"3";
        [self.TVCArray addObject:model4];
        return;
    }

    TVCModel *model = [[TVCModel alloc]init];
    model.body = [NSString stringWithFormat:@"x:%.2f y:%.2f",pointer.x,pointer.y];
    model.btn1 = @"比例保存";
    model.btn2 = @"数值保存";
    [self.TVCArray addObject:model];

    TVCModel *model1 = [[TVCModel alloc]init];
    model1.body = [NSString stringWithFormat:@"width:%.2f hight:%.2f",pointer.width,pointer.height];
//    model1.btn1 = @"比例保存";
//    model.btn2 = @"数值保存";
    [self.TVCArray addObject:model1];
    
//    TVCModel *model2 = [[TVCModel alloc]init];
//    model2.body = [NSString stringWithFormat:@"width:%.2f hight:%.2f",pointer.width,pointer.height];
//    //    model1.btn1 = @"比例保存";
//    //    model.btn2 = @"数值保存";
//    [self.TVCArray addObject:model2];
    
    if ([pointer.bsf isEqualToString:@"0"]) {
        MoveWMPlayer *wmPlayer = (MoveWMPlayer *)pointer;
        TVCModel *wmModel = [[TVCModel alloc]init];
        wmModel.body = [NSString stringWithFormat:@"url : %@",wmPlayer.URLString];
        wmModel.btn1 = @"本地获取";
        wmModel.btn2 = @"网上获取";
        [self.TVCArray addObject:wmModel];
    }else if([pointer.bsf isEqualToString:@"1"]){
    
    }else if([pointer.bsf isEqualToString:@"2"]) {
        MoveImageView *image = (MoveImageView *)pointer;
        TVCModel *imageModel = [[TVCModel alloc]init];
        imageModel.body = [NSString stringWithFormat:@"imageURL : %@",image.image];
        imageModel.btn1 = @"本地获取";
        imageModel.btn2 = @"网上获取";
        [self.TVCArray addObject:imageModel];
    }
    
    TVCModel *model3 = [[TVCModel alloc]init];
//    model3.body = [NSString stringWithFormat:@"%@",pointer.backgroundColor];
    model3.btn1  = @"color";
    model3.textFied = @"3";
    [self.TVCArray addObject:model3];
    
}
-(NSMutableArray *)TVCArray {
    
    if (_TVCArray == nil) {
        self.TVCArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _TVCArray;
}

-(NSMutableArray *)structureArray {
    if (_structureArray == nil) {
        self.structureArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _structureArray;
}

-(NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}
#pragma mark -------UIViewController-----
- (void)viewDidLoad {
    [super viewDidLoad];
    _i = 1;
    NSArray *imageArr = @[@"av",@"carouselFigure",@"image",@"label",@"view",@"btn"];
    NSArray *titleArr = @[@"视频",@"轮播图",@"图片",@"文本",@"视图",@"按钮"];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 1000;
    self.tableViewHeight.constant = 0;
    self.removTVC.transverseMove = ^(CGFloat c){
        CGFloat a = self.viewWidth.constant ;
        if (a + c < 0) {
            return ;
        }
        if (a + c > (kScreenWidth - 40)) {
            
            self.viewWidth.constant = 0;
            self.tableViewHeight.constant = 0;
            return;
        }
        self.viewWidth.constant = a + c;
    };
    
    for (int i = 0; i < 6; i ++) {
        
        ControlModel *model = [[ControlModel alloc]init];
        model.title = titleArr[i];
        model.image = imageArr[i];
        model.tag =[NSString stringWithFormat:@"%d",i];
        [self.dataArray addObject:model];
//        [self.structureArray addObject:model];
    }
    
    _imagePickerController = [[UIImagePickerController alloc] init];
    _imagePickerController.delegate = self;
    _imagePickerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    _imagePickerController.allowsEditing = YES;
    _imagePickerController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
 [self.view endEditing:YES];    
}


- (IBAction)OpenOrClose:(id)sender {
    if (self.CollectionViewWidth.constant == 0) {
        self.CollectionViewWidth.constant = 100;
//        self.viewWidth.constant = self.viewWidth.constant + 100;
    }else {
    self.CollectionViewWidth.constant = 0;
    }
}

#pragma mark ------UICollectionViewDataSource----
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataArray.count;

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
        ControlModel *model = _dataArray[indexPath.item];
    //
    //     *cell  = [FactoryCollectionViweCell creatCollectionViewCell:model andCollectionView:collectionView andIndexPath:indexPath];
    //
    //    [cell setDataWithModel:model];
        MenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cc" forIndexPath:indexPath];
//        cell.backgroundColor = [UIColor redColor];
        [cell setDataModel:model];
   
    
    
    return cell;
    
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//
//    return UIEdgeInsetsMake(10, 10, 10, 10);//第一个cell居中的效果,调用一次   上 左 下 右 的偏移量
//
//}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    ControlModel *model = _dataArray[indexPath.item];
//        CSView *view = [[CSView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//        [self.dataScrollView addSubview:view];
    if (indexPath.item == 0) {
        MoveWMPlayer *mwPlayer = [[MoveWMPlayer alloc]initWithFrame:CGRectMake(50, 100, 240, 128)];
        mwPlayer.tag = _i;
        _i ++;
        mwPlayer.bsf = @"0";
        [self.dataScrollView addSubview:mwPlayer];
        self.pointer = mwPlayer;
        [self.structureArray addObject:mwPlayer];
//        NSString *x = [NSString stringWithFormat:@"%f",(100/kScreenWidth)];
//        NSString *y = [NSString stringWithFormat:@"%f",100/kScreenHeight];
//        NSString *width = [NSString stringWithFormat:@"%f",240/kScreenWidth];
//        NSString *height = [NSString stringWithFormat:@"%f",128/kScreenHeight];
//        NSMutableDictionary *bsf = @{@"Fn":@"V",@"structure":@0,@"x":x,@"y":y,@"width":width,@"height":height}.mutableCopy;
//        [self.structureArray addObject:bsf];
        
        mwPlayer.selectedBlock = ^(MoveWMPlayer *player){
            if (self.tableViewHeight.constant == 0) {
                self.tableViewHeight.constant = 300;
            }
            self.pointer = player;
            [self.tableView reloadData];
        };
        mwPlayer.deleteMWPlayer = ^(UIView *player) {
        
            [self.structureArray removeObject:player];
            [player removeFromSuperview];
        
        };
    }else
    if (indexPath.item == 1) {
        MoveBaseView *moveView = [[MoveBaseView alloc]initWithFrame:CGRectMake(50, 100, 240, 128)];
        moveView.bsf = @"1";
        moveView.tag = _i;
        _i ++;
        [self.dataScrollView addSubview:moveView];
        [self.structureArray addObject:moveView];
        self.pointer = moveView;

        
        moveView.deleteView = ^(UIView *moveView) {
           
            [self.structureArray removeObject:moveView];
            [moveView removeFromSuperview];
        };
        moveView.selectedBlock = ^(MoveBaseView *view) {
            if (self.tableViewHeight.constant == 0) {
                self.tableViewHeight.constant = 300;
            }
            self.pointer = view;
            [self.tableView reloadData];
        };
    }else
    if (indexPath.item == 2) {
        MoveImageView *imageView = [[MoveImageView alloc]initWithFrame:CGRectMake(0, 150, 100, 100)];
        [self.dataScrollView addSubview:imageView];
        self.pointer = imageView;
        imageView.bsf  = @"2";
        imageView.tag = _i;
        _i ++;
        [self.structureArray addObject:imageView];
        imageView.selectedBlock = ^(MoveImageView *view) {
            if (self.tableViewHeight.constant == 0) {
                self.tableViewHeight.constant = 300;
            }
            self.pointer = view;
            [self.tableView reloadData];
        };
        imageView.deleteImageView = ^(UIView *imageView) {
            [self.structureArray removeObject:imageView];
            [imageView removeFromSuperview];
        };
    } else
        if (indexPath.item == 3) {
            MoveLabel *label = [MoveLabel createMoveLabelWithView:self.dataScrollView];
            [self.structureArray addObject:label];
            self.pointer = label;
            label.bsf = @"3";
            label.tag = _i;
            _i ++;
//            label.numberOfLines = 3;
            label.selectedBlock = ^(MoveLabel *view) {
                if (self.tableViewHeight.constant == 0) {
                    self.tableViewHeight.constant = 300;
                }
                self.pointer = view;
                [self.tableView reloadData];
            };
            label.deleteLabel = ^(MoveLabel *label){
                if (label.width <= 0) {
                    [self.structureArray removeObject:label];
                    [label removeFromSuperview];
                }
                if (label.x <= 0 ||label.right.constant >=0 ) {
                    NSLog(@"%f %f",label.x,label.right.constant);
//                    [self.structureArray removeObject:label];
//                    [label removeFromSuperview];
                }
            };
        } else
            if (indexPath.item == 4) {
                MoveBaseView *moveView = [[MoveBaseView alloc]initWithFrame:CGRectMake(50, 100, 240, 128)];
                moveView.bsf = @"4";
                moveView.tag = _i;
                _i ++;
                [self.dataScrollView addSubview:moveView];
                self.pointer = moveView;
                [self.structureArray addObject:moveView];
                
                moveView.deleteView = ^(UIView *moveView) {
                   
                    [self.structureArray removeObject:moveView];
                    [moveView removeFromSuperview];
                };
                moveView.selectedBlock = ^(MoveBaseView *view) {
                    if (self.tableViewHeight.constant == 0) {
                        self.tableViewHeight.constant = 300;
                    }
                    self.pointer = view;
                    [self.tableView reloadData];
                };
            }
    self.CollectionViewWidth.constant = 0;

}
#pragma mark ------UITableViewDataSource------
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
//    view.backgroundColor = [UIColor redColor];
    if (_pointer == nil) {
        return nil;
    }
    NSInteger i = [_pointer.bsf integerValue];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 60, 20)];
    if (i<self.dataArray.count) {
        ControlModel *model =self.dataArray[i];
        label.text = model.title;
    }else {
    label.text = @"";
    }
    label.font = [UIFont systemFontOfSize:19];
    [view addSubview:label];
    if ([_pointer.bsf isEqualToString:@"3"]) {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(70, 0, kScreenWidth - 100, 30)];
        textField.delegate = self;
        textField.placeholder = @"请输入文字";
           [view addSubview:textField];
        textField.text = label.text;
        [textField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
//        textField.
//        return textField;
    }
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (self.TVCArray.count == 0) {
//        return 0;
//    }
    return self.TVCArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailsTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"tvc" forIndexPath:indexPath];
    BaseModel *model = self.TVCArray[indexPath.row];
    if (indexPath.row == (self.TVCArray.count - 1)) {
        cell.setColor = ^(){
            UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"设置背景色" message:@"请输入0-255的值" preferredStyle:(UIAlertControllerStyleAlert)];
            [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getText:) name:UITextFieldTextDidChangeNotification object:textField];
                textField.placeholder = @"red";
                textField.keyboardType = UIKeyboardTypeNumberPad;
            }];
            [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getText:) name:UITextFieldTextDidChangeNotification object:textField];
                    textField.placeholder = @"green";
                textField.keyboardType = UIKeyboardTypeNumberPad;
            }];
            [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getText:) name:UITextFieldTextDidChangeNotification object:textField];
                    textField.placeholder = @"blue";
                textField.keyboardType = UIKeyboardTypeNumberPad;

            }];
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [controller dismissViewControllerAnimated:YES completion:nil];
            }];
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                _pointer.backgroundColor = kRGB(_r, _g, _b);
                [controller dismissViewControllerAnimated:YES completion:nil];
            }];
            
            [controller  addAction:action1];
            [controller addAction:action2];
            [self presentViewController:controller animated:YES completion:nil];
            
        };
    }
    if (indexPath.row == 2) {
        if ([_pointer.bsf isEqualToString:@"0"] ||([_pointer.bsf isEqualToString:@"2"])) {
            cell.btnClick = ^(UIButton *btn){
                UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"如何添加" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder = @"请输入URL";
                    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getText:) name:UITextFieldTextDidChangeNotification object:textField];
                }];

                UIAlertAction *action = [UIAlertAction actionWithTitle:@"相册获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self selectImageFromAlbum];
                }];
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"摄像头" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self selectImageFromCamera];
                }];
                UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                    [self selectImageFromCamera];
                }];
                UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [controller dismissViewControllerAnimated:YES completion:nil];
                }];
                [controller addAction:action2];
                [controller addAction:action1];
                [controller addAction:action];
                [controller addAction:action3];

                [self presentViewController:controller animated:YES completion:nil];

            };
        }
    }
    
   
    if (_pointer != nil) {
        [cell setDataWithModel:model];
//        cell.bodyLbl.text = [NSString stringWithFormat:@"x:%.2f  y:%.2f width:%.2f hegit:%.2f",_pointer.x,_pointer.y,_pointer.width,_pointer.height];
        
    }
    
    return cell;
}

#pragma mark ------TextField-------
-(void)textChange:(UITextField *)textField {
    if ([_pointer.bsf isEqualToString:@"3"]) {
        MoveLabel *label = (MoveLabel *)_pointer;
        label.text = textField.text;
    }
}

#pragma mark -----imageOrPlayer-------
//#pragma mark 从摄像头获取图片或视频
- (void)selectImageFromCamera
{
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    //录制视频时长，默认10s
    _imagePickerController.videoMaximumDuration = 15;
    
    //相机类型（拍照、录像...）字符串需要做相应的类型转换
    _imagePickerController.mediaTypes = @[(NSString *)kUTTypeMovie,(NSString *)kUTTypeImage];
    
    //视频上传质量
    //UIImagePickerControllerQualityTypeHigh高清
    //UIImagePickerControllerQualityTypeMedium中等质量
    //UIImagePickerControllerQualityTypeLow低质量
    //UIImagePickerControllerQualityType640x480
    _imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    
    //设置摄像头模式（拍照，录制视频）为录像模式
    _imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    [self presentViewController:_imagePickerController animated:YES completion:nil];
}
#pragma mark 从相册获取图片或视频
- (void)selectImageFromAlbum
{
    //NSLog(@"相册");
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:_imagePickerController animated:YES completion:nil];
}
#pragma mark UIImagePickerControllerDelegate
//该代理方法仅适用于只选取图片时
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    NSLog(@"选择完毕----image:%@-----info:%@",image,editingInfo);
}
//适用获取所有媒体资源，只需判断资源类型
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    //判断资源类型
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        //如果是图片
        if ([_pointer.bsf isEqualToString:@"2"]) {
            MoveImageView *image = (MoveImageView *)_pointer;
            image.image = info[UIImagePickerControllerEditedImage];
        }
        //        self.imageView.image = info[UIImagePickerControllerEditedImage];
        //压缩图片
        //        NSData *fileData = UIImageJPEGRepresentation(self.imageView.image, 1.0);
        //保存图片至相册
        //        UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        //上传图片
        //        [self uploadImageWithData:fileData];
        
    }else{
        //如果是视频
        NSURL *url = info[UIImagePickerControllerMediaURL];
        //播放视频
        NSLog(@"%@",url);
        //        _moviePlayer.contentURL = url;
        //        [_moviePlayer play];
        
        //            AVPlayer *player = [AVPlayer playerWithURL:url];
        //            AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
        //            playerLayer.frame = _csView.bounds;
        //            [_csView.layer addSublayer:playerLayer];
        //            [player play];
        //保存视频至相册（异步线程）
        NSString *urlStr = [url path];
        //        _wmPlayer.URLString = urlStr;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlStr)) {
                
                UISaveVideoAtPathToSavedPhotosAlbum(urlStr, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
            }
        });
        NSData *videoData = [NSData dataWithContentsOfURL:url];
        //视频上传
        
        //        [self uploadVideoWithData:videoData];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

//#pragma mark 图片保存完毕的回调
- (void) image: (UIImage *) image didFinishSavingWithError:(NSError *) error contextInfo: (void *)contextInf{
    if ([_pointer.bsf isEqualToString:@"2"]) {
        MoveImageView *imageV = (MoveImageView *)_pointer;
        imageV.image = image;
    }
}

#pragma mark 视频保存完毕的回调
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInf{
    if (error) {
        NSLog(@"保存视频过程中发生错误，错误信息:%@",error.localizedDescription);
    }else{
        NSURL *URL = [NSURL fileURLWithPath:videoPath];
        
        NSString *urlstring = [URL absoluteString];
        if ([_pointer.bsf isEqualToString:@"0"]) {
            MoveWMPlayer *wmPlayer = (MoveWMPlayer *)_pointer;
             wmPlayer.URLString = urlstring;
        }
       
        
        NSLog(@"视频保存成功.");
    }
}


#pragma mark ------WMPlayerDelegate-----
//单击WMPlayer的代理方法
//-(void)wmplayer:(WMPlayer *)wmplayer singleTaped:(UITapGestureRecognizer *)singleTap{
//    MoveWMPlayer *wmPlayer = (MoveWMPlayer *)wmplayer;
//    self.pointer = wmPlayer;
//    [self.tableView reloadData];
//}

#pragma mark ------MESEL------
//当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    NSLog(@"%d",height);
    self.tableViewHeight.constant = height + 100;
}

-(void)getText:(NSNotification *)no{
    UITextField *textField = no.object;
//    self.content = textField.text;
    if ([textField.placeholder isEqualToString:@"red"]) {
        CGFloat r = [textField.text floatValue];
        if (r >= 0  && r <= 255) {
            _r = r;
        }else {
            _r = 0;
        }
        return;
    }
    if ([textField.placeholder isEqualToString:@"green"]) {
        CGFloat r = [textField.text floatValue];
        if (r >= 0  && r <= 255) {
            _g = r;
        }else {
            _g = 1;
        }
        return;
    }
    if ([textField.placeholder isEqualToString:@"blue"]) {
        CGFloat r = [textField.text floatValue];
        if (r >= 0  && r <= 255) {
            _b = r ;
        }else {
            _b = 1;
        }
        return;
    }
    NSLog(@"%@",textField.text);
}

//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification{
 self.tableViewHeight.constant = 300;
}
- (IBAction)save:(id)sender {
    
    for (UIView *view in self.structureArray) {
        if ([view.bsf isEqualToString:@"0"]) {
            
//            NSLog(@"%@",view.frame);
        }
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getAllView:(id)sender {
    NSArray *allView = self.dataScrollView.subviews;
    NSLog(@"%@",allView);
    if ( allView.count > 0 ) {
        UIView  *a =allView[0];
        CGRect frame = a.frame;
        NSLog(@"%f,%f,%f,%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
        
    }
   
}

@end

//
//  UIView+MyView.m
//  minixCode
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 hl. All rights reserved.
//

#import "UIView+MyView.h"

@implementation UIView (MyView)

/**
 *  void objc_setAssociatedObject(id object, const void *key, id value,objc_AssociationPolicy policy)     //为某个类关联某个对象
 id objc_getAssociatedObject(id object, const void *key)  //获取到某个类的某个关联对象
 void objc_removeAssociatedObjects(id object) //移除已经关联的对象
 */

-(void)setBsf:(NSString *)bsf
{
    /**
     *  object:要关联的对象
     key：要关联的属性的key值
     value：要关联的属性
     policy：
     */
    objc_setAssociatedObject(self, @selector(bsf), bsf, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)bsf
{
    /**
     *  object:关联的对象
     key：属性的key值
     *
     */
    return objc_getAssociatedObject(self, @selector(bsf));
}



@end

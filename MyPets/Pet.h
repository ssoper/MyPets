//
//  Pet.h
//  MyPets
//
//  Created by Sean Soper on 12/1/11.
//  Copyright (c) 2011 . All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^OnSelect)(id);

@interface Pet : NSObject

@property (nonatomic, retain) NSString *name, *species;
@property (nonatomic, retain) UIImage *image, *thumbnail;
@property (nonatomic, copy) OnSelect onSelectPet;

- (void) fireHandler;

@end

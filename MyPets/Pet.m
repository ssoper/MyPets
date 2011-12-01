//
//  Pet.m
//  MyPets
//
//  Created by Sean Soper on 12/1/11.
//  Copyright (c) 2011 . All rights reserved.
//

#import "Pet.h"
#import "UIImage+Resize.h"


@implementation Pet

@synthesize name = _name, species, image, thumbnail;

- (BOOL) deviceSize:(CGFloat) size {
  CGFloat newSize = size;
  if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
    CGFloat scale = [[UIScreen mainScreen] scale];
    if (scale > 1.0) {
      newSize = size*2;
    }
  }

  return newSize;
}

- (void) setName:(NSString *)name {
  if (_name == name)
    return;

  [_name release];
  _name = [name retain];

  NSString *path = [[NSBundle mainBundle] pathForResource: _name ofType: @"jpg"];
  self.image = [[UIImage alloc] initWithContentsOfFile: path];
  self.thumbnail = [self.image thumbnailImage: [self deviceSize: 50]transparentBorder: YES cornerRadius: 5 interpolationQuality: kCGInterpolationDefault];
}

- (void) dealloc {
  [_name release];
  [species release];
  [image release];
  [thumbnail release];
}

@end

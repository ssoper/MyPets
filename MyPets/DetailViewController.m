//
//  DetailViewController.m
//  MyPets
//
//  Created by Sean Soper on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "Pet.h"


@implementation DetailViewController

@synthesize pet;


#pragma mark - View lifecycle

- (void)loadView {
  UIView *view = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 320, 460)];

  UIImageView *imageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 50, 320, 240)];
  imageView.image = pet.image;
  [view addSubview: imageView];
  [imageView release];

  self.view = view;
  [view release];
}

@end

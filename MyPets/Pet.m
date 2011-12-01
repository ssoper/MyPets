//
//  Pet.m
//  MyPets
//
//  Created by Sean Soper on 12/1/11.
//  Copyright (c) 2011 . All rights reserved.
//

#import "Pet.h"

@implementation Pet

@synthesize name, species;

- (void) dealloc {
  [name release];
  [species release];
}

@end

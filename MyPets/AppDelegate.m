//
//  AppDelegate.m
//  MyPets
//
//  Created by Sean Soper on 12/1/11.
//  Copyright (c) 2011 . All rights reserved.
//

#import "AppDelegate.h"
#import "PetsViewController.h"
#import "Pet.h"


@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  // Override point for customization after application launch.
  self.window.backgroundColor = [UIColor whiteColor];
  
  PetsViewController *petsViewController = [[PetsViewController alloc] init];
  Pet *cat = [[Pet alloc] init];
  cat.name = @"Ice";
  cat.species = @"cat";
  
  Pet *dog = [[Pet alloc] init];
  dog.name = @"Hobie";
  dog.species = @"dog";

  NSArray *pets = [[NSArray alloc] initWithObjects: cat, dog, nil];

  petsViewController.pets = pets;

  UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController: petsViewController];
  self.window.rootViewController = navController;

  [self.window makeKeyAndVisible];

  [navController release];
  [pets release];
  [dog release];
  [cat release];
  [petsViewController release];

  return YES;
}

- (void)dealloc
{
  [_window release];
  [super dealloc];
}

@end

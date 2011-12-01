//
//  PetsViewController.m
//  MyPets
//
//  Created by Sean Soper on 12/1/11.
//  Copyright (c) 2011 . All rights reserved.
//

#import "PetsViewController.h"
#import "DetailViewController.h"
#import "Pet.h"


@implementation PetsViewController

@synthesize pets = _pets;


#pragma mark - Private

- (void) closeModal {
  [self.navigationController dismissModalViewControllerAnimated: YES];
}

- (void) configurePets {
  __block PetsViewController *this = self;
  
  Pet *cat = [[Pet alloc] init];
  cat.name = @"Ice";
  cat.species = @"cat";

  cat.onSelectPet = ^(id pet) {
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.pet = (Pet *)pet;
    [this.navigationController presentModalViewController:detailViewController animated: YES];
    [this performSelector: @selector(closeModal) withObject: nil afterDelay: 2];
    [detailViewController release];
  };

  Pet *dog = [[Pet alloc] init];
  dog.name = @"Hobie";
  dog.species = @"dog";

  dog.onSelectPet = ^(id pet) {
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.pet = (Pet *)pet;
    [this.navigationController pushViewController: detailViewController animated: YES];
    [detailViewController release];
  };

  NSArray *pets = [[NSArray alloc] initWithObjects: cat, dog, nil];
  self.pets = pets;

  [pets release];
  [dog release];
  [cat release];
}


#pragma mark - Initialization

- (id) init {
  if (self = [super init]) {
    [self configurePets];
  }

  return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.pets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }

  Pet *pet = [self.pets objectAtIndex: indexPath.row];
  cell.textLabel.text = [NSString stringWithFormat: @"%@ is a %@", pet.name, pet.species];
  cell.imageView.image = pet.thumbnail;

  return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  Pet *pet = [self.pets objectAtIndex: indexPath.row];
  [pet fireHandler];
}

@end

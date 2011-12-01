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

@synthesize pets;


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
  DetailViewController *detailViewController = [[DetailViewController alloc] init];
  detailViewController.pet = [self.pets objectAtIndex: indexPath.row];
  [self.navigationController pushViewController:detailViewController animated:YES];
  [detailViewController release];
}

@end

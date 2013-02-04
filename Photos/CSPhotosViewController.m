//
//  CSPhotosViewController.m
//  Photos
//
//  Created by Cameron Spickert on 2/4/13.
//  Copyright (c) 2013 Cameron Spickert. All rights reserved.
//

#import "CSPhotosViewController.h"
#import "CSPhotoCell.h"
#import "CSPhotosAPIClient.h"

static NSString *const kCSPhotoCellIdentifier = @"CSPhotoCellIdentifier";

@interface CSPhotosViewController ()

@property (nonatomic, strong) NSArray *photos;

@end

@implementation CSPhotosViewController

- (id)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    if ((self = [super initWithCollectionViewLayout:layout])) {
    }
    return self;
}

#pragma mark -
#pragma mark View controller methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    [[self collectionView] setBackgroundColor:[UIColor whiteColor]];
    
    [[self collectionView] registerClass:[CSPhotoCell class] forCellWithReuseIdentifier:kCSPhotoCellIdentifier];
    
    [[CSPhotosAPIClient sharedClient] fetchPhotosWithSuccess:^(id responseObject) {
        [self setPhotos:[[responseObject objectForKey:@"photos"] objectForKey:@"photo"]];
        [[self collectionView] reloadData];
    } failure:^(NSError *error) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"") message:[error localizedDescription] delegate:nil cancelButtonTitle:NSLocalizedString(@"Okay", @"") otherButtonTitles:nil] show];
    }];
}

#pragma mark -
#pragma mark Collection view methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[self photos] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CSPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCSPhotoCellIdentifier forIndexPath:indexPath];
    
    [cell setBackgroundColor:[UIColor redColor]];
    
    return cell;
}

@end

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
#import "UIImageView+AFNetworking.h"
#import "CSPhotoDetailViewController.h"

static NSString *const kCSPhotoCellIdentifier = @"CSPhotoCellIdentifier";

@interface CSPhotosViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *photos;

@end

@implementation CSPhotosViewController

- (id)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setItemSize:CGSizeMake(100.0, 100.0)];
    
    if ((self = [super initWithCollectionViewLayout:layout])) {
        [self setTitle:NSLocalizedString(@"Photos", @"")];
    }
    return self;
}

#pragma mark -
#pragma mark Properties

- (NSArray *)photos
{
    return [_photos filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"url_z != NIL"]];
}

#pragma mark -
#pragma mark View controller methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    [[self collectionView] setBackgroundColor:[UIColor whiteColor]];
    
    [[self collectionView] registerClass:[CSPhotoCell class] forCellWithReuseIdentifier:kCSPhotoCellIdentifier];
    
    [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshButtonPressed:)]];
    
    [self fetchPhotos];
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
    
    NSDictionary *photo = [[self photos] objectAtIndex:[indexPath item]];
    NSURL *url = [NSURL URLWithString:[photo objectForKey:@"url_z"]];
    
    [[cell imageView] setImageWithURL:url placeholderImage:nil];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    NSDictionary *photo = [[self photos] objectAtIndex:[indexPath item]];
    
    CSPhotoDetailViewController *detailController = [[CSPhotoDetailViewController alloc] initWithPhoto:photo];
    [[self navigationController] pushViewController:detailController animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *photo = [[self photos] objectAtIndex:[indexPath item]];
    
    CGSize maxSize = [collectionViewLayout itemSize];

    CGSize photoSize = CGSizeMake([[photo objectForKey:@"width_z"] floatValue], [[photo objectForKey:@"height_z"] floatValue]);
    if (CGSizeEqualToSize(photoSize, CGSizeZero)) {
        photoSize = maxSize;
    }
    
    CGFloat maxPhotoSizeDim = MAX(photoSize.width, photoSize.height);
    CGFloat minMaxSizeDim = MIN(maxSize.width, maxSize.height);
    
    CGFloat scaleFactor = minMaxSizeDim / maxPhotoSizeDim;
    
    return CGSizeMake(photoSize.width * scaleFactor, photoSize.height * scaleFactor);
}

#pragma mark -
#pragma mark Interface actions

- (void)refreshButtonPressed:(id)sender
{
    [self fetchPhotos];
}

#pragma mark -
#pragma mark Helpers

- (void)fetchPhotos
{
    [[CSPhotosAPIClient sharedClient] fetchPhotosWithSuccess:^(id responseObject) {
        [self setPhotos:[[responseObject objectForKey:@"photos"] objectForKey:@"photo"]];
        [[self collectionView] reloadData];
    } failure:^(NSError *error) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"") message:[error localizedDescription] delegate:nil cancelButtonTitle:NSLocalizedString(@"Okay", @"") otherButtonTitles:nil] show];
    }];
}

@end

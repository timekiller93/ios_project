//
//  iCarouselExampleViewController.m
//  iCarouselExample
//
//  Created by Nick Lockwood on 03/04/2011.
//  Copyright 2011 Charcoal Design. All rights reserved.
//

#import "iCarouselExampleViewController.h"


@implementation iCarouselExampleViewController

- (IBAction)reloadAndScroll;
{
    [self.carousel reloadData];
    self.carousel.scrollToItemBoundary = NO;
    [self.carousel scrollByOffset:4.5 duration:0.0];
}

- (IBAction)stop
{
    self.carousel.scrollOffset = self.carousel.scrollOffset;
}

- (void)dealloc
{
    self.carousel.delegate = nil;
    self.carousel.dataSource = nil;
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //configure carousel
    self.carousel.type = iCarouselTypeCoverFlow;
    
    //scroll to fixed offset
    [self.carousel scrollToItemAtIndex:5 animated:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    [carousel setType:iCarouselTypeCylinder];
    NSMutableArray *images =[[NSMutableArray alloc]initWithObjects:@"lisieres.jpg",@"insulaire.jpg",@"etranger.jpg",@"dublin.jpg",@"daybreak.jpg",nil];
    return [images count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    //create a numbered view
    NSMutableArray *images =[[NSMutableArray alloc]initWithObjects:@"lisieres.jpg",@"insulaire.jpg",@"etranger.jpg",@"dublin.jpg",@"daybreak.jpg",nil];
    view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
   
    view = [[UIView alloc] init];
    view.contentMode = UIViewContentModeScaleAspectFit;
    CGRect rec = view.frame;
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        rec.size.width = 250;
        rec.size.height = 250;
    }
    view.frame = rec;
    UIImageView *iv;
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        iv=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    }
    NSString *temp=[images objectAtIndex:index];
    iv.image=[UIImage imageNamed:temp];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:iv];
    return view;
    
    //view.backgroundColor = [UIColor lightGrayColor];
    //UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
    //label.text = [NSString stringWithFormat:@"%li", (long)index];
    //label.backgroundColor = [UIColor clearColor];
    //label.textAlignment = UITextAlignmentCenter;
    //label.font = [label.font fontWithSize:50];
    //[view addSubview:label];
    //return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            return YES;
        }
        default:
        {
            return value;
        }
    }
}


- (void)carouselWillBeginDragging:(iCarousel *)carousel
{
	NSLog(@"Carousel will begin dragging");
}

- (void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate
{
	NSLog(@"Carousel did end dragging and %@ decelerate", decelerate? @"will": @"won't");
}

- (void)carouselWillBeginDecelerating:(iCarousel *)carousel
{
	NSLog(@"Carousel will begin decelerating");
}

- (void)carouselDidEndDecelerating:(iCarousel *)carousel
{
	NSLog(@"Carousel did end decelerating");
}

- (void)carouselWillBeginScrollingAnimation:(iCarousel *)carousel
{
	NSLog(@"Carousel will begin scrolling");
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
	NSLog(@"Carousel did end scrolling");
}

@end

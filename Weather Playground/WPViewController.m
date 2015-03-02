//
//  WPViewController.m
//  Weather Playground
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPViewController.h"
#import "WeatherController.h"
#import "Weather.h"
#import "UIImageView+AFNetworking.h"

@interface WPViewController ()
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherMainLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation WPViewController

- (double)fahrenheitFromKelvinString:(NSString *)kelvin {
    double kelvinDouble = [kelvin doubleValue];
    return ((kelvinDouble*(9.0/5.0)) - 459.67);
}

- (IBAction)searchButtonPressed:(id)sender {
    NSString *name = [self.searchTextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[WeatherController sharedInstance] retrieveWeatherWithName:name completion:^(Weather *weather) {
        self.locationLabel.text = weather.locationName;
        self.weatherMainLabel.text = weather.weatherMain;
        self.weatherDescriptionLabel.text = weather.weatherDescription;
        self.temperatureLabel.text = [NSString stringWithFormat:@"%.1f", [self fahrenheitFromKelvinString:weather.weatherTemp]];
        NSString *iconString = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", weather.weatherIcon];
        NSURL *iconURL = [NSURL URLWithString:iconString];
        [self.weatherIcon setImageWithURL:iconURL];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

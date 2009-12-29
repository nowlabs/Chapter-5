#import <Foundation/Foundation.h>

@interface Tire : NSObject
@end //Tire Interface

@implementation Tire

- (NSString *) description 
{
	return @"I am a tire, I last a while";
} //description

@end //Tire

@interface Engine : NSObject
@end //Engine Interface

@implementation Engine

- (NSString *) description
{
	return @"I am an engine, vrroom";
}

@end //Engine

@interface Slant6 : Engine
@end

@implementation Slant6

- (NSString *) description
{
	return @"I am a slant-6, VRROOM";
} //description

@end //Slant6

@interface AllWeatherRadial : Tire
@end //AllWeatherRadial

@implementation AllWeatherRadial
		
- (NSString *) description
{
	return @"I am a tire for rain or shine";
}

@end //AllWeatherRadial


@interface Car : NSObject
{
	Engine *engine;
	Tire *tires[4];
}

- (Engine *) engine;
- (void) setEngine: (Engine *) newEngine;
- (Tire *) tireAtIndex: (int) index;
- (void) setTire: (Tire *) tire
		 atIndex: (int) index;
- (void) print;

@end //Car Interface

@implementation Car


- (Engine *) engine
{
	return engine;
} //engine

- (void) setEngine: (Engine *) newEngine
{
	engine = newEngine;
} //setEngine

- (void) setTire: (Tire *) tire
		 atIndex: (int) index
{
	if (index < 0 || index > 3) {
		NSLog(@"bad index (%d) in setTire:atIndex", index);
		exit(1);
	}
	tires[index] = tire;
} //setTire:atIndex

-(Tire *) tireAtIndex: (int)index
{
	if (index < 0 || index > 3) {
		NSLog(@"bad index (%d) in tireAtIndex", index);
		exit(1);
	}
	return tires[index];
} //tireAtIndex:

- (void) print
{
	NSLog(@"%@", engine);
	for	(int i = 0; i < 4; i++) {
		NSLog(@"%@", tires[i]);
	}
} //print

@end


int main (int argc, const char * argv[]) {
    Car *car;
	car = [Car new];
	Engine *engine = [Slant6 new];
	[car setEngine: engine];
	for	(int i = 0; i < 4; i++) {
		[car setTire: [AllWeatherRadial new] atIndex: i];
	}
	[car print];
    return 0;
}

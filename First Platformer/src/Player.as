package  
{
	import org.flixel.*;
	//import org.flixel.plugin.photonstorm.*;
	
	/**
	 * ...
	 * @author Brad Coker
	 */
	public class Player extends FlxSprite
	{
		[Embed( source = '../assets/player.png' )] private var playerPNG:Class;
		public var _jump:Number = 0;
		private var logNum:Number = 0;
		public var hasDoubleJump:Boolean = false;
		private var jumped:Boolean = false;
		private var doubleJumped:Boolean = false;
		public var jumpLen:Number = 0.25;
		
		
		public function Player( X:Number, Y:Number )
		{
			super( X, Y );
			//Load player.png into the sprite
			loadGraphic( playerPNG, true, true, 7, 9, true );
			
			//Add the animations
			addAnimation( "idle", [0], 0, false );
			addAnimation( "walk", [0, 1, 0, 2], 2, true );
			addAnimation( "jump", [1], 0, false );
			
		}
		
		override public function update():void
		{
			
			if ( isTouching( FlxObject.FLOOR ) && FlxG.keys.justPressed( "UP" ) )
			{
				_jump = 0;
				jumped = false;
				doubleJumped = false;
			}
			if ( hasDoubleJump && !doubleJumped && _jump == -1 && FlxG.keys.justPressed( "UP" ) )		//Allow double jump only if UP has just been pushed
			{
				_jump = 0;
			}
			
			if ( ( _jump >= 0 ) && ( FlxG.keys.UP ) )	//Can jump, and pressing jump button
			{
				if ( _jump == 0 )	//Start jump
				{
					velocity.y = -300;
					FlxG.log( (logNum++) + "- jump begin" );
					_jump += FlxG.elapsed;
					if ( !jumped )				//Set variables - jumped or double jumped
					{
						jumped = true;
					}
					else if ( !doubleJumped )
					{
						doubleJumped = true;
					}
				}
				else
				{
					_jump += FlxG.elapsed;
					if ( _jump > jumpLen ) //Can't jump for more than 0.25 secs
					{
						FlxG.log( (logNum++) + "- jump is over!" );
						_jump = -1;
					}
				}
			}
			else
			{
				_jump = -1;
				velocity.y = 70;
			}
			
			acceleration.x = 0;
			if ( FlxG.keys.LEFT )
			{
				acceleration.x = -maxVelocity.x * 4;
			}
			else if ( FlxG.keys.RIGHT )
			{
				acceleration.x = maxVelocity.x * 4;
			}
			
			
			super.update();
			
			if ( touching == FlxObject.FLOOR )
			{
				if ( velocity.x != 0 )
				{
					play( "walk" );
				}
				else
				{
					play( "idle" );
				}
			}
			else if ( velocity.y < 0 )
			{
				play( "jump" );
			}
		}
		
	}

}
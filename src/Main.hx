package;

import luxe.components.sprite.SpriteAnimation;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;

class Main extends luxe.Game 
{
	private var animation:SpriteAnimation;
	
	override function ready() 
	{
		
		var texture = Luxe.resources.texture("assets/sprite.png");
		var sprite = new Sprite( {
			name : 'sprite',
			texture : texture,
			size: new Vector(200, 200),
			pos: new Vector(400, 400)
		});
		
		Luxe.draw.text(
			{
				pos : new Vector(10,10),
				point_size : 20,
				immediate: false,
				text : "Press a key to animate."
			});
		
		animation = sprite.add(new SpriteAnimation( { name:'spriteanim' } ));
		var animation_json = '{
			"idle" : {
				"frame_size":{ "x":"200", "y":"200" },
				"frameset": ["1"],
				"loop": "false",
				"speed": "1"
			},
			"testanim" : {
				"frame_size":{ "x":"200", "y":"200" },
				"frameset": ["2", "3", "2", "3"],
				"loop": "false",
				"speed": "1"
			}
		}';
		animation.add_from_json( animation_json );
		animation.animation = "idle";
		animation.play();
		
	}
	
	public function startAnimation() {
		animation.animation = "testanim";
		animation.play();
	}
	
	override function onkeyup(e:KeyEvent) 
	{
		startAnimation();
	}

	override function update(dt:Float) 
	{
	}
	
	override function config( config:luxe.AppConfig ) {
		config.preload.textures = [
            { id:'assets/sprite.png' },

        ];
        return config;
    }
}

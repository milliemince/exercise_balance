import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;

class HomePageView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.HomePageLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        //View.onUpdate(dc);

        var app = Application.getApp();

        //trying to set these properties on app initialization
        // app.setProperty("EXERCISES", ["upper-body", "lower-body", "full-body", "tennis", "run", "bike", "other"]);
        // app.setProperty("EXERCISE_DICTIONARY", {"upper-body"=>2, "lower-body"=>1, "full-body"=>0, "run"=>0, "bike"=>1, "tennis"=>1, "other"=>0});
        // app.setProperty("EXERCISE_COLOR", {"upper-body"=>Graphics.COLOR_RED, "lower-body"=>Graphics.COLOR_BLUE,
        // "full-body"=>Graphics.COLOR_PURPLE, "run"=>Graphics.COLOR_ORANGE, "bike"=>Graphics.COLOR_YELLOW,
        // "tennis"=>Graphics.COLOR_GREEN, "other"=>Graphics.COLOR_PINK});
        
        //hard-code exercise counts for now
        // var upperBody = 2;
        // var lowerBody = 1;
        // var fullBody = 0;
        // var tennis = 1;
        // var run = 0;
        // var bike = 1;
        // var other = 0;

    
        // var exercises = ["upper-body", "lower-body", "full-body", "tennis", "run", "bike", "other"];
        // var exercise_dictionary = {"upper-body"=>2, "lower-body"=>1, "full-body"=>0, "run"=>0, "bike"=>1, "tennis"=>1, "other"=>0};
        // var exercise_color = {"upper-body"=>Graphics.COLOR_RED, "lower-body"=>Graphics.COLOR_BLUE,
        // "full-body"=>Graphics.COLOR_PURPLE, "run"=>Graphics.COLOR_ORANGE, "bike"=>Graphics.COLOR_YELLOW,
        // "tennis"=>Graphics.COLOR_GREEN, "other"=>Graphics.COLOR_PINK};

        var exercises = app.getProperty("EXERCISES");
        var exercise_dictionary = app.getProperty("EXERCISE_DICTIONARY");
        var exercise_color = app.getProperty("EXERCISE_COLOR");

        //home page design
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);

        dc.clear();

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

        //Last 7 Days Text Header
        dc.drawText(
            dc.getWidth() / 2,                      // gets the width of the device and divides by 2
            20,                                     // gets the height of the device and divides by 2
            Graphics.FONT_SMALL,                    // sets the font size
            "Last 7 Days",                          // the String to display
            Graphics.TEXT_JUSTIFY_CENTER            // sets the justification for the text
        );

        //graph 
        var strength = exercise_dictionary["lower-body"] + exercise_dictionary["upper-body"] + exercise_dictionary["full-body"];
        var cardio = exercise_dictionary["run"] + exercise_dictionary["bike"] + exercise_dictionary["tennis"] + exercise_dictionary["other"];
        var total = strength + cardio;

        var bar_height = {};

        //System.println(total);

        if (total != 0) {
            for (var i = 0; i < exercises.size(); i++) {
            var count = exercise_dictionary[exercises[i]];
            //System.println(count);
            bar_height.put(exercises[i], count.toFloat()/total);
        }

        //System.println(bar_height);

        var x = 80;
        var y = 80;
        for (var i = 0; i < exercises.size(); i++) {
            if (exercise_dictionary[exercises[i]] != 0) {
                dc.setColor(exercise_color[exercises[i]], Graphics.COLOR_BLACK);
                dc.fillRectangle(x, y, 25, bar_height.get(exercises[i]) * 225);
                y += bar_height.get(exercises[i]) * 225;
            }
        }

        // print individual exercise counts on the right
        var xr = 130;
        var yr = 80;
        for (var i = 0; i < exercises.size(); i++) {
            dc.setColor(exercise_color[exercises[i]], Graphics.COLOR_BLACK);
            dc.fillRectangle(xr, yr, 10, 20);
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
            dc.drawText(
                xr+20,
                yr-5,
                Graphics.FONT_XTINY, 
                exercises[i] + ", " + exercise_dictionary[exercises[i]],               
                Graphics.TEXT_JUSTIFY_LEFT     
            );
            yr += 33.3;
        }
        } else {
            //do nothing
        }

        //draw add exercise button
        dc.setColor(Graphics.COLOR_DK_GREEN, Graphics.COLOR_BLACK);
        dc.drawCircle(360, 185, 50);

        //uncomment to make circle green
        //dc.fillCircle(360, 185, 50);

        //add plus sign!
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}

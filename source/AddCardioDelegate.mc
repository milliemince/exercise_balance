import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Application;

class AddCardioDelegate extends WatchUi.InputDelegate {

    function initialize() {
        InputDelegate.initialize();
    }

    function incrementSubtype(exercise) {
        //get current dictionary
        var app = Application.getApp();
        var exercise_dictionary = app.getProperty("EXERCISE_DICTIONARY");
                
        //increment value for exercise
        var incremented = exercise_dictionary[exercise] + 1;
        exercise_dictionary[exercise] = incremented;

        //reset app property with updated value
        app.setProperty("EXERCISE_DICTIONARY", exercise_dictionary);
    }

    function onTap(clickEvent) {
        var coordinate = clickEvent.getCoordinates(); // e.g. [36, 40]
        //System.println(coordinate);
        //var app = Application.getApp();
        if (coordinate[0] <= 175) {
            if (coordinate[1] <= 175) {
                System.println("Increment run");
                incrementSubtype("run");
            } else {
                System.println("Increment bike");
                incrementSubtype("bike");
            }
        } else {
            if (coordinate[1] <= 175) {
                System.println("Increment tennis");
                incrementSubtype("tennis");
            } else {
                System.println("Increment other");
                incrementSubtype("other");
            }
        }
    }

    // function onTap(clickEvent) {
    //     var coordinate = clickEvent.getCoordinates(); // e.g. [36, 40]
    //     if (coordinate[1] >= 80 and coordinate[1] <= 160) {
    //         //push recommendations view
    //         System.println("Switching to Add Strength View");
    //         WatchUi.pushView(new AddCardioView(), new AddCardioDelegate(), WatchUi.SWIPE_LEFT);
    //     } else if (coordinate[1] >= 200 and coordinate[1] <= 280) {
    //         //push history view
    //         System.println("Switching to Add Cardio View");
    //         WatchUi.pushView(new HistoryView(), new HistoryDelegate(), WatchUi.SWIPE_LEFT);
    //     }
    //     return true;
    // }

}
import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class exercise_balanceApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
        var app = Application.getApp();
        app.setProperty("EXERCISES", ["upper-body", "lower-body", "full-body", "tennis", "run", "bike", "other"]);
        app.setProperty("EXERCISE_DICTIONARY", {"upper-body"=>0, "lower-body"=>0, "full-body"=>0, "run"=>0, "bike"=>0, "tennis"=>0, "other"=>0});
        app.setProperty("EXERCISE_COLOR", {"upper-body"=>Graphics.COLOR_RED, "lower-body"=>Graphics.COLOR_BLUE,
        "full-body"=>Graphics.COLOR_PURPLE, "run"=>Graphics.COLOR_ORANGE, "bike"=>Graphics.COLOR_YELLOW,
        "tennis"=>Graphics.COLOR_GREEN, "other"=>Graphics.COLOR_PINK});
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new HomePageView(), new HomePageDelegate() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as exercise_balanceApp {
    return Application.getApp() as exercise_balanceApp;
}
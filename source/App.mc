import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class exercise_balanceApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
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
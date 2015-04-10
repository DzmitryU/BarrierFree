package by.ulezla.exception;


public class HTreeBuildingException extends Exception {
    public HTreeBuildingException(String message) {
        super("Unable to include following object to HTree: " + message);
    }
}

